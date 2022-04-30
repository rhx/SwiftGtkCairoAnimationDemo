// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "GtkCairoAnimationDemo",
    dependencies: [
        .package(url: "https://github.com/rhx/SwiftGtk.git", branch: "gtk4"),
    ],
    targets: [
        .executableTarget(name: "GtkCairoAnimationDemo", dependencies: [
            .product(name: "Gtk", package: "SwiftGtk"),
        ]),
    ]
)
