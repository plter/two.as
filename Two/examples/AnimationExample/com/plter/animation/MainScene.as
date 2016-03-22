/**
 * Created by plter on 3/15/16.
 */
package com.plter.animation {
import com.plter.two.anim.PropertyAnim;
import com.plter.two.app.Context;
import com.plter.two.display.Scene;
import com.plter.two.display.TextLine;

public class MainScene extends Scene {

    private var tl:TextLine;

    public function MainScene(context:Context) {
        super(context);

        tl = new TextLine(context, "Move this text", 16);
        addChild(tl);

        new PropertyAnim(this, tl, "x", 0, 1, 120, function (target:PropertyAnim):void {
            target.reverse().start();
        }).start();
    }
}
}
