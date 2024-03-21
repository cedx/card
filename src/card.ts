/* eslint-disable @typescript-eslint/no-unsafe-call */
// @ts-expect-error TS2305 Node.js typings are not yet up to date.
import {styleText} from "node:util";
import boxen from "boxen";

/**
 * Returns the card content.
 * @param margin The margin size.
 * @returns The card content.
 */
export function getCard(margin = 0): string {
	const buffer = [
		styleText("white", styleText("bold", "Cédric Belin")),
		`${styleText("white", "Project manager & lead developer at")} ${styleText("white", styleText("bold", "MC2IT"))}`,
		"",
		`${styleText("white bold", styleText("bold", "  GitHub:"))} ${styleText("gray", "https://github.com/")}${styleText("cyan", "cedx")}`,
		`${styleText("white", styleText("bold", "LinkedIn:"))} ${styleText("gray", "https://linkedin.com/in/")}${styleText("cyan", "cedxbelin")}`,
		`${styleText("white", styleText("bold", "Mastodon:"))} ${styleText("gray", "https://mastodon.social/")}${styleText("cyan", "@cedx")}`,
		"",
		`${styleText("white", styleText("bold", "    Card:"))} ${styleText("yellow", "npx")} ${styleText("white", "@cedx/card")}`,
		`${styleText("white", styleText("bold", "   Email:"))} ${styleText("white", "cedric@belin.io")}`,
		`${styleText("white", styleText("bold", " Website:"))} ${styleText("white", "https://belin.io")}`
	];

	return boxen(buffer.join("\n"), {
		borderColor: "green",
		borderStyle: "round",
		margin,
		padding: 1
	});
}
