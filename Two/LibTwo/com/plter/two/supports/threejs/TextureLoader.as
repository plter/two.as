/**
 * Created by plter on 3/14/16.
 */
package com.plter.two.supports.threejs {
import org.apache.flex.events.EventDispatcher;


[Event(name="complete", type="com.plter.two.supports.threejs.TextureLoaderEvent")]
[Event(name="progress", type="com.plter.two.supports.threejs.TextureLoaderEvent")]
[Event(name="error", type="com.plter.two.supports.threejs.TextureLoaderEvent")]
public class TextureLoader extends EventDispatcher {

    private var loader:*;

    public function TextureLoader() {

        loader = new THREE.TextureLoader();
    }

    public function load(url:String):void {
        loader['load'](url, completeHandler, progressHandler, errorHandler);
    }

    private function errorHandler():void {
        dispatchEvent(new TextureLoaderEvent(TextureLoaderEvent.ERROR));
    }

    private function progressHandler(progress):void {
        dispatchEvent(new TextureLoaderEvent(TextureLoaderEvent.PROGRESS, null, progress['loaded'] / progress['total']));
    }

    private function completeHandler(texture:*):void {
        dispatchEvent(new TextureLoaderEvent(TextureLoaderEvent.COMPLETE, new Texture(texture)));
    }
}
}
