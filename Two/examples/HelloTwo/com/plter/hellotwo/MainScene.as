/**
 * Created by plter on 3/14/16.
 */
package com.plter.hellotwo {
import com.plter.two.app.Context;
import com.plter.two.display.Image;
import com.plter.two.display.Scene;
import com.plter.two.supports.threejs.TextureLoader;
import com.plter.two.supports.threejs.TextureLoaderEvent;

public class MainScene extends Scene {


    private var img:com.plter.two.display.Image;

    public function MainScene(context:Context) {
        super(context);

        var tl:TextureLoader = new TextureLoader();
        tl.addEventListener(TextureLoaderEvent.ON_LOAD, tl_loaded);
        tl.load("img.jpg");
    }

    private function tl_loaded(event:TextureLoaderEvent):void {
        img = new com.plter.two.display.Image(context, event.texture);
        addChild(img);
        img.z = -2;
    }

    override public function update():void {
        if (img) {
            img.rotationY += 0.01;
        }
    }
}
}
