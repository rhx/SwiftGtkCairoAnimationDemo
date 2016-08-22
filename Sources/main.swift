import CCairo
import Cairo
import Gtk

var drawingArea: DrawingArea!

let status = Application.run { app in
    var window = ApplicationWindowRef(application: app)
    window.title = "Hello, Window"
    window.setDefaultSize(width: 400, height: 90)

    drawingArea = DrawingArea()
    window.add(widget: drawingArea)

    drawingArea.onDraw {
        let cr = $1.ptr
        cairo_set_source_rgb(cr, 0, 0, 0)
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                               CAIRO_FONT_WEIGHT_NORMAL)
        cairo_set_font_size(cr, 40)
        cairo_move_to(cr, 10, 50)
        cairo_show_text(cr, "Hello, Cairo")

        return false
    }
    window.showAll()
}

guard let status = status else {
    fatalError("Could not create Application")
}
guard status == 0 else {
    fatalError("Application exited with status \(status)")
}
