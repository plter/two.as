/**
 * Created by plter on 3/14/16.
 */
package com.plter.two.supports.threejs {
import org.apache.flex.events.Event;

public class TextureLoaderEvent extends org.apache.flex.events.Event {


    public static const ON_LOAD:String = "onLoad";
    private var _texture:Texture;

    public function TextureLoaderEvent(type:String, texture:Texture) {
        super(type, false, false);

        _texture = texture;
    }


    public function get texture():Texture {
        return _texture;
    }

    override public function cloneEvent():org.apache.flex.events.Event {
        return new TextureLoaderEvent(type, texture);
    }
}
}
