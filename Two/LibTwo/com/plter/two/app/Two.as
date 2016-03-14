/**
 * Created by plter on 3/11/16.
 */
package com.plter.two.app {
import com.plter.two.display.Scene;
import com.plter.two.supports.threejs.THREE;

public class Two extends Context {

    private var _camera:*;
    private var _renderer:*;
    private var _threeScene:*;
    private var _currentScene2D:Scene;

    public function Two(width:Number = 550, height:Number = 400) {
        //init stage properties
        stage.setStageWidth(width);
        stage.setStageHeight(height);

        _camera = new THREE.PerspectiveCamera(90, width / height, 0.01, 100);
        _camera['position']['z'] = 1;

        _renderer = new THREE.WebGLRenderer();
        _renderer['setSize'](width, height);

        _threeScene = new THREE.Scene();

        render();
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
            _threeScene['remove'](_currentScene2D.bindedObject3D);
        }

        _currentScene2D = scene;
        _threeScene['add'](_currentScene2D.bindedObject3D);
    }

    private function render():void {

        if (_currentScene2D){
            _currentScene2D.update();
        }

        _renderer['render'](_threeScene, _camera);

        window.requestAnimationFrame(render);
    }
}
}
