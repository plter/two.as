/**
 * Created by plter on 3/12/16.
 */
package com.plter.two.display {
import com.plter.two.app.Context;
import com.plter.two.supports.threejs.THREE;

import org.apache.flex.events.EventDispatcher;

public class Display extends EventDispatcher {

    private var _threeJsObject:*;
    private var _context:Context;

    public function Display(context:Context, object3D:*) {
        _context = context;
        _threeJsObject = object3D;

        _threeJsObject['displayObject'] = this;
    }

    public function get threeJsObject():* {
        return _threeJsObject;
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
        return threeJsObject['position'];
    }

    private function get rotation():* {
        return threeJsObject['rotation'];
    }


    //Hit test tool
    private static var _raycast:* = new THREE.Raycaster();
    private static var _point:* = new THREE.Vector2();

    private static function displayHitTestPoint(x:Number, y:Number, display:Display, context:Context):Boolean {
        _point['x'] = x;
        _point['y'] = y;

        _raycast['setFromCamera'](_point, context.camera);
        return _raycast['intersectObject'](display.threeJsObject)['length'] > 0;
    }
}
}
