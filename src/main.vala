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

    var app = new Gtk.Application("com.github.blackscorp.rift", ApplicationFlags.HANDLES_OPEN | ApplicationFlags.FLAGS_NONE);
 

    app.open.connect(()=>{


        var builder = new Gtk.Builder();
        print("open\n");
        try {
            builder.add_from_file(ui_path);
        } catch (Error e) {
            stderr.printf("Failed to load UI: %s\n", e.message);
            return;
        }

                
        var window = builder.get_object("main_window") as Gtk.ApplicationWindow;
        window.application = app;
        GtkLayerShell.init_for_window(window);
        GtkLayerShell.auto_exclusive_zone_enable(window);
    // GtkLayerShell.set_anchor(window, GtkLayerShell.Edge.BOTTOM, true);
        //GtkLayerShell.set_margin(window, GtkLayerShell.Edge.BOTTOM, 10);

        var close_button = builder.get_object("close_button") as Gtk.Button;
        close_button.clicked.connect(() => window.close());

        window.present();
    });
    
    app.startup.connect(() => {
    print("startup\n");

 
    });

    return app.run(args);
}
