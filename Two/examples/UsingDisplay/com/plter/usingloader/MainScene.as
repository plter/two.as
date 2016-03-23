/**
 * Created by plter on 3/22/16.
 */
package com.plter.usingloader {
import com.plter.two.app.Context;
import com.plter.two.display.Display;
import com.plter.two.display.Scene;

public class MainScene extends Scene {

    private var display:Display;

    public function MainScene(context:Context) {
        super(context);

        display = new Display(context);
        addChild(display);

        var ctx:CanvasRenderingContext2D = display.context2d;
        ctx.fillStyle = "#ff0000";
        ctx.arc(100, 100, 50, 0, Math.PI * 2);
        ctx.fill();
        display.updateTexture();
    }
}
}
