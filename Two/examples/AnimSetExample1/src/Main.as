package {
    import com.plter.two.app.Two;
    import com.plter.two.display.Label;
    import com.plter.two.anim.AnimSet;
    import com.plter.two.anim.IAnim;
    import com.plter.two.anim.PropertyAnim;

    public class Main extends Two {
        public function Main() {

            var l:Label = new Label(this, "Hello World");
            l.fontSize = 60;
            scene.addChild(l);

            var frames:int = 60;
            var anim:AnimSet = new AnimSet(function(anim:IAnim):void {
                setTimeout(function():void {
                    anim.reverse().start();
                }, 1000);
            }, new PropertyAnim(scene, l, "z", -5, 0, frames), new PropertyAnim(scene, l, 'rotationX', 0, Math.PI * 2, frames));
            anim.mode = AnimSet.ANIM_MODE_ONE_BY_ONE;
            anim.start();

            document.body.appendChild(domElement);
        }
    }
}
