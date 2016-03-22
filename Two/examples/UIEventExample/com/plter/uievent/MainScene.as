/**
 * Created by plter on 3/15/16.
 */
package com.plter.uievent {
import com.plter.two.app.Context;
import com.plter.two.display.ImageView;
import com.plter.two.display.Scene;

public class MainScene extends Scene {


    private var img:ImageView;

    public function MainScene(context:Context) {
        super(context);

        img = new ImageView(context);
        img.z = -2;
        img.load("Image.png");
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
