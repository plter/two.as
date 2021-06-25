/**
 * Created by plter on 3/17/16.
 */
package {
import com.plter.flashspritesheet.FlashSpriteSheetScene;
import com.plter.two.app.Two;

public class Main extends Two{
    public function Main() {
        document.body.appendChild(domElement);
        showFps = true;

        presentScene(new FlashSpriteSheetScene(this));
    }
}
}
