/**
 * Created by plter on 3/15/16.
 */
package com.plter.two.display {
import com.plter.two.app.Context;
import com.plter.two.supports.threejs.THREE;
import com.plter.two.supports.threejs.Texture;

public class TextLine extends Bitmap {

    private var _text:String;
    private var _fontSize:uint;
    private var _fontFamily:String;
    private var _fillStyle:String;

    public function TextLine(context:Context, text:String = "Text", fontSize:uint = 12, fillStyle:String = "#00ffff", fontFamily:String = "Courier") {
        _fontFamily = fontFamily;
        _fontSize = fontSize;
        _text = text;
        _fillStyle = fillStyle;

        refreshTextureByNewValues();
        super(context, new Texture(threejsTexture));
    }


    public function get text():String {
        return _text;
    }

    public function set text(value:String):void {
        _text = value;

        refreshTextureByNewValues();
        needUpdateBounds();
    }

    public function get fontSize():uint {
        return _fontSize;
    }

    public function set fontSize(value:uint):void {
        _fontSize = value;

        refreshTextureByNewValues();
        needUpdateBounds();
    }

    public function get fontFamily():String {
        return _fontFamily;
    }

    public function set fontFamily(value:String):void {
        _fontFamily = value;

        refreshTextureByNewValues();
        needUpdateBounds();
    }

    public function get font():String {
        return fontSize + "px " + fontFamily;
    }


    public function set fillStyle(value:String):void {
        _fillStyle = value;

        refreshTextureByNewValues();
        needUpdateBounds();
    }

    public function get fillStyle():String {
        return _fillStyle;
    }

    public function refreshTextureByNewValues():void {
        refreshTexture(text, fontSize, font, fillStyle);
    }


//text renderer canvas
    private var _context2D:CanvasRenderingContext2D = null;
    private var _rendererImage:Image = null;
    private var _threejsTexture:* = null;

    private function get context2D():CanvasRenderingContext2D {
        if (!_context2D) {
            var canvas:HTMLCanvasElement = document.createElement("canvas") as HTMLCanvasElement;
            canvas.width = 40;
            canvas.height = 30;
            _context2D = canvas.getContext("2d") as CanvasRenderingContext2D;
        }
        return _context2D;
    }


    private function get rendererImage():Image {
        if (!_rendererImage) {
            _rendererImage = new Image();
        }
        return _rendererImage;
    }


    private function get threejsTexture():* {
        if (!_threejsTexture) {
            _threejsTexture = new THREE.Texture();
            _threejsTexture.image = rendererImage;
        }
        return _threejsTexture;
    }

    private function refreshTexture(text:String, lineHeight:Number, font:String, fillStyle:String):void {
        var ctx:CanvasRenderingContext2D = context2D;

        ctx.font = font;
        ctx.fillStyle = fillStyle;
        var width:Number = ctx.measureText(text).width;

        var imageWidth:Number = resetNumber(width);
        var imageHeight:Number = resetNumber(lineHeight);
        ctx.canvas.width = imageWidth;
        ctx.canvas.height = imageHeight;

        ctx.clearRect(0, 0, imageWidth, imageHeight);

        ctx.font = font;
        ctx.fillStyle = fillStyle;

        ctx.fillText(text, 0, imageHeight);

        rendererImage.src = ctx.canvas.toDataURL();

        threejsTexture['image'] = rendererImage;
        threejsTexture['needsUpdate'] = true;
    }

    private static function resetNumber(value:Number):Number {
        return Math.pow(2, Math.ceil((Math.log(value) * Math.LOG2E)))
    }
}
}
