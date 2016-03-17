/**
 * Created by plter on 3/12/16.
 */
package {
import com.plter.hellotwo.MainScene;
import com.plter.two.app.Two;

public class Main extends Two {

    public function Main() {
        super(600, 400);

        showFps = true;

        document.body.appendChild(domElement);
        presentScene(new MainScene(this));
    }
}
}
