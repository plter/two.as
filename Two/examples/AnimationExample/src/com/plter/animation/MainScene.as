/**
 * Created by plter on 3/15/16.
 */
package com.plter.animation {
import com.plter.two.anim.PropertyAnim;
import com.plter.two.app.Context;
import com.plter.two.display.Scene;
import com.plter.two.display.Label;

public class MainScene extends Scene {

    private var tl:Label;

    public function MainScene(context:Context) {
        super(context);

        tl = new Label(context, "Move this text", 32);
        addChild(tl);

        new PropertyAnim(this, tl, "x", -1, 1, 120, function (e:*, target:PropertyAnim):void {
            target.reverse().start();
        }).start();
    }
}
}
