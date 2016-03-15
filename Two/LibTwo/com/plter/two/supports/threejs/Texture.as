/**
 * Created by plter on 3/14/16.
 */
package com.plter.two.supports.threejs {
public class Texture {

    private var _threejsTexture:*;

    public function Texture(threejsTexture:*) {
        _threejsTexture = threejsTexture;
    }


    public function get threejsTexture():* {
        return _threejsTexture;
    }

    public function set threejsTexture(value:*):void {
        _threejsTexture = value;
    }

    public function get image():HTMLImageElement {
        return threejsTexture['image'];
    }

    public function set image(v:HTMLImageElement):void {
        threejsTexture['image'] = v;
    }
}
}
