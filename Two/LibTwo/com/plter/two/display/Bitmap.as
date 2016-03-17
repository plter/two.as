/**
 * Created by plter on 3/14/16.
 */
package com.plter.two.display {
import com.plter.two.app.Context;
import com.plter.two.supports.threejs.THREE;
import com.plter.two.supports.threejs.Texture;

public class Bitmap extends Display {


    private var _texture:Texture;
    private var _ratio:Number;

    public function Bitmap(context:Context, texture:Texture) {

        _ratio = 2 / context.stage.stageHeight;

        var mat:* = new THREE.MeshBasicMaterial();//{color: 0xffffff, side: THREE.DoubleSide, map: texture.threejsTexture}
        mat['color'] = new THREE.Color(0xffffff);
        mat['side'] = THREE.DoubleSide;
        mat['map'] = texture.threejsTexture;
        var object3D:* = new THREE.Mesh(createPlaneGeometryByTextureSize(texture), mat);
        super(context, object3D);

        _texture = texture;
    }


    public function get texture():Texture {
        return _texture;
    }

    public function set texture(value:Texture):void {
        _texture = value;
        threeJsObject['material']['map'] = value.threejsTexture;
    }

    protected function protected_updateGeometry(texture:Texture):void {
        threeJsObject['geometry'] = createPlaneGeometryByTextureSize(texture);
    }

    private function createPlaneGeometryByTextureSize(texture:Texture):* {
        return new THREE.PlaneGeometry(texture.image['width'] * _ratio, texture.image['height'] * _ratio);
    }
}
}
