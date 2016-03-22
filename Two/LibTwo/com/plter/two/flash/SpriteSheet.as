/**
 * Created by plter on 3/17/16.
 */
package com.plter.two.flash {
import com.plter.two.app.Context;
import com.plter.two.display.Node;
import com.plter.two.events.EventListenerList;
import com.plter.two.supports.threejs.THREE;

public class SpriteSheet extends com.plter.two.display.Node {


    private var _spriteSheetJsonUrl:String;
    private var _xhr:XMLHttpRequest;
    private var _onError:EventListenerList = new EventListenerList();
    private var _onLoad:EventListenerList = new EventListenerList();
    private var _frames:Array;
    private var _imageUrl:String;
    private var _json:*;
    private var _spriteSheetWidth:Number = 100;
    private var _spriteSheetHeight:Number = 100;

    public function SpriteSheet(context:Context, spriteSheetJsonUrl:String) {
        _spriteSheetJsonUrl = spriteSheetJsonUrl;
        super(context, new THREE.Object3D());

        _xhr = new XMLHttpRequest();
        _xhr.onreadystatechange = _xhr_readyChangeHandler;
    }

    private function _xhr_readyChangeHandler():void {
        if (_xhr.readyState == 4) {
            if (_xhr.status == 200) {

                _json = JSON.parse(_xhr.responseText);

                if (_json) {
                    _frames = _json['frames'];
                    _imageUrl = _json['meta']['image'];

                    createDisplayByFrames(_frames);
                } else {
                    onError.dispatch(null, this);
                }
            } else {
                onError.dispatch(null, this);
            }
        }
    }

    private function createDisplayByFrames(frames:Array):void {
        var firstFrame:* = frames[0];
        _spriteSheetWidth = firstFrame['sourceSize']['w'];
        _spriteSheetHeight = firstFrame['sourceSize']['h'];

        //TODO
    }

    public function get spriteSheetJsonUrl():String {
        return _spriteSheetJsonUrl;
    }

    public function get frames():Array {
        return _frames;
    }

    public function get imageUrl():String {
        return _imageUrl;
    }

    public function get spriteSheetWidth():Number {
        return _spriteSheetWidth;
    }

    public function get spriteSheetHeight():Number {
        return _spriteSheetHeight;
    }

    public function load():void {
        _xhr.open("GET", spriteSheetJsonUrl);
        _xhr.send();
    }


    public function get onError():EventListenerList {
        return _onError;
    }

    public function get onLoad():EventListenerList {
        return _onLoad;
    }
}
}
