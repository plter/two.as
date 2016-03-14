var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
///<reference path="Display.ts"/>
///<reference path="../Context.ts"/>
/**
 * Created by plter on 3/3/16.
 */
var com;
(function (com) {
    var plter;
    (function (plter) {
        var two;
        (function (two) {
            var display;
            (function (display) {
                var Mesh = THREE.Mesh;
                var PlaneGeometry = THREE.PlaneGeometry;
                var MeshBasicMaterial = THREE.MeshBasicMaterial;
                var Image = (function (_super) {
                    __extends(Image, _super);
                    function Image(context, texture) {
                        var ratio = 1 / context.stageHeight;
                        var geom = new PlaneGeometry(texture.image.width * ratio, texture.image.height * ratio);
                        var mat = new MeshBasicMaterial({ color: 0xffffff, side: THREE.DoubleSide, map: texture });
                        var object3D = new Mesh(geom, mat);
                        _super.call(this, context, object3D);
                    }
                    return Image;
                })(display.Display);
                display.Image = Image;
            })(display = two.display || (two.display = {}));
        })(two = plter.two || (plter.two = {}));
    })(plter = com.plter || (com.plter = {}));
})(com || (com = {}));
//# sourceMappingURL=Image.js.map