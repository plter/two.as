/**
 * Created by plter on 3/12/16.
 */
package com.plter.two.display {
    import com.plter.two.app.Context;

    public class ContainerBase extends TNode {

        private var _children:Array = [];

        public function ContainerBase(context:Context, container:*) {
            super(context, container);
        }

        public function addChild(display:TNode):void {
            object3D['add'](display.object3D);
        }

        public function removeChild(display:TNode):void {
            object3D['remove'](display.object3D);
        }

        public function childAt(index:uint):TNode {
            return object3D['children'][index]['node'];
        }

        public function childByName(name:String):TNode {
            var children3D:* = object3D['children'];
            var length:int = children3D['length'];
            var node:TNode;

            for (var i:int = 0; i < length; i++) {
                node = children3D[i]['node'];
                if (node.name && node.name == name) {
                    return node;
                }
            }
            return null;
        }


        public function get children():Array {
            while (_children.length) {
                _children.pop();
            }

            var children3D:* = object3D['children'];
            var length:int = children3D['length'];
            for (var i:int = 0; i < length; i++) {
                _children.push(children3D[i]['node']);
            }

            return _children;
        }
    }
}
