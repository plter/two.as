/**
 * Created by plter on 3/12/16.
 */
package com.plter.two.display {
import com.plter.two.app.Context;
import com.plter.two.supports.threejs.THREE;

public class Node {

    private var _object3D:*;
    private var _context:Context;
    private var _ratio:Number;

    public function Node(context:Context, object3D:*) {
        _context = context;
        _object3D = object3D;

        _object3D['node'] = this;
        _ratio = context.stage.spaceRatio;
    }

    public function get object3D():* {
        return _object3D;
    }

    public function get context():Context {
        return _context;
    }

    public function hitTest(pointX:Number, pointY:Number):Boolean {
        return displayHitTestPoint(pointX, pointY, this, context);
    }

    public function get x():Number {
        return position['x'];
    }

    public function get y():Number {
        return position['y'];
    }

    public function get z():Number {
        return position['z'];
    }

    public function set x(value:Number):void {
        position['x'] = value;
    }

    public function set y(value:Number):void {
        position['y'] = value;
    }

    public function set z(value:Number):void {
        position['z'] = value;
    }

    public function get rotationX():Number {
        return rotation['x'];
    }

    public function get rotationY():Number {
        return rotation['y'];
    }

    public function get rotationZ():Number {
        return rotation['z'];
    }

    public function set rotationX(value:Number):void {
        rotation['x'] = value;
    }

    public function set rotationY(value:Number):void {
        rotation['y'] = value;
    }

    public function set rotationZ(value:Number):void {
        rotation['z'] = value;
    }

    private function get position():* {
        return object3D['position'];
    }

    private function get rotation():* {
        return object3D['rotation'];
    }

    public function get xInPixel():Number {
        return x / _ratio;
    }

    public function get yInPixel():Number {
        return y / _ratio;
    }

    public function set xInPixel(value:Number):void {
        x = value * _ratio;
    }

    public function set yInPixel(value:Number):void {
        y = value * _ratio;
    }

    public function set zInPixel(value:Number):void {
        z = value * _ratio;
    }

    public function get zInPixel():Number {
        return z / _ratio;
    }


    //Hit test tool
    private static var _raycast:* = new THREE.Raycaster();
    private static var _point:* = new THREE.Vector2();

    private static function displayHitTestPoint(x:Number, y:Number, display:Node, context:Context):Boolean {
        _point['x'] = x;
        _point['y'] = y;

        _raycast['setFromCamera'](_point, context.camera);
        return _raycast['intersectObject'](display.object3D)['length'] > 0;
    }
}
}
