//! --class-path src
import Tools.replaceInFile;
import card.Version.*;

/** Runs the script. **/
function main()
	replaceInFile("package.json", ~/"version": "\d+(\.\d+){2}"/, '"version": "$packageVersion"');