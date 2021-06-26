/**
 * Created by plter on 3/12/16.
 */
package com.plter.two.app {
public class Stage {

    private var _stageWidthInPixel:Number = 550, _stageHeightInPixel:Number = 400;
    private var _spaceRatio:Number = 1;
    private var _aspectRatio:Number = 1;

    public function Stage() {
    }

    public function set stageWidthInPixel(v:Number):void {
        _stageWidthInPixel = v;

        _aspectRatio = _stageWidthInPixel / _stageHeightInPixel;
    }

    public function set stageHeightInPixel(v:Number):void {
        _stageHeightInPixel = v;

        _spaceRatio = 2 / _stageHeightInPixel;
        _aspectRatio = _stageWidthInPixel / _stageHeightInPixel;
    }

    public function get stageWidthInPixel():Number {
        return _stageWidthInPixel;
    }

    public function get stageHeightInPixel():Number {
        return _stageHeightInPixel;
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

    public function get right():Number {
        return top * aspectRatio;
    }
}
}
