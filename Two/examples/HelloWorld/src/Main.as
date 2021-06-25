package {
    import com.plter.two.app.Two;
    import com.plter.two.display.Label;

    public class Main extends Two {
        public function Main() {
            showFps = true;

            var l:Label = new Label(this, "Hello World", 48);
            defaultScene.addChild(l);

            document.body.appendChild(domElement);
        }
    }
}
