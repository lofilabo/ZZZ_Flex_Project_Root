package vob
{
	import mx.containers.Panel;
	import mx.core.UIComponent;
	import mx.core.SpriteAsset;
	import mx.events.FlexEvent;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import mx.core.IFlexDisplayObject;

	public class DragPanel extends Panel implements IFlexDisplayObject
	{
		// Add the creationCOmplete event handler.
		
		public function makeBig():void{
			if (isMinimized == true)
			{   
				this.makeBig2();
			}		
		}
		
		private function makeBig2():void{
			if (isMinimized == true)
			{
			    isMinimized = false;
				height = 130;
					
				// Allow resizing in restored state.				
				addEventListener(MouseEvent.MOUSE_DOWN, resizeHandler);
			}		
		}
		
		
		public function makeSmall():void{
				this.makeSmall2();
		}
		
		private function makeSmall2():void{
			    isMinimized = true;
				height = 30;
				addEventListener(MouseEvent.MOUSE_DOWN, resizeHandler);
		}
		
		
		public function DragPanel()
		{
			super();
			addEventListener(FlexEvent.CREATION_COMPLETE, creationCompleteHandler);
		}
		
		private var myTitleBar:UIComponent;
					
		private function creationCompleteHandler(event:Event):void
		{
			myTitleBar = titleBar;			
			// Add the resizing event handler.	
			addEventListener(MouseEvent.MOUSE_DOWN, resizeHandler);
			myTitleBar.addEventListener(MouseEvent.MOUSE_DOWN, tbMouseDownHandler);
			myTitleBar.addEventListener(MouseEvent.MOUSE_UP, tbMouseUpHandler);
			myRestoreHeight = height;	
			height = height;
			isMinimized = false;	
			//height = titleBar.height;
			//isMinimized = true;				
		}
		
		private var xOff:Number;
       	private var yOff:Number;
            
		private function tbMouseDownHandler(event:MouseEvent):void {
			
                xOff = event.currentTarget.mouseX;
                yOff = event.currentTarget.mouseY;
                parent.addEventListener(MouseEvent.MOUSE_MOVE, tbMouseMoveHandler);
                parent.setChildIndex(this,parent.numChildren-1); 
                
            }
            
       private function tbMouseMoveHandler(event:MouseEvent):void {
			
			// Compensate for the mouse pointer's location in the title bar.
			
			var tempX:int = parent.mouseX - xOff - 30;
			x = tempX;
			
			var tempY:int = parent.mouseY - yOff - 30;
			y = tempY;	
					
        }
        
        private function tbMouseUpHandler(event:MouseEvent):void {
           parent.removeEventListener(MouseEvent.MOUSE_MOVE, tbMouseMoveHandler);    
        }
		
		
		

		protected var minShape:SpriteAsset;
		protected var restoreShape:SpriteAsset;
		protected var closeShape:SpriteAsset;

		override protected function createChildren():void
		{
				super.createChildren();
			
			// Create the SpriteAsset's for the min/restore icons and 
			// add the event handlers for them.
			minShape = new SpriteAsset();
			minShape.addEventListener(MouseEvent.MOUSE_DOWN, minPanelSizeHandler);
			titleBar.addChild(minShape);

			restoreShape = new SpriteAsset();
			restoreShape.addEventListener(MouseEvent.MOUSE_DOWN, restorePanelSizeHandler);
			titleBar.addChild(restoreShape);

			closeShape = new SpriteAsset();
			closeShape.addEventListener(MouseEvent.MOUSE_DOWN, closePanelHandler);
			titleBar.addChild(closeShape);
		}

			
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			// Create invisible rectangle to increase the hit area of the min icon.
			minShape.graphics.clear();
			minShape.graphics.lineStyle(0, 0, 0);
			minShape.graphics.beginFill(0xFFFFFF, 0.0);
			minShape.graphics.drawRect(unscaledWidth - 35, 12, 8, 8);

			// Draw min icon.
			minShape.graphics.lineStyle(2);
			minShape.graphics.beginFill(0xFFFFFF, 0.0);
			minShape.graphics.drawRect(unscaledWidth - 50, 18, 8, 2);
				
			// Draw close icon.
			closeShape.graphics.lineStyle(2);
			closeShape.graphics.beginFill(0x000000, 1);
			closeShape.graphics.drawRect(unscaledWidth - 20, 12, 8, 8);
			// Draw restore icon.
			restoreShape.graphics.clear();
			restoreShape.graphics.lineStyle(2);
			restoreShape.graphics.beginFill(0xFFFFFF, 0.0);
			restoreShape.graphics.drawRect(unscaledWidth - 35, 12, 8, 8);
			restoreShape.graphics.moveTo(unscaledWidth - 35, 15);
			restoreShape.graphics.lineTo(unscaledWidth - 27, 15);

			// Draw resize graphics if not minimzed.				
			graphics.clear()
			if (isMinimized == false)
			{
				graphics.lineStyle(2);
				graphics.moveTo(unscaledWidth - 6, unscaledHeight - 1)
				graphics.curveTo(unscaledWidth - 3, unscaledHeight - 3, unscaledWidth - 1, unscaledHeight - 6);						
				graphics.moveTo(unscaledWidth - 6, unscaledHeight - 4)
				graphics.curveTo(unscaledWidth - 5, unscaledHeight - 5, unscaledWidth - 4, unscaledHeight - 6);						
			}
			
			
			
			
		}
					
		private var myRestoreHeight:int;
		private var isMinimized:Boolean = false; 
					
		// Minimize panel event handler.
		private function minPanelSizeHandler(event:Event):void
		{
			if (isMinimized != true)
			{
				myRestoreHeight = height;	
				height = titleBar.height;
				isMinimized = true;	
				// Don't allow resizing when in the minimized state.
				removeEventListener(MouseEvent.MOUSE_DOWN, resizeHandler);
			}				
		}
		
		// Restore panel event handler.
		private function restorePanelSizeHandler(event:Event):void
		{
		    
		
			if (isMinimized == true)
			{
				height = myRestoreHeight;
				isMinimized = false;	
				// Allow resizing in restored state.				
				addEventListener(MouseEvent.MOUSE_DOWN, resizeHandler);
			}
		}

        public function closePanelHandler(event:Event):void{
            
            //trace ("OK; you got here");
			myTitleBar.removeEventListener(MouseEvent.MOUSE_DOWN, tbMouseDownHandler);
			myTitleBar.removeEventListener(MouseEvent.MOUSE_UP, tbMouseUpHandler);
			parent.removeEventListener(MouseEvent.MOUSE_MOVE, tbMouseMoveHandler);
            closePanelHandlerHandler();
        }

		public function closePanelHandlerHandler():void{
            //trace ("OK; and now you got here");
        }

		// Define static constant for event type.
		//public static const RESIZE_CLICK:String = "resizeClick";

		// Resize panel event handler.
		private var origWidth:int;
		private var origHeight:int;
		
		public  function resizeHandler(event:MouseEvent):void
		{
			// Determine if the mouse pointer is in the lower right 7x7 pixel
			// area of the panel. Initiate the resize if so.
			
			// Lower left corner of panel
			var lowerLeftX:Number = x + width; 
			var lowerLeftY:Number = y + height;
				
			// Upper left corner of 7x7 hit area
			var upperLeftX:Number = lowerLeftX-7;
			var upperLeftY:Number = lowerLeftY-7;
				
			// Mouse positionin Canvas
			var panelRelX:Number = event.localX + x;
			var panelRelY:Number = event.localY + y;

			// See if the mousedown is in the lower right 7x7 pixel area
			// of the panel.
			if (upperLeftX <= panelRelX && panelRelX <= lowerLeftX)
			{
				if (upperLeftY <= panelRelY && panelRelY <= lowerLeftY)
				{	
				
					
					event.stopPropagation();		
					
					origWidth = width;
					origHeight = height;
					xOff = parent.mouseX;
                	yOff = parent.mouseY;
					parent.addEventListener(MouseEvent.MOUSE_MOVE, resizePanel);
					parent.addEventListener(MouseEvent.MOUSE_UP, stopResizePanel);
					
				}
			}				
		}
		
		private function resizePanel(event:MouseEvent):void {
			
			if ((origWidth + (parent.mouseX - xOff)) > 250){
				width = origWidth + (parent.mouseX - xOff);	
			}
			
			if ((origHeight + (parent.mouseY - yOff)) > titleBar.height){
				height = origHeight + (parent.mouseY - yOff);
			}
					
		}
		
		private function stopResizePanel(event:MouseEvent):void {
            try{
                parent.removeEventListener(MouseEvent.MOUSE_MOVE, resizePanel);
                //throw new Error("Aaargh");
            }catch(e:Error){
                //trace(e);
            }
		}
		
		
	}
}