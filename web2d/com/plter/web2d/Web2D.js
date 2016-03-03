///<reference path="../../../../3rd/libs/3js/three.d.ts"/>
///<reference path="display/Scene2D.ts"/>
///<reference path="Context.ts"/>
var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
/**
 * Created by plter on 3/3/16.
 */
var com;
(function (com) {
    var plter;
    (function (plter) {
        var web2d;
        (function (web2d) {
            var Scene = THREE.Scene;
            var WebGLRenderer = THREE.WebGLRenderer;
            var PerspectiveCamera = THREE.PerspectiveCamera;
            var Web2D = (function (_super) {
                __extends(Web2D, _super);
                function Web2D(width, height) {
                    _super.call(this);
                    this._ratio = 1;
                    this._lastTime = 0;
                    this.stageWidth = width;
                    this.stageHeight = height;
                    this._ratio = width / height;
                    this._scene = new Scene();
                    this._camera = new PerspectiveCamera(90, width / height, 0.01, 100);
                    this._camera.position.z = 0.5;
                    this._renderer = new WebGLRenderer();
                    this._renderer.setSize(width, height);
                    this.render();
                }
                Web2D.prototype.render = function () {
                    var currentTime = new Date().getTime();
                    if (this._scene2D) {
                        this._scene2D.update(currentTime - this._lastTime);
                        this._scene2D.onUpdate.dispatch();
                    }
                    this._lastTime = currentTime;
                    //render
                    this._renderer.render(this._scene, this._camera);
                    requestAnimationFrame(this.render.bind(this));
                };
                Object.defineProperty(Web2D.prototype, "domElement", {
                    get: function () {
                        return this._renderer.domElement;
                    },
                    enumerable: true,
                    configurable: true
                });
                Object.defineProperty(Web2D.prototype, "ratio", {
                    get: function () {
                        return this._ratio;
                    },
                    enumerable: true,
                    configurable: true
                });
                Web2D.prototype.presentScene = function (scene) {
                    if (this._scene2D) {
                        this._scene.remove(this._scene2D.object3D);
                    }
                    this._scene2D = scene;
                    this._scene.add(this._scene2D.object3D);
                };
                return Web2D;
            })(web2d.Context);
            web2d.Web2D = Web2D;
        })(web2d = plter.web2d || (plter.web2d = {}));
    })(plter = com.plter || (com.plter = {}));
})(com || (com = {}));
//# sourceMappingURL=Web2D.js.map