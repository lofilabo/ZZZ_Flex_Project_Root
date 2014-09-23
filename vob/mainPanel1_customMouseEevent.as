package vob
{
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class mainPanel1_customMouseEevent extends MouseEvent
	{
			//this is the constructor method, its function is to change the name of the MouseEvent;
			public function mainPanel1_customMouseEevent(type:String,e:MouseEvent)
			{
				super(type, e.bubbles, e.cancelable,e.localX,e.localY,e.relatedObject,e.ctrlKey,e.altKey,e.shiftKey,e.buttonDown,e.delta);
				
			}
			override public function clone():Event{
				return super.clone();
			}
	
	}
}