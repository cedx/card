#!/usr/bin/env node
import console from "node:console";
import {readFileSync} from "node:fs";
import {program} from "commander";
import {getCard} from "../lib/index.js";

// Start the application.
const {version} = JSON.parse(readFileSync(new URL("../package.json", import.meta.url), "utf8"));
program.name("npx @cedx/card")
	.description("Print the business card of Cédric Belin, full stack developer.")
	.version(version, "-v, --version")
	.action(() => console.log(getCard(1)))
	.parse();
