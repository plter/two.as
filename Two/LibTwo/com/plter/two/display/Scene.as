/**
 * Created by plter on 3/12/16.
 */
package com.plter.two.display {
    import com.plter.two.app.Context;
    import com.plter.two.events.EventListenerList;
    import com.plter.two.supports.threejs.THREE;

    public class Scene extends ContainerBase {

        private var _onUpdate:EventListenerList = new EventListenerList();

        public function Scene(context:Context) {
            super(context, new THREE.Scene());
        }

        public function update(timestamp:uint):void {
        }


        public function onClick(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        }

        public function onContextMenu(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        }

        public function onDoubleClick(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        }

        public function onMouseDown(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        }

        public function onMouseEnter(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        }

        public function onMouseLeave(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        }

        public function onMouseMove(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        }

        public function onMouseOut(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        }

        public function onMouseOver(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        }

        public function onShow(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        }

        public function onTouchCancel(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        }

        public function onTouchEnd(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        }

        public function onTouchEnter(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        }

        public function onTouchLeave(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        }

        public function onTouchMove(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        }

        public function onTouchStart(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        }


        public function internal_onUiEvent(eventType:String, x:Number, y:Number, e:MouseEvent):void {
            switch (eventType) {
                case "click":
                    onClick(eventType, x, y, e);
                    break;
                case "contextmenu":
                    onContextMenu(eventType, x, y, e);
                    break;
                case "dblclick":
                    onDoubleClick(eventType, x, y, e);
                    break;
                case "mousedown":
                    onMouseDown(eventType, x, y, e);
                    break;
                case "mouseenter":
                    onMouseEnter(eventType, x, y, e);
                    break;
                case "mouseleave":
                    onMouseLeave(eventType, x, y, e);
                    break;
                case "mousemove":
                    onMouseMove(eventType, x, y, e);
                    break;
                case "mouseout":
                    onMouseOut(eventType, x, y, e);
                    break;
                case "mouseover":
                    onMouseOver(eventType, x, y, e);
                    break;
                case "show":
                    onShow(eventType, x, y, e);
                    break;
                case "touchcancel":
                    onTouchCancel(eventType, x, y, e);
                    break;
                case "touchend":
                    onTouchEnd(eventType, x, y, e);
                    break;
                case "touchenter":
                    onTouchEnter(eventType, x, y, e);
                    break;
                case "touchleave":
                    onTouchLeave(eventType, x, y, e);
                    break;
                case "touchmove":
                    onTouchMove(eventType, x, y, e);
                    break;
                case "touchstart":
                    onTouchStart(eventType, x, y, e);
                    break;
            }
        }

        public function get onUpdate():EventListenerList {
            return _onUpdate;
        }
    }
}
