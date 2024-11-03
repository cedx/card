import {styleText} from "node:util"
import boxen from "boxen"

###*
# Returns the card content.
# @param {number} margin The margin size.
# @returns {string} The card content.
###
export getCard = (margin = 0) ->
	buffer = [
		styleText "white", styleText("bold", "Cédric Belin")
		"#{styleText "white", "Project manager & lead developer at"} #{styleText "white", styleText("bold", "MC2IT")}"
		""
		"#{styleText "white", styleText("bold", "  GitHub:")} #{styleText "gray", "https://github.com/"}#{styleText "cyan", "cedx"}"
		"#{styleText "white", styleText("bold", "LinkedIn:")} #{styleText "gray", "https://linkedin.com/in/"}#{styleText "cyan", "cedxbelin"}"
		"#{styleText "white", styleText("bold", "Mastodon:")} #{styleText "gray", "https://mastodon.social/"}#{styleText "cyan", "@cedx"}"
		""
		"#{styleText "white", styleText("bold", "    Card:")} #{styleText "yellow", "npx"} #{styleText "white", "@cedx/card"}"
		"#{styleText "white", styleText("bold", "   Email:")} #{styleText "white", "cedric@belin.io"}"
		"#{styleText "white", styleText("bold", " Website:")} #{styleText "white", "https://belin.io"}"
	]

	boxen buffer.join("\n"),
		borderColor: "green"
		borderStyle: "round"
		margin: margin
		padding: 1
