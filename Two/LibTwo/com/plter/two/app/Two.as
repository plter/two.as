/**
 * Created by plter on 3/11/16.
 */
package com.plter.two.app {
import com.plter.two.display.Scene;
import com.plter.two.supports.js.Date;
import com.plter.two.supports.threejs.THREE;

public class Two extends Context {

    private var _renderer:*;
    private var _threeScene:*;
    private var _currentScene2D:Scene;
    private var _showFps:Boolean = false;
    private var _currentFps:Number = 0;
    private var _fpsElement:HTMLDivElement;
    private var _lastTime:uint = 0, _currentTime:uint = 0;
    private var _frames:uint = 0;
    private var _currentDeltaTime:uint = 0;
    private var _raycast:*;

    public function Two(width:Number = 550, height:Number = 400) {
        //init stage properties
        stage.setStageWidth(width);
        stage.setStageHeight(height);

        camera = new THREE.PerspectiveCamera(90, width / height, 0.01, 100);
        camera['position']['z'] = 1;

        var rendererParams:* = {};
        rendererParams['alpha'] = true;
        _renderer = new THREE.WebGLRenderer(rendererParams);
        _renderer['setSize'](width, height);

        _threeScene = new THREE.Scene();

        //create raycast
        _raycast = new THREE.Raycaster();

        addListeners();
        addLight();

        render();
    }

    private function addLight():void {
        var light:* = new THREE.PointLight(0xffffff, 1, 100);
        light['position']['z'] = 1;
        _threeScene.add(light);
    }

    public function get domElement():HTMLCanvasElement {
        return _renderer['domElement'];
    }

    public function setSize(width:Number, height:Number):void {
        _renderer['setSize'](width, height);
        stage.setStageWidth(width);
        stage.setStageHeight(height);
    }

    public function presentScene(scene:Scene):void {
        if (_currentScene2D) {
            _threeScene['remove'](_currentScene2D.threeJsObject);
        }

        _currentScene2D = scene;
        _threeScene['add'](_currentScene2D.threeJsObject);
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

    private function render():void {

        //calculate the fps
        _currentTime = com.plter.two.supports.js.Date.now();
        if (_lastTime > 0) {
            _currentDeltaTime = _currentTime - _lastTime;
        }
        _lastTime = _currentTime;
        _currentFps = 1000 / _currentDeltaTime;
        if (showFps) {
            if (_frames % 60 == 0) {
                fpsElement.innerHTML = _currentFps.toFixed() + "fps";
            }
        }

        //run update method of scene before render
        if (_currentScene2D) {
            _currentScene2D.update(_currentDeltaTime);
            _currentScene2D.onUpdate.dispatch(null, _currentScene2D);
        }
        _renderer['render'](_threeScene, camera);

        window.requestAnimationFrame(render);

        _frames++;
    }

    private function addListeners():void {
        domElement.addEventListener("click", domElement_eventHandler, false);
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

            x = (x / stage.stageWidth) * 2 - 1;
            y = 1 - (y / stage.stageHeight) * 2;

            _currentScene2D.onUiEvent(e.type, x, y, e);
        }
    }
}
}
