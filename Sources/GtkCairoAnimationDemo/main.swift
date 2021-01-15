import GLib
import Cairo
import Gtk

var drawingArea: DrawingArea!

let status = Application.run { app in
    let window = ApplicationWindowRef(application: app)
    window.title = "Bouncing Disc"
    window.setDefaultSize(width: 320, height: 200)

    drawingArea = DrawingArea()
    window.set(child: drawingArea)

    let r = 10.0    // disc radius
    var x = r       // position
    var y = r
    var dy = 1.0    // velocity
    var dx = 1.0
    let ax = 0.0    // acceleration
    let ay = 1.0
    drawingArea.setDrawFunc { drawingArea, cr, width, height in
        let w = Double(width)
        let h = Double(height)

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
    }
    window.show()

    /// draw our animation at 50Hz (every 20ms)
    timeout(add: 20) {
        drawingArea.queueDraw()
        return true
    }
}

guard let status = status else {
    fatalError("Could not create Application")
}
guard status == 0 else {
    fatalError("Application exited with status \(status)")
}
