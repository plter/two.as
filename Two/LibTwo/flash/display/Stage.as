package flash.display {
    import com.plter.two.app.Two;

    public class Stage extends DisplayObjectContainer {

        private var _two:Two;

        public function Stage() {
            _two = new Two();
        }

        public function get two():Two {
            return _two;
        }

        public function get domElement():* {
            return _two.domElement;
        }

        public function set showFps(v:Boolean):void {
            _two.showFps = v;
        }

        public function get showFps():Boolean {
            return _two.showFps;
        }
    }
}
