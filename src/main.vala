using Gtk;
using GtkLayerShell;

int main(string[] args) {
    // Create GTK application
    var app = new Gtk.Application(
        "com.github.yourname.rift",
        GLib.ApplicationFlags.FLAGS_NONE
    );

    // Connect activate signal
    app.activate.connect(() => {
        // Create main window
        var window = new Gtk.ApplicationWindow(app);

        // Initialize LayerShell for window
        GtkLayerShell.init_for_window(window);
        GtkLayerShell.auto_exclusive_zone_enable(window);

        // Anchor window to bottom
     //   GtkLayerShell.set_anchor(window, GtkLayerShell.Edge.BOTTOM, true);
      //  GtkLayerShell.set_margin(window, GtkLayerShell.Edge.BOTTOM, 10);

        // Minimal child
        var button = new Gtk.Button.with_label("Hello Rift!");
        button.clicked.connect(() => window.close());

        window.set_child(button);
        window.present();
    });

    return app.run(args);
}