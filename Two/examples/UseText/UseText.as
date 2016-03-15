/**
 * Created by plter on 3/15/16.
 */
package {
import com.plter.two.app.Two;
import com.plter.usetext.MainScene;

public class UseText extends Two {
    public function UseText() {
        document.body.appendChild(domElement);
        presentScene(new MainScene(this));
    }
}
}
