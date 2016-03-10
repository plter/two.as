///<reference path="../../../../3rd/libs/3js/three.d.ts"/>
///<reference path="display/Scene2D.ts"/>
///<reference path="Context.ts"/>
///<reference path="tools/Tools.ts"/>
///<reference path="events/MouseEvent.ts"/>

/**
 * Created by plter on 3/3/16.
 */

namespace com.plter.web2d {

    import Scene2D = com.plter.web2d.display.Scene2D;
    import Scene = THREE.Scene;
    import Renderer = THREE.Renderer;
    import WebGLRenderer = THREE.WebGLRenderer;
    import PerspectiveCamera = THREE.PerspectiveCamera;
    import Object3D = THREE.Object3D;
    import Tools = com.plter.web2d.tools.Tools;
    import EventListenerList = com.plter.web2d.events.EventListenerList;
    import Display = com.plter.web2d.display.Display;

    export class Web2D extends Context {

        private _scene:Scene;
        private _renderer:Renderer;
        private _camera:PerspectiveCamera;
        private _ratio:number = 1;
        private _lastTime:number = 0;
        private _scene2D:Scene2D;
        private _raycaster:THREE.Raycaster;
        private _eventListeners:EventListenerList = new EventListenerList();
        private _mousePoint:THREE.Vector2 = new THREE.Vector2();

        constructor(width:number, height:number) {

            super();

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

        private render():void {

            var currentTime = new Date().getTime();
            if (this._scene2D) {
                this._scene2D.update(currentTime - this._lastTime);
                this._scene2D.onUpdate.dispatch();
            }
            this._lastTime = currentTime;

            //render
            this._renderer.render(this._scene, this._camera);
            requestAnimationFrame(this.render.bind(this));
        }

        get domElement():HTMLCanvasElement {
            return this._renderer.domElement;
        }

        get ratio():number {
            return this._ratio;
        }

        get eventListeners():com.plter.web2d.events.EventListenerList {
            return this._eventListeners;
        }

        presentScene(scene:Scene2D) {
            if (this._scene2D) {
                this._scene.remove(this._scene2D.object3D);
            }

            this._scene2D = scene;
            this._scene.add(this._scene2D.object3D);
        }


        hitTest(display:Display, pointX:number, pointY:number):boolean {
            this._mousePoint.x = pointX;
            this._mousePoint.y = pointY;

            this._raycaster.setFromCamera(this._mousePoint, this._camera);
            return this._raycaster.intersectObject(display.object3D).length > 0;
        }


        private addListeners():void {
            this.domElement.addEventListener("click", this.eventHandler.bind(this));
            this.domElement.addEventListener("dblclick", this.eventHandler.bind(this));
            this.domElement.addEventListener("contextmenu", this.eventHandler.bind(this));
            this.domElement.addEventListener("mousedown", this.eventHandler.bind(this));
            this.domElement.addEventListener("mouseup", this.eventHandler.bind(this));
        }

        private eventHandler(e:MouseEvent):void {
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
        }

    }
}