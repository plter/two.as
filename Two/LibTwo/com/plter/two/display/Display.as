/**
 * Created by plter on 3/12/16.
 */
package com.plter.two.display {
import com.plter.two.app.Context;

public class Display {

    private var _bindedObject3D:*;
    private var _context:Context;

    public function Display(context:Context, object3D:*) {
        _context = context;
        _bindedObject3D = object3D;

        _bindedObject3D['displayObject'] = this;
    }

    public function get bindedObject3D():* {
        return _bindedObject3D;
    }

    public function get context():Context {
        return _context;
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
        return bindedObject3D['position'];
    }

    private function get rotation():* {
        return bindedObject3D['rotation'];
    }
}
}
