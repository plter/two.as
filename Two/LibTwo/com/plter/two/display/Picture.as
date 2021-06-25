/**
 * Created by plter on 3/23/16.
 */
package com.plter.two.display {
    import com.plter.two.app.Context;

    public class Picture extends Display {

        public function Picture(context:Context, img:HTMLImageElement, x:Number = 0, y:Number = 0, width:Number = 0, height:Number = 0) {
            if (width == 0 || height == 0) {
                width = img.width;
                height = img.height;
            }

            if (width == 0 || height == 0) {
                window.console.error("Invalid Image");
            }

            super(context, width, height);

            setSizeInPixel(width, height);
            context2d.save();
            context2d.drawImage(img, x, y, width, height, 0, 0, width, height);
            context2d.restore();
            updateTexture();
        }
    }
}
