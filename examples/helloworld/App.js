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
            this.uiListeners.add(function (e) {
                if (e.name == "click") {
                    if (this.context.hitTest(this.img, e.x, e.y)) {
                        alert("Image clicked");
                    }
                }
            }.bind(this));
        }
        return HelloWorldScene;
    })(Scene2D);
    var App = (function (_super) {
        __extends(App, _super);
        function App() {
            _super.call(this, 800, 520);
            document.body.appendChild(this.domElement);
            this.rootScene = new HelloWorldScene(this);
            this.presentScene(this.rootScene);
        }
        return App;
    })(Web2D);
    plter.App = App;
})(plter || (plter = {}));
new plter.App();
//# sourceMappingURL=App.js.map