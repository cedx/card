//! --class-path src
import belin_card.Version;
import sys.FileSystem;
import sys.io.File;

/** Runs the script. **/
function main() {
	if (FileSystem.exists("docs")) Tools.removeDirectory("docs");

	Sys.command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");
	Sys.command("lix", [
		"run", "dox",
		"--define", "description", "Business card of Cédric Belin, full stack developer.",
		"--define", "source-path", "https://github.com/cedx/card/blob/main/src",
		"--define", "themeColor", "0x772953",
		"--define", "version", Version.packageVersion,
		"--define", "website", "https://github.com/cedx/card",
		"--input-path", "var",
		"--output-path", "docs",
		"--title", "Cédric Belin's Card",
		"--toplevel-package", "belin_card"
	]);

	File.copy("www/favicon.ico", "docs/favicon.ico");
}
