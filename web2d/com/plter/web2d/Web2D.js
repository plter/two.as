///<reference path="../../../../3rd/libs/3js/three.d.ts"/>
///<reference path="display/Scene2D.ts"/>
///<reference path="Context.ts"/>
///<reference path="tools/Tools.ts"/>
///<reference path="events/MouseEvent.ts"/>
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
            var EventListenerList = com.plter.web2d.events.EventListenerList;
            var Web2D = (function (_super) {
                __extends(Web2D, _super);
                function Web2D(width, height) {
                    _super.call(this);
                    this._ratio = 1;
                    this._lastTime = 0;
                    this._eventListeners = new EventListenerList();
                    this._mousePoint = new THREE.Vector2();
                    this.stageWidth = width;
                    this.stageHeight = height;
                    this._ratio = width / height;
                    this._scene = new Scene();
                    this._camera = new PerspectiveCamera(90, width / height, 0.01, 100);
                    this._camera.position.z = 0.5;
                    this._renderer = new WebGLRenderer();
                    this._renderer.setSize(width, height);
                    this._raycaster = new THREE.Raycaster();
                    this.addListeners();
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
                Object.defineProperty(Web2D.prototype, "eventListeners", {
                    get: function () {
                        return this._eventListeners;
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
                Web2D.prototype.hitTest = function (display, pointX, pointY) {
                    this._mousePoint.x = pointX;
                    this._mousePoint.y = pointY;
                    this._raycaster.setFromCamera(this._mousePoint, this._camera);
                    return this._raycaster.intersectObject(display.object3D).length > 0;
                };
                Web2D.prototype.addListeners = function () {
                    this.domElement.addEventListener("click", this.eventHandler.bind(this));
                    this.domElement.addEventListener("dblclick", this.eventHandler.bind(this));
                    this.domElement.addEventListener("contextmenu", this.eventHandler.bind(this));
                    this.domElement.addEventListener("mousedown", this.eventHandler.bind(this));
                    this.domElement.addEventListener("mouseup", this.eventHandler.bind(this));
                };
                Web2D.prototype.eventHandler = function (e) {
                    var x = 0, y = 0;
                    if (e.layerX) {
                        x = e.layerX;
                    }
                    if (e.offsetX) {
                        x = e.offsetX;
                    }
                    if (e.layerY) {
                        y = e.layerY;
                    }
                    if (e.offsetY) {
                        y = e.offsetY;
                    }
                    x = (x / this.stageWidth) * 2 - 1;
                    y = 1 - (y / this.stageHeight) * 2;
                    this._eventListeners.dispatch(new com.plter.web2d.events.MouseEvent(e.type, x, y, e));
                };
                return Web2D;
            })(web2d.Context);
            web2d.Web2D = Web2D;
        })(web2d = plter.web2d || (plter.web2d = {}));
    })(plter = com.plter || (com.plter = {}));
})(com || (com = {}));
//# sourceMappingURL=Web2D.js.map