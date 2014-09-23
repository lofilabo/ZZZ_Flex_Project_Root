package vob
{
	import mx.containers.Panel;
	import flash.events.MouseEvent;
	
	import mx.containers.Panel;
	import mx.controls.Button;
	
	import mx.controls.Menu;
	import mx.controls.MenuBar;
	import mx.accessibility.MenuAccImpl;
	import mx.collections.*;
	import mx.controls.TextArea;
	import flash.events.Event;
	import mx.events.MenuEvent;	
	import src.mgr;
	
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager
	
	
	[Event(name="titleBtnClick", type="flash.events.MouseEvent")]
	
	public class mainPanel1 extends Panel
	{
		
		private var _titleBtn:Button=new Button();
		public var _incm:mgr;
		public var loStyle:CSSStyleDeclaration = new CSSStyleDeclaration;
		
				public function mainPanel1(){
					super();
					
				}
				
				public function mgrWireUp(incm:mgr){
					this._incm = incm;
				}
				
				// this method is called during the initialize phase 
				// and is used to create the interface
				override protected function createChildren() : void{
				
					super.createChildren();
					//var mainMenu1:mainPanel1_menu1=new mainPanel1_menu1();
					//titleBar.addChild(mainMenu1);
					//mainMenu1.show(10,10);


					var menuBarCollection = new XMLListCollection(menuData());
					//var hjkh:MenuBar = MenuBar.createMenu(incm, menu_XML, true);
					var hjkh:MenuBar = new MenuBar;
					hjkh.addEventListener(MouseEvent.CLICK, onMouseClick);
					hjkh.dataProvider = menuBarCollection;
					hjkh.showRoot=true;
					hjkh.labelField ="@label";
					hjkh.addEventListener(MenuEvent.ITEM_CLICK, menuHandler);
					
					loStyle.setStyle("borderColor", 0xff0000);
					
					
					hjkh.styleDeclaration=loStyle;					
					//this.addChild(hjkh);
					hjkh.x=10;
					hjkh.y=4;
					hjkh.width = 400;
					hjkh.height = 20;
					
					
					_titleBtn.visible=false
					_titleBtn.height=22;
					_titleBtn.width=22;
					_titleBtn.addEventListener(MouseEvent.CLICK,handleTitleBtnClick)
					//titleBar.addChild(_titleBtn);
					titleBar.addChild(hjkh);
					
					
				}
				
				function onMouseClick(e:Event){
				
				}
				
				// this method is used every time there is a change in the DisplayList
				// to move and reorganize the interface
				override protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number):void{
					
					super.updateDisplayList(unscaledWidth, unscaledHeight);
					var y:int = 4;
					var x:int = this.width - _titleBtn.width - 12;
					_titleBtn.move(x, y);
				}
				
				
				
				private function handleTitleBtnClick(e:MouseEvent):void{
					var event:mainPanel1_customMouseEevent=new mainPanel1_customMouseEevent('titleBtnClick',e);
					dispatchEvent(event);
				}

				private function menuData():XMLList{
					var menu_XML:XMLList;
					var str_menu_XML:String;
		    

			
					str_menu_XML = '' + 
							'<menuitem  label="管理情報">' + 
							'	<menuitem data="1" label="label 1"/>' + 
							'' + 
							'</menuitem>' 
							 
					
					menu_XML = XMLList(str_menu_XML);
					return menu_XML;
				}

				public function menuHandler(e:MenuEvent){
					//trace(e.item.@data);
					this._incm.handleTitleBarMenu(e.item.@data);
				}
	
	}
}