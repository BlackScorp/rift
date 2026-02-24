using Gtk;
using GtkLayerShell;
using GLib;

int main(string[] args) {
    if (args.length < 2) {
        print("Usage: %s <ui-file>\n", args[0]);
        return 1;
    }

    string ui_file = args[1];
    string ui_path = Path.build_filename(Environment.get_current_dir(), ui_file);

    var app = new Gtk.Application("com.github.blackscorp.rift", ApplicationFlags.HANDLES_OPEN);

    app.activate.connect(() => {
     
    });

    app.open.connect(()=>{
        load_ui(ui_path);
    });

    return app.run(args);
}


void load_ui(string ui_file) {
    var builder = new Gtk.Builder();
    try {
        builder.add_from_file(ui_file);
    } catch (Error e) {
        stderr.printf("Failed to load UI: %s\n", e.message);
        return;
    }

    var window = builder.get_object("main_window") as Gtk.ApplicationWindow;

    GtkLayerShell.init_for_window(window);
    GtkLayerShell.auto_exclusive_zone_enable(window);
   // GtkLayerShell.set_anchor(window, GtkLayerShell.Edge.BOTTOM, true);
    //GtkLayerShell.set_margin(window, GtkLayerShell.Edge.BOTTOM, 10);

    //var close_button = builder.get_object("close_button") as Gtk.Button;
    //close_button.clicked.connect(() => window.close());

    window.present();
}