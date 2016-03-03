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

        constructor(context:Context) {
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
        }
    }

    export class App {

        private web2d:Web2D;
        private rootScene:Scene2D;

        constructor() {
            this.web2d = new Web2D(800, 520);
            document.body.appendChild(this.web2d.domElement);

            this.rootScene = new HelloWorldScene(this.web2d);
            this.web2d.presentScene(this.rootScene);
        }
    }
}


new plter.App();