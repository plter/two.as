/**
 * Created by plter on 3/15/16.
 */
package {
import com.plter.two.app.Two;
import com.plter.uievent.MainScene;

public class UIEventExample extends Two{
    public function UIEventExample() {
        document.body.appendChild(domElement);
        presentScene(new MainScene(this));
    }
}
}
