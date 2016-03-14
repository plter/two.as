package {
public class Main {
    public function Main() {

        var canvas:HTMLCanvasElement = document.getElementById("canvas") as HTMLCanvasElement;
        var context:CanvasRenderingContext2D = canvas.getContext("2d") as CanvasRenderingContext2D;
        context.fillStyle = "#ff0000";
        context.fillRect(0, 0, 100, 100);
    }
}
}
