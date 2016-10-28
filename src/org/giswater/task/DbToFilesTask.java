/*
 * This file is part of Giswater
 * Copyright (C) 2013 Tecnics Associats
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 * 
 * Author:
 *   David Erill <derill@giswater.org>
 */
package org.giswater.task;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.io.FileUtils;
import org.giswater.dao.MainDao;
import org.giswater.gui.MainClass;
import org.giswater.util.Utils;


public class DbToFilesTask extends ParentSchemaTask {
	
	private String folderRoot;


	public DbToFilesTask(String waterSoftware, String currentSchemaName, String schemaName) {
		super(waterSoftware, schemaName);
		this.currentSchemaName = currentSchemaName;	
		this.folderRoot = Utils.getAppPath()+File.separator+"model_from_db";			
	}
	
	
    @Override
    public Void doInBackground() { 
		
    	setProgress(1);
    	
    	// Disable view
    	Utils.setPanelEnabled(parentPanel, false);
    	
    	// Delete files from folder
    	File folder = new File(this.folderRoot);
    	try {
			FileUtils.cleanDirectory(folder);
		} catch (IOException e) {
			Utils.logError(e);
		}     	
		
		// Process functions
    	status = processPattern(FILE_PATTERN_FCT);

		// Process triggers
    	status = processPattern(FILE_PATTERN_TRG);
    	
		// Refresh view
		controller.selectSourceType(false);			
    	Utils.setPanelEnabled(parentPanel, true);
    	parentPanel.setSelectedSchema(schemaName);
		
		return null;
    	
    }

    
    private boolean processPattern(String pattern) {
    	
		String sql;
		sql = "SELECT routine_name, specific_name, routine_type, type_udt_schema, type_udt_name, routine_definition";
		sql+= " FROM information_schema.routines";
		sql+= " WHERE routine_schema = '"+this.currentSchemaName+"'";
		sql+= " AND routine_name like '%"+pattern+"%'";
		sql+= " ORDER BY routine_name";
		ResultSet rs = MainDao.getResultset(sql);
        try {
			while (rs.next()) {
				processFunction(rs);
			}
			rs.close();		
		} catch (SQLException e) {
			Utils.logError(e);
			return false;
		}
    	return true;
        
    }
    
    
    private void processFunction(ResultSet rsFunction) throws SQLException {

		String header = "CREATE OR REPLACE FUNCTION \""+this.currentSchemaName+"\".\""+rsFunction.getString("routine_name")+"\"(";
		String headerEnd = "RETURNS "+rsFunction.getString("type_udt_schema")+"."+rsFunction.getString("type_udt_name")+" AS $BODY$";
		String footer = "$BODY$\nLANGUAGE 'plpgsql' VOLATILE COST 100;";
		
		// Get parameters
    	String params = "";
    	String content = "";
    	String sql;
    	sql = "SELECT ordinal_position, parameter_name, udt_name" + 
    		" FROM information_schema.parameters" + 
    		" WHERE specific_schema = '"+this.currentSchemaName+"'" +
    		" AND specific_name = '"+rsFunction.getString("specific_name")+"'" +
    		" ORDER BY ordinal_position";
		ResultSet rs = MainDao.getResultset(sql);
		while (rs.next()) {
			params+= rs.getString("parameter_name")+" "+rs.getString("udt_name")+", ";
		}
		
		// Get content
		if (params != "") {
			params = params.substring(0, params.length() - 2);
		}
		params+= ") ";
		content = header+params+headerEnd+rsFunction.getString("routine_definition")+footer+"\n\n";
		content = content.replace("\""+this.currentSchemaName+"\"", "\"SCHEMA_NAME\"");
		content = content.replace("\t", "    ");
		rs.close();	
		
		String folderPath = this.folderRoot+File.separator;
		String filePath = folderPath+rsFunction.getString("routine_name")+".sql";
		Utils.logInfo("Generating file: "+filePath);
		
		OutputStreamWriter osw;
		FileOutputStream fos;
		try {
			fos = new FileOutputStream(filePath, false);
			osw = new OutputStreamWriter(fos, "UTF-8");
			osw.write("\uFEFF");
			osw.write(content);
			osw.close();
			fos.close();		
		} catch (Exception e) {
			Utils.logError(e);
		}
			
    }
    
    
    public void done() {
    	
    	MainClass.mdi.setProgressBarEnd();
    	if (status) {
    		MainClass.mdi.showMessage(Utils.getBundleString("MainDao.project_updated")); 
    		MainClass.mdi.updateConnectionInfo();    		
    	}
    	else {
    		MainClass.mdi.showError(Utils.getBundleString("MainDao.project_not_updated"));
    	}
		
    }

    
}