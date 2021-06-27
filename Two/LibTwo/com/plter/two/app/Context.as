/**
 * Created by plter on 3/12/16.
 */
package com.plter.two.app {
    import com.plter.two.supports.threejs.THREE;
    import com.plter.two.display.TNode;
    import com.plter.two.display.Scene;

    public class Context {

        private var _stage:Stage;
        private var _camera:*;
        private var _raycaster:* = null;
        private var _raycasterHitTestPointer:* = null;

        public function Context() {
            _stage = new Stage();
        }

        public function get stage():Stage {
            return _stage;
        }

        public function get camera():* {
            return _camera;
        }

        public function set camera(value:*):void {
            _camera = value;
        }

        public function get raycaster():* {
            if (!_raycaster) {
                _raycaster = new THREE.Raycaster();
            }
            return _raycaster;
        }

        private function get raycasterHitTestPointer():* {
            if (!_raycasterHitTestPointer) {
                _raycasterHitTestPointer = new THREE.Vector2();
            }
            return _raycasterHitTestPointer;
        }

        public function tNodeHitTestPoint(x:Number, y:Number, display:TNode):Boolean {
            raycasterHitTestPointer['x'] = x;
            raycasterHitTestPointer['y'] = y;

            raycaster['setFromCamera'](raycasterHitTestPointer, camera);
            var intersects:Array = raycaster['intersectObject'](display.object3D);
            return intersects.length;
        }

        public function getObjectsAtPoint(scene:Scene, x:Number, y:Number):Array {
            raycasterHitTestPointer['x'] = x;
            raycasterHitTestPointer['y'] = y;
            raycaster['setFromCamera'](raycasterHitTestPointer, camera);
            var intersects:Array = raycaster['intersectObjects'](scene.object3D['children']);
            var result:Array = [];
            for each (var value:* in intersects) {
                var node:TNode = value['object']['node'];
                node['relatedInfo'] = value;
                result.push(node);
            }
            return result;
        }
    }
}
