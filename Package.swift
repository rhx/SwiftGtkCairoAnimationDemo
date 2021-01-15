// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "GtkCairoAnimationDemo",
    dependencies: [
        .package(name: "gir2swift", url: "https://github.com/rhx/gir2swift.git", .branch("main")),
        .package(url: "https://github.com/rhx/SwiftGtk.git", .branch("gtk3")),
    ],
    targets: [
        .target(name: "GtkCairoAnimationDemo", dependencies: ["Gtk"]),
    ]
)
