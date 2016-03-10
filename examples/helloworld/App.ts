///<reference path="../../two/com/plter/two/Two.ts"/>
///<reference path="../../two/com/plter/two/display/Image.ts"/>

/**
 * Created by plter on 3/3/16.
 */

namespace plter {

    import Two = com.plter.two.Two;
    import Scene2D = com.plter.two.display.Scene2D;
    import TextureLoader = THREE.TextureLoader;
    import Image = com.plter.two.display.Image;
    import Texture = THREE.Texture;
    import Context = com.plter.two.Context;

    class HelloWorldScene extends Scene2D {

        private img:Image;

        constructor(context:Two) {
            super(context);

            var loader = new TextureLoader();
            loader.load("img.jpg", function (texture:Texture) {

                this.img = new Image(this.context, texture);
                this.img.position.z = -1;
                this.add(this.img);

                this.onUpdate.add(function () {
                    this.img.rotation.y += 0.01;
                }.bind(this));
            }.bind(this));

            this.uiListeners.add(function (e:com.plter.two.events.MouseEvent) {
                if (e.name == "click") {
                    if ((this.context as Two).hitTest(this.img, e.x, e.y)) {
                        alert("Image clicked");
                    }
                }
            }.bind(this));
        }
    }

    export class App extends Two {

        private rootScene:Scene2D;

        constructor() {
            super(800, 520);
            document.body.appendChild(this.domElement);

            this.rootScene = new HelloWorldScene(this);
            this.presentScene(this.rootScene);
        }
    }
}


new plter.App();