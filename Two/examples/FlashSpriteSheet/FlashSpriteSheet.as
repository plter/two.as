/**
 * Created by plter on 3/17/16.
 */
package {
import com.plter.flashspritesheet.FlashSpriteSheetScene;
import com.plter.two.app.Two;

public class FlashSpriteSheet extends Two{
    public function FlashSpriteSheet() {
        document.body.appendChild(domElement);
        showFps = true;

        presentScene(new FlashSpriteSheetScene(this));
    }
}
}
