package com.plter.two.display {
    import com.plter.two.app.Context;
    import com.plter.two.supports.threejs.THREE;

    public class CanvasObject extends TNode {
        private var _ratio:Number;
        private var _canvas:HTMLCanvasElement;
        private var _geometryWidthInPixel:Number;
        private var _geometryHeightInPixel:Number;
        private var _context2d:CanvasRenderingContext2D;
        private var _texture:*;

        public function CanvasObject(context:Context, canvas:HTMLCanvasElement) {
            _ratio = context.stage.spaceRatio;

            _canvas = canvas;
            _canvas.style.backgroundColor = "rgba(0,0,0,0)";
            _geometryWidthInPixel = canvas.width;
            _geometryHeightInPixel = canvas.height;
            _context2d = _canvas.getContext("2d") as CanvasRenderingContext2D;

            _texture = new THREE.CanvasTexture(_canvas);
            updateTexture();

            var mat:* = new THREE.MeshBasicMaterial({"side": THREE.DoubleSide, "map": _texture, "transparent": true});

            var object3D:* = new THREE.Mesh(createGeometry(geometryWidth, geometryHeight), mat);
            super(context, object3D);
        }

        public function get canvasWidth():Number {
            return canvasWidthInPixel * _ratio;
        }

        public function get canvasWidthInPixel():Number {
            return canvas.width;
        }

        public function get canvasHeight():Number {
            return canvasHeightInPixel * _ratio;
        }

        public function get canvasHeightInPixel():Number {
            return canvas.height;
        }

        public function set canvasWidth(value:Number):void {
            canvasWidthInPixel = value / _ratio;
        }

        public function set canvasWidthInPixel(value:Number):void {
            canvas.width = value;
        }

        public function set canvasHeight(value:Number):void {
            canvasHeightInPixel = value / _ratio;
        }

        public function set canvasHeightInPixel(value:Number):void {
            canvas.height = value;
        }

        public function setCanvasSize(width:Number, height:Number):void {
            setCanvasSizeInPixel(width / _ratio, height / _ratio);
        }

        public function setCanvasSizeInPixel(width:Number, height:Number):void {
            canvas.width = width;
            canvas.height = height;
        }

        [Deprecated]
        public function setCanvasSizeAndGeometrySizeInPixel(canvasWidth:Number, canvasHeight:Number, geometryWidth:Number, geometryHeight:Number):void {
            setCanvasSizeInPixel(canvasWidth, canvasHeight);
            setGeometrySizeInPixel(geometryWidth, geometryHeight);
        }

        public function setSizeInPixel(widthInPixel:Number, heightInPixel:Number):void {
            setCanvasSizeInPixel(widthInPixel, heightInPixel);
            setGeometrySizeInPixel(widthInPixel, heightInPixel);
        }

        public function setGeometrySizeInPixel(widthInPixel:Number, heightInPixel:Number):void {
            if (_geometryWidthInPixel != widthInPixel || _geometryHeightInPixel != heightInPixel) {
                resizeGeometry(widthInPixel * _ratio, heightInPixel * _ratio);
            }

            _geometryWidthInPixel = widthInPixel;
            _geometryHeightInPixel = heightInPixel;
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

        public function get geometryWidth():Number {
            return _geometryWidthInPixel * _ratio;
        }

        public function set geometryWidth(value:Number):void {
            geometryWidthInPixel = Math.round(value / _ratio);
        }

        public function get geometryHeight():Number {
            return _geometryHeightInPixel * _ratio;
        }

        public function set geometryHeight(value:Number):void {
            geometryHeightInPixel = Math.round(value / _ratio);
        }

        public function get geometryWidthInPixel():Number {
            return _geometryWidthInPixel;
        }

        public function set geometryWidthInPixel(value:Number):void {
            if (value != _geometryWidthInPixel) {
                resizeGeometry(value * _ratio, geometryHeight);
            }
            _geometryWidthInPixel = value;
        }

        public function get geometryHeightInPixel():Number {
            return _geometryHeightInPixel;
        }

        public function set geometryHeightInPixel(value:Number):void {
            if (value != _geometryHeightInPixel) {
                resizeGeometry(geometryWidth, value * _ratio);
            }
            _geometryHeightInPixel = value;
        }

        private function resizeGeometry(width:Number, height:Number):void {
            object3D['geometry'] = createGeometry(width, height);
        }

        private function createGeometry(width:Number, height:Number):* {
            var geom:* = new THREE.PlaneGeometry(width, height);
            return geom;
        }
    }
}
