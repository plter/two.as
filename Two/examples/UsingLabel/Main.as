/**
 * Created by plter on 3/15/16.
 */
package {
import com.plter.two.app.Two;
import com.plter.usinglabel.MainScene;

public class Main extends Two {
    public function Main() {
        document.body.appendChild(domElement);

        showFps = true;
        presentScene(new MainScene(this));
    }
}
}
