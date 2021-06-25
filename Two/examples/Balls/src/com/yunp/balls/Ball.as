package com.yunp.balls {
    import com.plter.two.display.CanvasObject;
    import com.plter.two.app.Context;
    import com.plter.two.display.Display;

    public class Ball extends CanvasObject {

        private var speedX:Number = Math.random() * 0.002 + 0.001;
        private var speedY:Number = Math.random() * 0.002 + 0.001;

        public function Ball(context:Context) {
            super(context, ballCanvas);
        }

        public function move():void {
            this.x += speedX;
            this.y += speedY;

            if ((this.x > context.stage.aspectRatio && speedX > 0) || (this.x < -context.stage.aspectRatio && speedX < 0)) {
                speedX *= -1;
            }
            if ((this.y > 1 && speedY > 0) || (this.y < -1 && speedY < 0)) {
                speedY *= -1;
            }
        }

        private static var __ballCanvas:HTMLCanvasElement = null;

        private static function get ballCanvas():HTMLCanvasElement {
            if (!__ballCanvas) {
                __ballCanvas = document.createElement("canvas") as HTMLCanvasElement;
                __ballCanvas.width = 16;
                __ballCanvas.height = 16;
                var ctx:CanvasRenderingContext2D = __ballCanvas.getContext("2d") as CanvasRenderingContext2D;
                ctx.clearRect(0, 0, 16, 16);
                ctx.strokeStyle = "#000000";
                ctx.fillStyle = "#cccccc";
                ctx.arc(8, 8, 6, 0, Math.PI * 2);
                ctx.stroke();
                ctx.fill();
            }
            return __ballCanvas;
        }
    }
}
