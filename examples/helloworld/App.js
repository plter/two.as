///<reference path="../../web2d/com/plter/web2d/Web2D.ts"/>
///<reference path="../../web2d/com/plter/web2d/display/Image.ts"/>
var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
/**
 * Created by plter on 3/3/16.
 */
var plter;
(function (plter) {
    var Web2D = com.plter.web2d.Web2D;
    var Scene2D = com.plter.web2d.display.Scene2D;
    var TextureLoader = THREE.TextureLoader;
    var Image = com.plter.web2d.display.Image;
    var HelloWorldScene = (function (_super) {
        __extends(HelloWorldScene, _super);
        function HelloWorldScene(context) {
            _super.call(this, context);
            var loader = new TextureLoader();
            loader.load("img.jpg", function (texture) {
                this.img = new Image(this.context, texture);
                this.img.position.z = -1;
                this.add(this.img);
                this.onUpdate.add(function () {
                    this.img.rotation.y += 0.01;
                }.bind(this));
            }.bind(this));
        }
        return HelloWorldScene;
    })(Scene2D);
    var App = (function () {
        function App() {
            this.web2d = new Web2D(800, 520);
            document.body.appendChild(this.web2d.domElement);
            this.rootScene = new HelloWorldScene(this.web2d);
            this.web2d.presentScene(this.rootScene);
        }
        return App;
    })();
    plter.App = App;
})(plter || (plter = {}));
new plter.App();
//# sourceMappingURL=App.js.map