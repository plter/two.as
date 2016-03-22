/**
 * Created by plter on 3/12/16.
 */
package com.plter.two.app {
public class Stage{

    private var _stageWidth:Number = 550, _stageHeight:Number = 400;

    public function Stage() {
    }

    internal function setStageWidth(v:Number):void {
        _stageWidth = v;
    }

    internal function setStageHeight(v:Number):void {
        _stageHeight = v;
    }

    public function get stageWidth():Number {
        return _stageWidth;
    }

    public function get stageHeight():Number {
        return _stageHeight;
    }
}
}
