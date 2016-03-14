///<reference path="Display.ts"/>
///<reference path="../Context.ts"/>
/**
 * Created by plter on 3/3/16.
 */
namespace com.plter.two.display {

    import Mesh = THREE.Mesh;
    import PlaneGeometry = THREE.PlaneGeometry;
    import Texture = THREE.Texture;
    import MeshBasicMaterial = THREE.MeshBasicMaterial;

    export class Image extends Display {

        constructor(context:Context, texture:Texture) {

            var ratio = 1 / context.stageHeight;

            var geom = new PlaneGeometry(texture.image.width * ratio, texture.image.height * ratio);
            var mat = new MeshBasicMaterial({color: 0xffffff, side: THREE.DoubleSide, map: texture});
            var object3D = new Mesh(geom, mat);
            super(context, object3D);
        }
    }
}