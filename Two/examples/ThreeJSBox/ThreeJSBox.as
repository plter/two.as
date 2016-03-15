/**
 * Created by plter on 3/11/16.
 */
package {
import com.plter.two.supports.threejs.THREE;

public class ThreeJSBox {

    private var _camera:*;
    private var _renderer:*;
    private var _width:Number = 550;
    private var _height:Number = 400;
    private var _scene:*;
    private var _light:*;
    private var _cube:*;

    public function ThreeJSBox() {

        _camera = new THREE.PerspectiveCamera(90, _width / _height, 0.01, 100);
        _camera['position']['z'] = 2;

        _renderer = new THREE.WebGLRenderer();
        _renderer['setSize'](_width, _height);
        document.body.appendChild(_renderer['domElement']);

        _scene = new THREE.Scene();

        addBox();
        addLight();

        render();
    }

    private function render():void {

        _cube['rotation']['x'] += 0.01;
        _cube['rotation']['y'] += 0.01;
        _cube['rotation']['z'] += 0.01;

        _renderer['render'](_scene, _camera);

        window.requestAnimationFrame(render);
    }

    private function addLight():void {
        _light = new THREE.PointLight(0xffffff, 1, 100);
        _light['position']['set'](0, 1, 5);
        _scene['add'](_light);
    }

    private function addBox():void {
        var geometry:* = new THREE.BoxGeometry(1, 1, 1);
        var material:* = new THREE.MeshLambertMaterial({color: 0xff0000});
        _cube = new THREE.Mesh(geometry, material);
        _scene['add'](_cube);
    }

}
}
