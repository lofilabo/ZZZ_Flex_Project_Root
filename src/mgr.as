package src
{
	import src.amf.amfphp;
	import mx.controls.Alert;
	
	
	public class mgr
	{
		public var _incoming:ZZZ_Flex_Project_Root;
		public var _priv:Object;
		public var _uid:int;
		public var _svrRoot:String;
		
		public function mgr():void{
		}

		public function incm(incoming:ZZZ_Flex_Project_Root):void{

			var params:Object;
			params=incoming.parameters;
			this._svrRoot = params.svrRoot;
			this._incoming = incoming;

			var myAmf:amfphp = new amfphp();
			var passdata:Array = new Array;
			passdata.push(88);
			myAmf.testCall(this,passdata);
		}


		public function logincheck(){
			var unm:String;
			var lgn:String;
			unm = this._incoming.unm.text;
			lgn = this._incoming.lgn.text;
			
			var myAmf:amfphp = new amfphp();
			var passdata:Array = new Array;
			passdata.push(unm);
			passdata.push(lgn);
			myAmf.loginCall(this, passdata);
		}

		public function onResult_logincheck( result:Object ) : void{
			
			if(result != null){
				if(result.length > 0){
					this._priv = result;
					this._uid = this._priv[0].id;
					this._incoming.loginboxHolder.width=0;
					this._incoming.loginboxHolder.height=0;
					this._incoming.mainPanel.percentHeight = 100;
					this._incoming.mainPanel.percentWidth = 100;
					this._incoming.mainPanel.visible=true;
					this._incoming.mainPanel.mgrWireUp(this);
					
				}
			}else{
				var myAlert:Alert = Alert.show("Login Failed", "", Alert.YES, null)
				myAlert.validateNow();
	            myAlert.move(720,200);        
				this._incoming.unm.text = "";
				this._incoming.lgn.text = "";
				this._incoming.unm.getFocus();
			}
		}

		public function handleTitleBarMenu(dataItem:Object):void{
			trace(dataItem);
			var s:String;
			var i:int;
			s = String(dataItem);
			i=parseInt(s);
			
			switch(i){
				case 1:
					break;		
	
	
	
			}
			
		
		}

	}
}