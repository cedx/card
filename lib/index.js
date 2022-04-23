import console from "node:console";
import {readFile} from "node:fs/promises";
import boxen from "boxen";
import chalk from "chalk";
import {program} from "commander";

/**
 * Application entry point.
 * @returns {Promise.<void>} Resolves when the program is terminated.
 */
export async function main() {
	const {version} = JSON.parse(await readFile(new URL("../package.json", import.meta.url), "utf8"));
	program.name("npx @cedx/card")
		.description("Print the business card of Cédric Belin, full stack developer.")
		.version(version, "-v, --version")
		.parse(process.argv);

	const buffer = [
		chalk.white.bold("Cédric Belin"),
		`${chalk.white("Project manager & lead developer at")} ${chalk.white.bold("MC2IT")}`,
		"",
		`${chalk.white.bold("  GitHub:")} ${chalk.gray("https://github.com/")}${chalk.cyan("cedx")}`,
		`${chalk.white.bold("LinkedIn:")} ${chalk.gray("https://linkedin.com/in/")}${chalk.cyan("cedxbelin")}`,
		`${chalk.white.bold(" Twitter:")} ${chalk.gray("https://twitter.com/")}${chalk.cyan("cedxbelin")}`,
		"",
		`${chalk.white.bold("    Card:")} ${chalk.yellow("npx")} ${chalk.gray("@cedx/card")}`,
		`${chalk.white.bold("   Email:")} ${chalk.gray("cedric@belin.io")}`,
		`${chalk.white.bold(" Website:")} ${chalk.gray("https://belin.io")}`
	];

	console.log(boxen(buffer.join("\n"), {
		borderColor: "green",
		borderStyle: "round",
		margin: 1,
		padding: 1
	}));
}
