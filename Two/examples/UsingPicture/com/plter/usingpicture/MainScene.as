/**
 * Created by plter on 3/23/16.
 */
package com.plter.usingpicture {
import com.plter.two.app.Context;
import com.plter.two.display.Picture;
import com.plter.two.display.Scene;

public class MainScene extends Scene {

    public function MainScene(context:Context) {
        super(context);


        var img:Image = new Image();
        img.onload = function ():void {
            var col:Number = 3;
            var row:Number = 3;
            var picWidth:Number = img.width / 3;
            var picHeight:Number = img.height / 3;
            var pic:Picture;

            for (var i:int = 0; i < col; i++) {
                for (var j:int = 0; j < row; j++) {
                    pic = new Picture(context, img, picWidth * i, picHeight * j, picWidth, picHeight);
                    pic.xInPixel = (picWidth + 2) * i - 200;
                    pic.yInPixel = (picHeight + 2) * (row - j) - 100;
                    addChild(pic);
                }
            }
        };
        img.src = "image.jpg";
    }
}
}
