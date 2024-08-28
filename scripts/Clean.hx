import sys.FileSystem;
using Lambda;

/** Deletes all generated files. **/
function main() {
	["js", "js.map"].map(ext -> 'bin/belin_card.$ext').filter(FileSystem.exists).iter(FileSystem.deleteFile);
	["lib", "res"].filter(FileSystem.exists).iter(Tools.removeDirectory);
	Tools.cleanDirectory("var");
}
