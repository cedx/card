import console from "node:console";
import process from "node:process";
import {parseArgs} from "node:util";
import {getCard} from "./card.js";
import pkg from "../package.json" with {type: "json"};

// The usage information.
const usage = `
Print the business card of Cédric Belin, full stack developer.

Usage:
	npx @cedx/card [options]

Options:
	-h, --help     Display this help.
	-v, --version  Output the version number.
`;

// Start the application.
try {
	process.title = "Cédric Belin's Card";
	const {values} = parseArgs({options: {
		help: {short: "h", type: "boolean", default: false},
		version: {short: "v", type: "boolean", default: false}
	}});

	console.log(values.help
		? usage.trim().replaceAll("\t", "  ")
		: values.version ? pkg.version : getCard(1));
}
catch (error) {
	console.error(error instanceof Error ? error.message : error);
	process.exit(500);
}
