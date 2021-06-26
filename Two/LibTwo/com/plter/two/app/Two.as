/**
 * Created by plter on 3/11/16.
 */
package com.plter.two.app {
    import com.plter.two.display.Scene;
    import com.plter.two.supports.threejs.THREE;

    public class Two extends Context {

        private var _renderer:*;
        private var _currentScene2D:Scene;
        private var _showFps:Boolean = false;
        private var _currentFps:Number = 0;
        private var _fpsElement:HTMLDivElement;
        private var _frames:uint = 0;
        private var _currentDeltaTime:uint = 0;
        private var _raycast:*;
        private var _clock:*;
        private var _defaultScene:Scene;

        public function Two(width:Number = 550, height:Number = 400, fov:Number = 75) {
            //init stage properties
            stage.stageWidthInPixel = width;
            stage.stageHeightInPixel = height;

            camera = new THREE.PerspectiveCamera(fov, width / height, 0.01, 100);
            var d:Number = 1 / Math.tan(fov / 180 * Math.PI / 2);
            camera['position']['z'] = d;

            _renderer = new THREE.WebGLRenderer({'alpha': true});
            _renderer['setSize'](width, height);
            _renderer['setPixelRatio'](window.devicePixelRatio);

            //create raycast
            _raycast = new THREE.Raycaster();


            addListeners();
            //addLight();

            render();

            // create default scene
            _defaultScene = new Scene(this);
            presentScene(_defaultScene);
        }

        public function get defaultScene():Scene {
            return _defaultScene;
        }

        private function addLight():Boolean {
            if (scene) {
                var light:* = new THREE.PointLight(0xffffff, 1, 100);
                light['position']['z'] = 1;
                scene.object3D.add(light);
                return true
            } else {
                return false;
            }
        }

        public function get domElement():HTMLCanvasElement {
            return _renderer['domElement'];
        }

        public function setSize(width:Number, height:Number):void {
            _renderer['setSize'](width, height);
            stage.stageWidthInPixel = width;
            stage.stageHeightInPixel = height;
        }

        public function presentScene(scene:Scene):void {
            this.scene = scene;
        }

        public function set scene(v:Scene):void {
            _currentScene2D = v;
        }

        public function get scene():Scene {
            return _currentScene2D;
        }


        public function get showFps():Boolean {
            return _showFps;
        }

        public function set showFps(value:Boolean):void {
            _showFps = value;

            if (_showFps) {
                document.body.appendChild(fpsElement);
            } else {
                document.body.removeChild(fpsElement);
            }
        }

        public function get frames():uint {
            return _frames;
        }

        private function get fpsElement():HTMLDivElement {
            if (!_fpsElement) {
                _fpsElement = document.createElement("div") as HTMLDivElement;
                fpsElement.style.position = 'absolute';
                fpsElement.style.left = '0px';
                fpsElement.style.top = '0px';
                fpsElement.style.color = '#000000';
            }
            return _fpsElement;
        }

        private var _oldTimestamp:Number = 0;
        private var _oldFps:Number = 0;

        private function render(ts:Number = 0):void {
            _currentDeltaTime = ts;
            var dt:Number = ts - _oldTimestamp;
            _oldTimestamp = ts;
            //calculate the fps
            _currentFps = 1000 / dt;
            if (showFps) {
                if (_frames % 60 == 0 && _currentFps != _oldFps) {
                    fpsElement.innerHTML = _currentFps.toFixed() + "fps";
                    _oldFps = _currentFps
                }
            }

            //run update method of scene before render
            if (_currentScene2D) {
                camera["lookAt"](scene.object3D['position']);
                camera['updateMatrixWorld']();
                _currentScene2D.update(_currentDeltaTime);
                _currentScene2D.onUpdate.dispatch(null, _currentScene2D);
                _renderer['render'](_currentScene2D.object3D, camera);
            }

            requestAnimationFrame(render);
            _frames++;
        }

        private function addListeners():void {
            //MouseEvent
            domElement.addEventListener("click", domElement_eventHandler, false);
            domElement.addEventListener("contextmenu", domElement_eventHandler, false);
            domElement.addEventListener("dblclick", domElement_eventHandler, false);
            domElement.addEventListener("mousedown", domElement_eventHandler, false);
            domElement.addEventListener("mouseenter", domElement_eventHandler, false);
            domElement.addEventListener("mouseleave", domElement_eventHandler, false);
            domElement.addEventListener("mousemove", domElement_eventHandler, false);
            domElement.addEventListener("mouseout", domElement_eventHandler, false);
            domElement.addEventListener("mouseover", domElement_eventHandler, false);
            domElement.addEventListener("mouseup", domElement_eventHandler, false);
            domElement.addEventListener("show", domElement_eventHandler, false);

            //TouchEvent
            domElement.addEventListener("touchcancel", domElement_eventHandler, false);
            domElement.addEventListener("touchend", domElement_eventHandler, false);
            domElement.addEventListener("touchenter", domElement_eventHandler, false);
            domElement.addEventListener("touchleave", domElement_eventHandler, false);
            domElement.addEventListener("touchmove", domElement_eventHandler, false);
            domElement.addEventListener("touchstart", domElement_eventHandler, false);
        }

        private function domElement_eventHandler(e:MouseEvent):void {

            if (_currentScene2D) {
                var x:Number = 0, y:Number = 0;
                if (e.layerX) {
                    x = e.layerX;
                }
                if (e.offsetX) {
                    x = e.offsetX;
                }
                if (e.layerY) {
                    y = e.layerY;
                }
                if (e.offsetY) {
                    y = e.offsetY;
                }

                x = (x / stage.stageWidthInPixel) * 2 - 1;
                y = 1 - (y / stage.stageHeightInPixel) * 2;

                _currentScene2D.internal_onUiEvent(e.type, x, y, e);
            }
        }
    }
}
