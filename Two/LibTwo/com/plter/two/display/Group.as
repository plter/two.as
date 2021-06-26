/**
 * Created by plter on 3/12/16.
 */
package com.plter.two.display {
    import com.plter.two.app.Context;
    import com.plter.two.supports.threejs.THREE;

    public class Group extends ContainerBase {

        private var _children:Array = [];

        public function Group(context:Context) {
            super(context, new THREE.Group());
        }
    }
}
