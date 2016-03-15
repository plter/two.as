/**
 * Created by plter on 3/14/16.
 */
package com.plter.hellotwo {
import com.plter.two.app.Context;
import com.plter.two.display.Bitmap;
import com.plter.two.display.Scene;
import com.plter.two.supports.threejs.TextureLoader;
import com.plter.two.supports.threejs.TextureLoaderEvent;

public class MainScene extends Scene {


    private var img:com.plter.two.display.Bitmap;

    public function MainScene(context:Context) {
        super(context);

        var tl:TextureLoader = new TextureLoader();
        tl.addEventListener(TextureLoaderEvent.COMPLETE, tl_loaded);
        tl.load("Image.png");
    }


    private function tl_loaded(event:TextureLoaderEvent):void {
        img = new com.plter.two.display.Bitmap(context, event.texture);
        addChild(img);
        img.z = -2;
    }

    override public function update(dt:uint):void {
        if (img) {
            img.rotationY += 0.01;
        }
    }
}
}
