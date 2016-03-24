/**
 * Created by plter on 3/12/16.
 */
package com.plter.two.app {
public class Stage {

    private var _stageWidth:Number = 550, _stageHeight:Number = 400;
    private var _spaceRatio:Number = 1;
    private var _aspectRatio:Number = 1;

    public function Stage() {
    }

    public function set stageWidth(v:Number):void {
        _stageWidth = v;

        _aspectRatio = _stageWidth / _stageHeight;
    }

    public function set stageHeight(v:Number):void {
        _stageHeight = v;

        _spaceRatio = 2 / _stageHeight;
        _aspectRatio = _stageWidth / _stageHeight;
    }

    public function get stageWidth():Number {
        return _stageWidth;
    }

    public function get stageHeight():Number {
        return _stageHeight;
    }

    public function get spaceRatio():Number {
        return _spaceRatio;
    }

    public function get aspectRatio():Number {
        return _aspectRatio;
    }

    public function get top():Number {
        return 1;
    }

    public function get bottom():Number {
        return -1;
    }

    public function get left():Number {
        return bottom * aspectRatio;
    }

    public function get height():Number {
        return top * aspectRatio;
    }
}
}
