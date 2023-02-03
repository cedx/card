//! --class-path src
import belin_card.Version;

/** Runs the script. **/
function main()
	Tools.replaceInFile("package.json", ~/"version": "\d+(\.\d+){2}"/, '"version": "${Version.packageVersion}"');
