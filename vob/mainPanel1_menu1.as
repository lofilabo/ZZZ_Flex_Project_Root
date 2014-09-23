package vob
{
	import mx.controls.Menu;
	import mx.controls.MenuBar;
	import mx.accessibility.MenuAccImpl;
	import mx.collections.*;
	

	public class mainPanel1_menu1 extends MenuBar
	{
		
		public function mainPanel1_menu1(){
			
			var menu_XML:XMLList;
			var str_menu_XML:String;
    
    		
	
			str_menu_XML = '' + 
					'<><menuitem  label="item 1" /></>' 
			
					'<root>' + 
					'<menuitem label="MenuItem A" >' + 
					'	<menuitem label="SubMenuItem A-1" enabled="false"/>' + 
					'	<menuitem label="SubMenuItem A-2"/>' + 
					'</menuitem>' + 
					'<menuitem label="MenuItem D" >' + 
					' 	<menuitem label="SubMenuItem D-1" type="radio" groupName="one"/> ' + 
					' 	<menuitem label="SubMenuItem D-2" type="radio" groupName="one" toggled="true"/>' + 
					'</menuitem>' + 
					'</root>';
			
			menu_XML = XMLList(str_menu_XML);
			var menuBarCollection = new XMLListCollection(menu_XML);
			//var hjkh:MenuBar = MenuBar.createMenu(incm, menu_XML, true);
			var hjkh:MenuBar = new MenuBar;
			this.dataProvider = menuBarCollection;
			this.labelField ="@label";
			//hjkh.show(40, 20);
			//return hjkh;
			//incm.titlebar.addChild(hjkh);
		}
		
	}
}