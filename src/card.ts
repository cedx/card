import boxen from "boxen";
import chalk from "chalk";

/**
 * Returns the card content.
 * @param margin The margin size.
 * @returns The card content.
 */
export function getCard(margin = 0): string {
	const buffer = [
		chalk.white.bold("Cédric Belin"),
		`${chalk.white("Project manager & lead developer at")} ${chalk.white.bold("MC2IT")}`,
		"",
		`${chalk.white.bold("  GitHub:")} ${chalk.gray("https://github.com/")}${chalk.cyan("cedx")}`,
		`${chalk.white.bold("LinkedIn:")} ${chalk.gray("https://linkedin.com/in/")}${chalk.cyan("cedxbelin")}`,
		`${chalk.white.bold("Mastodon:")} ${chalk.gray("https://mastodon.social/")}${chalk.cyan("@cedx")}`,
		"",
		`${chalk.white.bold("    Card:")} ${chalk.yellow("npx")} ${chalk.white("@cedx/card")}`,
		`${chalk.white.bold("   Email:")} ${chalk.white("cedric@belin.io")}`,
		`${chalk.white.bold(" Website:")} ${chalk.white("https://belin.io")}`
	];

	return boxen(buffer.join("\n"), {
		borderColor: "green",
		borderStyle: "round",
		margin,
		padding: 1
	});
}
