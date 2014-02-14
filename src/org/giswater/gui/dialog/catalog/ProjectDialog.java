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
 *   David Erill <daviderill79@gmail.com>
 */
package org.giswater.gui.dialog.catalog;

import java.awt.Color;
import java.awt.Font;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

import net.miginfocom.swing.MigLayout;


public class ProjectDialog extends AbstractCatalogDialog {

	private static final long serialVersionUID = -6349825417550216902L;
	private JTextField textField;
	private JTextField textField_1;
	private JTextField textField_2;
	
	
	public ProjectDialog() {
		initConfig();
		createComponentMap();
	}
	
	
	private void initConfig(){

		setTitle("Table inp_project_id");
		setBounds(0, 0, 344, 206);
		getContentPane().setLayout(new MigLayout("", "[90.00][392.00]", "[113.00][5px][30.00]"));
		
		JPanel panelGeneral = new JPanel();
		panelGeneral.setFont(new Font("Tahoma", Font.BOLD, 14));
		panelGeneral.setBorder(new TitledBorder(new LineBorder(new Color(0, 0, 0)), "GENERAL", TitledBorder.CENTER, TitledBorder.TOP, null, null));
		getContentPane().add(panelGeneral, "cell 0 0 2 1,growy");
		panelGeneral.setLayout(new MigLayout("", "[60][115.00:237.00,grow]", "[25px:n][][10px:n]"));
		
		JLabel lblStatistic = new JLabel("Title:");
		panelGeneral.add(lblStatistic, "cell 0 0,alignx trailing");
		
		textField = new JTextField();
		textField.setName("title");
		panelGeneral.add(textField, "cell 1 0,growx");
		textField.setColumns(10);
		
		JLabel lblAuthor = new JLabel("Author:");
		panelGeneral.add(lblAuthor, "cell 0 1,alignx trailing");
		
		textField_1 = new JTextField();
		textField_1.setName("author");
		textField_1.setColumns(10);
		panelGeneral.add(textField_1, "cell 1 1,growx");
		
		JLabel lblDate = new JLabel("Date:");
		panelGeneral.add(lblDate, "cell 0 2,alignx trailing");
		
		textField_2 = new JTextField();
		textField_2.setName("date");
		textField_2.setColumns(10);
		panelGeneral.add(textField_2, "cell 1 2,growx");
		
		ImageIcon image = new ImageIcon("images/imago.png");        
		super.setIconImage(image.getImage());
		
		btnSave = new JButton("Save");
		btnSave.setToolTipText("Save record");
		btnSave.setActionCommand("saveData");		
		getContentPane().add(btnSave, "cell 1 2,alignx right");		

		btnClose = new JButton("Close");
		btnClose.setToolTipText("Close window");
		btnClose.setActionCommand("closeWindow");
		getContentPane().add(btnClose, "cell 1 2,alignx right");		
		
		setupListeners();
		
	}


}