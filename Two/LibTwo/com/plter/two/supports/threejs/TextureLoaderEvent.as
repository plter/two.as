/**
 * Created by plter on 3/14/16.
 */
package com.plter.two.supports.threejs {
import org.apache.flex.events.Event;

public class TextureLoaderEvent extends org.apache.flex.events.Event {


    public static const COMPLETE:String = "complete";
    public static const PROGRESS:String = "progress";
    public static const ERROR:String = "error";


    private var _texture:Texture;
    private var _progress:Number;

    public function TextureLoaderEvent(type:String, texture:Texture = null, progress:Number = 0) {
        super(type, false, false);

        _texture = texture;
        _progress = progress;
    }


    public function get texture():Texture {
        return _texture;
    }


    public function get progress():Number {
        return _progress;
    }

    override public function cloneEvent():org.apache.flex.events.Event {
        return new TextureLoaderEvent(type, texture);
    }
}
}
