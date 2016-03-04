///<reference path="../../../../../3rd/libs/3js/three.d.ts"/>
///<reference path="../display/Display.ts"/>

/**
 * Created by plter on 3/4/16.
 */

namespace com.plter.web2d.core {


    import Object3D = THREE.Object3D;
    import Display = com.plter.web2d.display.Display;

    export class Tools {
        public static getDisplayFromObject3D(obj3d:Object3D):Display {
            return obj3d["display"];
        }
    }
}