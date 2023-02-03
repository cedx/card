import sys.FileSystem;

/** Runs the script. **/
function main() {
	if (FileSystem.exists("bin/belin_card.js")) FileSystem.deleteFile("bin/belin_card.js");
	Tools.cleanDirectory("var");
}
