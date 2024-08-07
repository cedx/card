#!/usr/bin/env node
import console from "node:console";
import process from "node:process";
import {parseArgs} from "node:util";
import card from "../lib/index.js";
import pkg from "../package.json" with {type: "json"};

// Give the process a friendly name.
process.title = "Cédric Belin's Card";

// The usage information.
const usage = `
Print the business card of Cédric Belin, full stack developer.

Usage:
  npx @cedx/card

Options:
  -h, --help     Display this help.
  -v, --version  Output the version number.
`;

// Start the application.
try {
	const {values} = parseArgs({options: {
		help: {short: "h", type: "boolean", default: false},
		version: {short: "v", type: "boolean", default: false}
	}});

	console.log(values.help ? usage.trim() : values.version ? pkg.version : card(1));
}
catch (error) {
	console.error(error instanceof Error ? error.message : error);
	process.exit(1);
}
