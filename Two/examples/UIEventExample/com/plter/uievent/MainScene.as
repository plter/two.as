/**
 * Created by plter on 3/15/16.
 */
package com.plter.uievent {
import com.plter.two.app.Context;
import com.plter.two.display.Label;
import com.plter.two.display.Scene;

public class MainScene extends Scene {


    private var l:Label;

    public function MainScene(context:Context) {
        super(context);

        l = new Label(context, "Click me", 32);
        addChild(l);
    }

    override public function onClick(eventType:String, x:Number, y:Number, e:MouseEvent):void {
        if (l.hitTest(x, y)) {
            alert("Image clicked");
        }
    }
}
}
