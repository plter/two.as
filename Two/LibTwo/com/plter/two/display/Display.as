/**
 * Created by plter on 3/14/16.
 */
package com.plter.two.display {
    import com.plter.two.app.Context;

    public class Display extends CanvasObject {

        public function Display(context:Context, canvasWidthInPixel:Number = 256, canvasHeightInPixel:Number = 256) {

            var canvas:HTMLCanvasElement = document.createElement("canvas") as HTMLCanvasElement;
            canvas.width = canvasWidthInPixel;
            canvas.height = canvasHeightInPixel;
            super(context, canvas);
        }
    }
}
