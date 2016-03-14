///<reference path="../../two/com/plter/two/Two.ts"/>
///<reference path="../../two/com/plter/two/display/Image.ts"/>
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
    var Two = com.plter.two.Two;
    var Scene2D = com.plter.two.display.Scene2D;
    var TextureLoader = THREE.TextureLoader;
    var Image = com.plter.two.display.Image;
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
    })(Two);
    plter.App = App;
})(plter || (plter = {}));
new plter.App();
//# sourceMappingURL=App.js.map