///<reference path="../../web2d/com/plter/web2d/Web2D.ts"/>
///<reference path="../../web2d/com/plter/web2d/display/Image.ts"/>

/**
 * Created by plter on 3/3/16.
 */

namespace plter {

    import Web2D = com.plter.web2d.Web2D;
    import Scene2D = com.plter.web2d.display.Scene2D;
    import TextureLoader = THREE.TextureLoader;
    import Image = com.plter.web2d.display.Image;
    import Texture = THREE.Texture;
    import Context = com.plter.web2d.Context;

    class HelloWorldScene extends Scene2D {

        private img:Image;

        constructor(context:Web2D) {
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

            this.uiListeners.add(function (e:com.plter.web2d.events.MouseEvent) {
                if (e.name == "click") {
                    if ((this.context as Web2D).hitTest(this.img, e.x, e.y)) {
                        alert("Image clicked");
                    }
                }
            }.bind(this));
        }
    }

    export class App extends Web2D {

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