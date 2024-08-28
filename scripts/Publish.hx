//! --class-path src
import belin_card.Platform;

/** Publishes the package. **/
function main() {
	Sys.command("lix Dist");
	Sys.command("npm publish");
	for (action in ["tag", "push origin"]) Sys.command('git $action v${Platform.packageVersion}');
}
