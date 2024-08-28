/** Packages the project. **/
function main() {
	final file = "bin/belin_card.js";
	for (script in ["Clean", "Build", "Version"]) Sys.command('lix $script');
	Sys.command('npx esbuild --allow-overwrite --legal-comments=none --log-level=warning --minify --outfile=$file --platform=node $file');
	if (Sys.systemName() != "Windows") Sys.command('chmod +x $file');
}
