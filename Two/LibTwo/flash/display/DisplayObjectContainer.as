package flash.display {

    import com.plter.two.supports.threejs.THREE;

    public class DisplayObjectContainer extends InteractiveObject {


        public function DisplayObjectContainer() {
            threejsObject = new THREE.Group();
            threejsObject['__displayObject'] = this;
        }

        public function addChild(child:DisplayObject):DisplayObject {
            threejsObject['add'](child.threejsObject);
            return this;
        }

        public function addChildAt(child:DisplayObject, index:int):DisplayObject {
            throw new Error("Not implemented");
            return this;
        }
    }
}
