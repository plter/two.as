# Two.as
Two.as is a 2d game engine running in canvas

# HelloWorld  

```ActionScript
package {
    import com.plter.two.app.Two;
    import com.plter.two.display.Label;

    public class Main extends Two {
        public function Main() {
            showFps = true;

            var l:Label = new Label(this, "Hello World", 48);
            scene.addChild(l);

            document.body.appendChild(domElement);
        }
    }
}
```
