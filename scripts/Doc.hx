//! --class-path src
import Sys.*;
import Tools;
import card.Version.*;
import sys.FileSystem.*;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	if (exists("docs")) removeDirectory("docs");

	command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");
	command("lix", [
		"run", "dox",
		"--define", "description", "Business card of Cédric Belin, full stack developer.",
		"--define", "source-path", "https://github.com/cedx/card/blob/main/src",
		"--define", "themeColor", "0xffc105",
		"--define", "version", packageVersion,
		"--define", "website", "https://github.com/cedx/card",
		"--input-path", "var",
		"--output-path", "docs",
		"--title", "Cédric Belin's Card",
		"--toplevel-package", "card"
	]);

	copy("www/favicon.ico", "docs/favicon.ico");
}
