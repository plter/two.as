/**
 * Created by plter on 3/12/16.
 */
package com.plter.two.display {
    import com.plter.two.app.Context;
    import com.plter.two.supports.threejs.THREE;

    public class TNode {

        private var _object3D:*;
        private var _context:Context;
        private var _ratio:Number;
        private var _name:String = null;
        private var _box:*;

        public function TNode(context:Context, object3D:*) {
            _context = context;
            _object3D = object3D;
            _box = new THREE.Box3();

            _object3D['node'] = this;
            _ratio = context.stage.spaceRatio;
        }

        public function get object3D():* {
            return _object3D;
        }

        public function get context():Context {
            return _context;
        }

        public function hitTestPoint(pointX:Number, pointY:Number):Boolean {
            return context.tNodeHitTestPoint(pointX, pointY, this);
        }

        public function get x():Number {
            return position['x'];
        }

        public function get y():Number {
            return position['y'];
        }

        public function get z():Number {
            return position['z'];
        }

        public function set x(value:Number):void {
            position['x'] = value;
        }

        public function set y(value:Number):void {
            position['y'] = value;
        }

        public function set z(value:Number):void {
            position['z'] = value;
        }

        public function get rotationX():Number {
            return rotation['x'];
        }

        public function get rotationY():Number {
            return rotation['y'];
        }

        public function get rotationZ():Number {
            return rotation['z'];
        }

        public function set rotationX(value:Number):void {
            rotation['x'] = value;
        }

        public function set rotationY(value:Number):void {
            rotation['y'] = value;
        }

        public function set rotationZ(value:Number):void {
            rotation['z'] = value;
        }

        public function get scaleX():Number {
            return scale['x'];
        }

        public function set scaleX(value:Number):void {
            scale['x'] = value;
        }

        public function get scaleY():Number {
            return scale['y'];
        }

        public function set scaleY(value:Number):void {
            scale['y'] = value;
        }

        private function get position():* {
            return object3D['position'];
        }

        private function get rotation():* {
            return object3D['rotation'];
        }

        private function get scale():* {
            return object3D['scale'];
        }

        public function get xInPixel():Number {
            return x / _ratio;
        }

        public function get yInPixel():Number {
            return y / _ratio;
        }

        public function set xInPixel(value:Number):void {
            x = value * _ratio;
        }

        public function set yInPixel(value:Number):void {
            y = value * _ratio;
        }

        public function set zInPixel(value:Number):void {
            z = value * _ratio;
        }

        public function get zInPixel():Number {
            return z / _ratio;
        }

        public function get name():String {
            return _name;
        }

        public function set name(value:String):void {
            _name = value;
        }

        public function get visible():Boolean {
            return object3D['visible'];
        }

        public function set visible(b:Boolean):void {
            object3D['visible'] = b;
        }

        public function get transparent():Boolean {
            return object3D['material']['transparent'];
        }

        public function set transparent(b:Boolean):void {
            object3D['material']['transparent'] = b;
        }

        public function get opacity():Number {
            return object3D['material']['opacity'];
        }

        public function set opacity(value:Number):void {
            object3D['material']['opacity'] = value;
        }

        /**
         * Get three js box3
         */
        public function get box():* {
            return _box['setFromObject'](object3D);
        }

        public function hitTestObject(node:TNode):Boolean {
            return box['intersectsBox'](node.box);
        }
    }
}
