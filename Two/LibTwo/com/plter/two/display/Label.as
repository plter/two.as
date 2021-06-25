/**
 * Created by plter on 3/15/16.
 */
package com.plter.two.display {
    import com.plter.two.app.Context;

    public class Label extends Display {

        private var _text:String;
        private var _fontSize:uint;
        private var _fontFamily:String;
        private var _fillStyle:String;

        public function Label(context:Context, text:String = "Text", fontSize:uint = 12, fillStyle:String = "#000000", fontFamily:String = "Courier") {

            super(context);

            _fontFamily = fontFamily;
            _fontSize = fontSize;
            _text = text;
            _fillStyle = fillStyle;

            redrawText();
        }


        public function get text():String {
            return _text;
        }

        public function set text(value:String):void {
            _text = value;

            redrawText();
        }

        public function get fontSize():uint {
            return _fontSize;
        }

        public function set fontSize(value:uint):void {
            _fontSize = value;

            redrawText();
        }

        public function get fontFamily():String {
            return _fontFamily;
        }

        public function set fontFamily(value:String):void {
            _fontFamily = value;

            redrawText();
        }

        public function get font():String {
            return fontSize + "px " + fontFamily;
        }


        public function set fillStyle(value:String):void {
            _fillStyle = value;

            redrawText();
        }

        public function get fillStyle():String {
            return _fillStyle;
        }

        public function redrawText():void {
            var ctx:CanvasRenderingContext2D = context2d;

            ctx.font = font;
            ctx.fillStyle = fillStyle;
            var textWidth:Number = ctx.measureText(text).width;
            var textHeight:Number = fontSize;

            setSizeInPixel(textWidth, textHeight);

            ctx.clearRect(0, 0, textWidth, textHeight);

            ctx.save();
            ctx.font = font;
            ctx.fillStyle = fillStyle;
            ctx.fillText(text, 0, textHeight);
            ctx.restore();

            updateTexture();
        }


    }
}
