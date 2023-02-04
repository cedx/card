//! --class-path src --define hxnodejs --library hxnodejs --library tink_core
import haxe.Exception;
import haxe.Timer;
import js.glob_watcher.GlobWatcher;
import js.lib.Error as JsError;
using tink.CoreApi;

/** Runs the script. **/
function main() GlobWatcher.watch("src/belin_card/**/*.hx", {ignoreInitial: false}, done -> measureCallback(done, () -> {
	Sys.command("haxe build.hxml");
	Sys.command("node bin/belin_card.js");
}));

/** Measures the time it takes to run the specified callback. **/
private function measureCallback(done: ?JsError -> Void, callback: Callback<Noise>) {
	final timestamp = Timer.stamp();
	final error = try { callback.invoke(Noise); ""; } catch (e) e.message;
	if (error.length > 0) return done(new JsError(error));
	Sys.println(Tools.formatDuration(Timer.stamp() - timestamp));
	done();
}
