// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "GtkCairoAnimationDemo",
    dependencies: [
        .package(name: "gir2swift", url: "https://github.com/rhx/gir2swift.git", .branch("main")),
        .package(name: "Gtk", url: "https://github.com/rhx/SwiftGtk.git", .branch("gtk4")),
    ],
    targets: [
        .target(name: "GtkCairoAnimationDemo", dependencies: ["Gtk"]),
    ]
)
