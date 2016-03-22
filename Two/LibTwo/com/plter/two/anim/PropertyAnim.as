/**
 * Created by plter on 3/22/16.
 */
package com.plter.two.anim {
import com.plter.two.display.Scene;

public class PropertyAnim {


    private var _target:*;
    private var _property:String;
    private var _fromValue:Number;
    private var _toValue:Number;
    private var _frames:uint;
    private var _completeHandler:Function;
    private var _scene:Scene;
    private var _speed:Number;
    private var _distance:Number;

    public function PropertyAnim(scene:Scene, target:*, property:String, fromValue:Number, toValue:Number, frames:uint, completeHandler:Function = null) {
        _scene = scene;
        _target = target;
        _property = property;
        _frames = frames;
        setFromAndTo(fromValue, toValue);
        _completeHandler = completeHandler;
    }

    public function start():void {
        target[property] = _fromValue;
        scene.onUpdate.add(updateHandler);
    }

    public function get target():* {
        return _target;
    }

    public function get property():String {
        return _property;
    }

    public function get fromValue():Number {
        return _fromValue;
    }

    public function get toValue():Number {
        return _toValue;
    }

    public function get frames():uint {
        return _frames;
    }

    public function get scene():Scene {
        return _scene;
    }

    public function reverse():PropertyAnim {
        setFromAndTo(toValue, fromValue);
        return this;
    }

    public function setFromAndTo(fromValue:Number, toValue:Number):void {
        _fromValue = fromValue;
        _toValue = toValue;

        _speed = (_toValue - _fromValue) / frames;
        _distance = Math.abs(_toValue - _fromValue);
    }

    public function get completeHandler():Function {
        return _completeHandler;
    }

    public function set completeHandler(value:Function):void {
        _completeHandler = value;
    }

    private function updateHandler():void {

        target[property] += _speed;

        if (Math.abs(target[property] - fromValue) > _distance) {
            scene.onUpdate.remove(updateHandler);
            target[property] = toValue;

            if (_completeHandler) {
                _completeHandler(this);
            }
        }
    }
}
}
