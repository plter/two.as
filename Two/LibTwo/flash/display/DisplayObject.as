package flash.display {
    import flash.events.EventDispatcher;
    import com.plter.two.display.TNode;

    public class DisplayObject extends EventDispatcher {
        public function DisplayObject() {

        }

        private static var __stage:Stage = null;

        public function get stage():Stage {
            if (!__stage) {
                __stage = new Stage();
            }
            return __stage;
        }

        private var _tNode:* = null;

        internal function set threejsObject(n:*):void {
            _tNode = n;
        }

        internal function get threejsObject():* {
            return _tNode;
        }
    }
}
