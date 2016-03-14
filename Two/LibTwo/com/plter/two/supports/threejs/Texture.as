/**
 * Created by plter on 3/14/16.
 */
package com.plter.two.supports.threejs {
public class Texture {

    private var _threejsTexture:*;

    public function Texture() {
    }


    public function get threejsTexture():* {
        return _threejsTexture;
    }

    public function get image():HTMLImageElement {
        return threejsTexture['image'];
    }

    internal function setThreejsTexture(value:*):void {
        _threejsTexture = value;
    }
}
}
