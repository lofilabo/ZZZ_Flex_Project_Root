package src.amf
{
	import src.amf.RemotingConnection;	import flash.net.Responder;
	import src.mgr;
	
	public class amfphp
	{
		public var dataProvider:Array;
		public var gateway:RemotingConnection;
		public var _incm:mgr;
		
    
    	public function testCall(incm:mgr, data:Object){
			this._incm=incm;
			gateway = new  RemotingConnection(incm._svrRoot + "/gateway.php");
			//trace("base_url ::" + this._incmc._baseURL )
			gateway.call( "services1.day", new Responder(onResult, onFault), incm);
    		
    	}
 
   		public function loginCall(incm:mgr, data:Object){
			this._incm=incm;
			gateway = new  RemotingConnection(incm._svrRoot + "/gateway.php");
			gateway.call( "services1.login", new Responder(this._incm.onResult_logincheck, onFault), data);
    		
    	}
       
   		
    

		public function onResult( result:Object ) : void{
			trace(result);
		}
		public function onFault( fault:Object ) : void{
			//trace( fault );
			var emess:String = fault.description;
		}		
		
	}
}