import boxen from "boxen";
import chalk from "chalk";

/**
 * Returns the card content.
 * @param {number} [margin] The margin size.
 * @returns {string} The card content.
 */
export function getCard(margin = 0) {
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

	return boxen(buffer.join("\n"), {
		borderColor: "green",
		borderStyle: "round",
		margin,
		padding: 1
	});
}
