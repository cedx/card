import Sys.*;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	final isWindows = systemName() == "Windows";
	for (script in ["Clean", "Build"]) command('lix $script');

	var file = "bin/cedx";
	saveContent(file, '#!/usr/bin/env php\n${getContent(file)}');
	command('git update-index --chmod=+x $file');
	if (!isWindows) command('chmod +x $file');

	file = "bin/cedx.js";
	command('npx terser --comments=false --config-file=etc/terser.json --output=$file $file');
	saveContent(file, '#!/usr/bin/env node\n${getContent(file)}');
	command('git update-index --chmod=+x $file');
	if (!isWindows) command('chmod +x $file');
}
