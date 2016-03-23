/**
 * Created by plter on 3/23/16.
 */
package com.plter.two.display {
import com.plter.two.app.Context;
import com.plter.two.tools.MathTool;

public class Picture extends Display {

    public function Picture(context:Context, img:HTMLImageElement, x:Number = 0, y:Number = 0, width:Number = 0, height:Number = 0) {
        if (width == 0 || height == 0) {
            width = img.width;
            height = img.height;
        }

        if (width == 0 || height == 0) {
            window.console.error("Invalid Image");
        }

        var widthPower2:Number = MathTool.resetNumberToNearPower2(width);
        var heightPower2:Number = MathTool.resetNumberToNearPower2(height);

        super(context, widthPower2, heightPower2, width, height);

        context2d.save();
        context2d.scale(widthPower2 / width, heightPower2 / height);
        context2d.drawImage(img, x, y, width, height, 0, 0, width, height);
        context2d.restore();
        updateTexture();
    }
}
}
