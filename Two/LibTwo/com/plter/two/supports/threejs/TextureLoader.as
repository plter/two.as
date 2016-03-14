/**
 * Created by plter on 3/14/16.
 */
package com.plter.two.supports.threejs {
import org.apache.flex.events.EventDispatcher;


[Event(name="onLoad", type="com.plter.two.supports.threejs.TextureLoaderEvent")]
public class TextureLoader extends EventDispatcher {

    private var loader:*;

    public function TextureLoader() {

        loader = new THREE.TextureLoader();
    }

    public function load(url:String):void {
        loader['load'](url, loaded);
    }

    private function loaded(texture:*):void {
        var t:Texture = new Texture();
        t.setThreejsTexture(texture);
        dispatchEvent(new TextureLoaderEvent(TextureLoaderEvent.ON_LOAD, t));
    }
}
}
