package {
    import com.plter.two.app.Two;
    import com.yunp.balls.Ball;

    public class Main extends Two {

        private var balls:Array = [];

        public function Main() {
            super(800, 600);
            showFps = true;

            for (var i:int = 0; i < 2000; i++) {
                var b:Ball = new Ball(this);
                balls.push(b);
                defaultScene.addChild(b);
            }
            document.body.appendChild(domElement);

            defaultScene.onUpdate.add(updateHandler);
        }

        private function updateHandler():void {
            for (var key:String in balls) {
                var element:Ball = balls[key];
                element.move();
            }
        }
    }
}
