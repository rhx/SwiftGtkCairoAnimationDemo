import PackageDescription

let package = Package(
    name: "GtkCairoAnimationDemo",
    dependencies: [
        .Package(url: "https://github.com/rhx/SwiftGtk.git", majorVersion: 3)
    ]
)
