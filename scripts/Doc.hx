//! --class-path src
import belin_card.Version;
import sys.FileSystem;
import sys.io.File;
using Lambda;

/** Builds the documentation. **/
function main() {
	["CHANGELOG.md", "LICENSE.md"].iter(file -> File.copy(file, 'docs/${file.toLowerCase()}'));
	if (FileSystem.exists("docs/api")) Tools.removeDirectory("docs/api");

	Sys.command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");
	Sys.command("lix", ["run", "dox",
		"--define", "description", "Business card of Cedric Belin, full stack developer.",
		"--define", "source-path", "https://github.com/cedx/card/blob/main/src",
		"--define", "themeColor", "0x772953",
		"--define", "version", Version.packageVersion,
		"--define", "website", "https://docs.belin.io/card",
		"--input-path", "var",
		"--output-path", "docs/api",
		"--title", "Cedric Belin's Card",
		"--toplevel-package", "belin_card"
	]);

	File.copy("docs/favicon.ico", "docs/api/favicon.ico");
}
