import Tools.cleanDirectory;
import Tools.removeDirectory;
import sys.FileSystem.*;

using Lambda;

/** Runs the script. **/
function main() {
	["run.n", "bin/cedx", "bin/cedx.js"].filter(exists).iter(deleteFile);
	["lib", "res"].filter(exists).iter(removeDirectory);
	cleanDirectory("var");
}
