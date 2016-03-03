///<reference path="../../../../3rd/libs/3js/three.d.ts"/>
///<reference path="display/Scene2D.ts"/>
///<reference path="Context.ts"/>

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

    export class Web2D extends Context {

        private _scene:Scene;
        private _renderer:Renderer;
        private _camera:PerspectiveCamera;
        private _ratio:number = 1;
        private _lastTime:number = 0;
        private _scene2D:Scene2D;

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

        presentScene(scene:Scene2D) {
            if (this._scene2D) {
                this._scene.remove(this._scene2D.object3D);
            }

            this._scene2D = scene;
            this._scene.add(this._scene2D.object3D);
        }
    }
}