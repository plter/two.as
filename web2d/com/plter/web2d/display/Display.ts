///<reference path="../../../../../3rd/libs/3js/three.d.ts"/>
///<reference path="../Context.ts"/>
/**
 * Created by plter on 3/3/16.
 */

namespace com.plter.web2d.display {

    import Mesh = THREE.Mesh;
    import Object3D = THREE.Object3D;

    export abstract class Display {

        private _object3D:Object3D;
        private _context:Context;

        constructor(context:Context, object3D:Object3D) {
            this._object3D = object3D;
            this._context = context;
        }

        get object3D():Object3D {
            return this._object3D;
        }


        get context():com.plter.web2d.Context {
            return this._context;
        }

        get position():THREE.Vector3 {
            return this.object3D.position;
        }

        get rotation():THREE.Euler {
            return this.object3D.rotation;
        }
    }
}