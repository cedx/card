import {styleText} from "node:util"
import boxen from "boxen"

###*
# Returns the card content.
# @param {number} margin The margin size.
# @returns {string} The card content.
###
export getCard = (margin = 0) ->
	options =
		borderColor: "green"
		borderStyle: "round"
		margin: margin
		padding: 1

	boxen "TODO", options
