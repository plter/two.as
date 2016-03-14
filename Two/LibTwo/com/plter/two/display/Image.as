/**
 * Created by plter on 3/14/16.
 */
package com.plter.two.display {
import com.plter.two.app.Context;
import com.plter.two.supports.threejs.THREE;
import com.plter.two.supports.threejs.Texture;

public class Image extends Display {


    public function Image(context:Context, texture:Texture) {

        var ratio:Number = 2 / context.stage.stageHeight;

        var geom:* = new THREE.PlaneGeometry(texture.image.width * ratio, texture.image.height * ratio);
        var mat:* = new THREE.MeshBasicMaterial();//{color: 0xffffff, side: THREE.DoubleSide, map: texture.threejsTexture}
        mat['color'] = new THREE.Color(0xffffff);
        mat['side'] = THREE.DoubleSide;
        mat['map'] = texture.threejsTexture;
        var object3D:* = new THREE.Mesh(geom, mat);
        super(context, object3D);
    }
}
}
