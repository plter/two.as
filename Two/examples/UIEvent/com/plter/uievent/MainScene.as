/**
 * Created by plter on 3/15/16.
 */
package com.plter.uievent {
import com.plter.two.app.Context;
import com.plter.two.display.Bitmap;
import com.plter.two.display.Scene;
import com.plter.two.supports.threejs.TextureLoader;
import com.plter.two.supports.threejs.TextureLoaderEvent;

public class MainScene extends Scene {


    private var img:Bitmap;

    public function MainScene(context:Context) {
        super(context);

        var tl:TextureLoader = new TextureLoader();
        tl.addEventListener(TextureLoaderEvent.COMPLETE, tl_completeHandler);
        tl.load("Image.png");
    }

    private function tl_completeHandler(event:TextureLoaderEvent):void {
        img = new Bitmap(context, event.texture);
        img.z = -2;
        addChild(img);
    }


    override public function onUiEvent(type:String, x:Number, y:Number, e:MouseEvent):void {
        if (img) {
            if (type == 'click' && img.hitTest(x, y)) {
                alert("Image clicked");
            }
        }
    }
}
}
