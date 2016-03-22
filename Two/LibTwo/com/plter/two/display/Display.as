/**
 * Created by plter on 3/14/16.
 */
package com.plter.two.display {
import com.plter.two.app.Context;
import com.plter.two.supports.threejs.THREE;

public class Display extends Node {


    private var _texture:*;
    private var _ratio:Number;
    private var _canvas:HTMLCanvasElement;
    private var _context2d:CanvasRenderingContext2D;

    public function Display(context:Context) {

        _ratio = 2 / context.stage.stageHeight;

        _canvas = document.createElement("canvas") as HTMLCanvasElement;
        _canvas.width = 256;
        _canvas.height = 256;
        _context2d = _canvas.getContext("2d") as CanvasRenderingContext2D;

        _texture = new THREE.Texture(_canvas);

        var mat:* = new THREE.MeshBasicMaterial();
        mat['side'] = THREE.DoubleSide;
        mat['map'] = texture;
        var object3D:* = new THREE.Mesh(new THREE.PlaneGeometry(_canvas.width * _ratio, _canvas.height * _ratio), mat);
        super(context, object3D);

        _texture = texture;
    }


    public function get width():Number {
        return widthInPixel * _ratio;
    }

    public function get widthInPixel():Number {
        return canvas.width;
    }

    public function get height():Number {
        return heightInPixel * _ratio;
    }

    public function get heightInPixel():Number {
        return canvas.height;
    }

    public function set width(value:Number):void {
        widthInPixel = value / _ratio;
    }

    public function set widthInPixel(value:Number):void {
        if (canvas.width != value) {
            resizeGeometry(value, heightInPixel);
        }

        canvas.width = value;
    }

    public function set height(value:Number):void {
        heightInPixel = value / _ratio;
    }

    public function set heightInPixel(value:Number):void {
        if (canvas.height != value) {
            resizeGeometry(widthInPixel, value);
        }

        canvas.height = value;
    }

    public function setSize(width:Number, height:Number):void {
        setSizeInPixel(width / _ratio, height / _ratio);
    }

    public function setSizeInPixel(width:Number, height:Number):void {
        if (canvas.width != width || canvas.height != height) {
            resizeGeometry(width, height);
        }

        canvas.width = width;
        canvas.height = height;
    }


    public function get texture():* {
        return _texture;
    }

    private function get canvas():HTMLCanvasElement {
        return _canvas;
    }

    public function get context2d():CanvasRenderingContext2D {
        return _context2d;
    }

    public function updateTexture():void {
        texture['needsUpdate'] = true;
    }

    private function resizeGeometry(widthInPixel:Number, heightInPixel:Number):void {
        trace("resize", widthInPixel, heightInPixel);
        threeJsObject['geometry'] = new THREE.PlaneGeometry(widthInPixel * _ratio, heightInPixel * _ratio);
    }
}
}
