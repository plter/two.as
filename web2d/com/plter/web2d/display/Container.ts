///<reference path="Display.ts"/>
/**
 * Created by plter on 3/3/16.
 */

namespace com.plter.web2d.display {

    export abstract class Container extends Display {


        constructor(context:Context, object3D:THREE.Object3D) {
            super(context, object3D);
        }

        remove(display:Display):void {
            this.object3D.remove(display.object3D);
        }

        add(display:Display):void {
            this.object3D.add(display.object3D);
        }
    }
}