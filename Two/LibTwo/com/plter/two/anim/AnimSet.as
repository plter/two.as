package com.plter.two.anim {

    import org.apache.royale.html.elements.A;

    public class AnimSet {

        private var _animSet:Array = [];
        private var _completeHandler:Function = null;

        public static const ANIM_MODE_ONE_BY_ONE:int = 1;
        public static const ANIM_MODE_TOGETHER:int = 2;
        private var _mode:int = ANIM_MODE_TOGETHER;

        public function AnimSet(completeHandler:Function, ... args) {
            _completeHandler = completeHandler;
            for each (var a:PropertyAnim in args) {
                _animSet.push(a);
            }
        }

        public function get mode():int {
            return _mode;
        }

        public function set mode(v:int):void {
            _mode = v;
        }

        public function start():void {
            if (mode == ANIM_MODE_ONE_BY_ONE) {
                oneByOne();
            } else {
                together();
            }
        }

        public function oneByOne():void {
            var index:int = 0;

            var self:AnimSet = this;
            function run():void {
                if (index >= _animSet.length) {
                    if (completeHandler) {
                        completeHandler(self);
                    }
                    return;
                }
                var anim:PropertyAnim = _animSet[index];
                anim.completeHandler = run;
                anim.start();
                index++;
            };

            run();
        }

        public function together():void {
            var count:int = 0;
            var self:AnimSet = this;
            function handler():void {
                count++;
                if (count >= _animSet.length) {
                    if (completeHandler) {
                        completeHandler(self);
                    }
                }
            }

            for each (var a:PropertyAnim in _animSet) {
                a.completeHandler = handler;
                a.start();
            }
        }

        public function set completeHandler(v:Function):void {
            _completeHandler = v;
        }

        public function get completeHandler():Function {
            return _completeHandler;
        }
    }
}
