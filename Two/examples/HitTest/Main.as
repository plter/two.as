/**
 * Created by plter on 3/23/16.
 */
package {
import com.plter.two.app.Two;
import com.plter.hittest.MainScene;

public class Main extends Two {
    public function Main() {
        showFps = true;
        document.body.appendChild(domElement);

        presentScene(new MainScene(this));
    }
}
}
