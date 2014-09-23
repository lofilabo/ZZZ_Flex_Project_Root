package src.amf
{
	import flash.net.NetConnection;
	import flash.net.ObjectEncoding;

	public class RemotingConnection extends NetConnection{
		
		public function RemotingConnection( sURL:String ){
			objectEncoding = ObjectEncoding.AMF0;
			this.AppendToGatewayUrl("ugh");
			if (sURL) connect( sURL );
		}
		public function AppendToGatewayUrl( s : String ) : void{
		//
		}		
		
	}
}