import GLib
import Cairo
import Gtk

var drawingArea: DrawingArea!

let status = Application.run { app in
    var w = 320.0
    var h = 200.0
    var window = ApplicationWindowRef(application: app)
    window.title = "Bouncing Disc"
    window.setDefaultSize(width: CInt(w), height: CInt(h))

    drawingArea = DrawingArea()
    window.add(widget: drawingArea)

    // update width and height if user resizes the window
    window.connectSignal(name: "configure_event") { _,_ in
        let size = window.size
        w = Double(size.width)
        h = Double(size.height)
        return false
    }

    let r = 10.0    // disc radius
    var x = r       // position
    var y = r
    var dy = 1.0    // velocity
    var dx = 1.0
    var ax = 0.0    // acceleration
    var ay = 1.0
    drawingArea.onDraw {
        var cr = $1 // cairo drawing context

        // draw a black, filled circle
        cr.setSource(red: 0, green: 0, blue: 0)
        cr.arc(xc: x, yc: y, radius: r)
        cr.fill()

        // move its position and check for boundary collisions
        x += dx
        if x >= w-r { dx = -abs(dx) }
        if x <= r { dx = abs(dx) }

        y += dy
        if y >= h-r { dy = -abs(dy) }
        if y <= r { dy = abs(dy) }

        // accelerate
        dx += ax
        dy += ay

        if y > h+abs(dy) {
            y = r
            dy = 1.0
        }
        return false
    }
    window.showAll()

    /// draw our animation at 50Hz (every 20ms)
    timeout(add: 20) {
        window.queueDraw()
        return true
    }
}

guard let status = status else {
    fatalError("Could not create Application")
}
guard status == 0 else {
    fatalError("Application exited with status \(status)")
}
