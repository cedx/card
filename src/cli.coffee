import console from "node:console"
import process from "node:process"
import {parseArgs} from "node:util"
import {getCard} from "./card.js"

# The usage information.
usage = """
Print the business card of Cédric Belin, full stack developer.

Usage:
  npx @cedx/card

Options:
  -h, --help     Display this help.
  -v, --version  Output the version number.
"""

# Start the application.
try
	process.title = "Cédric Belin's Card"
	config =
		options:
			help: {short: "h", type: "boolean", default: false}
			version: {short: "v", type: "boolean", default: false}

	{values} = parseArgs config
	console.log switch
		when values.help then usage
		when values.version then (await import("../package.json", with: {type: "json"})).default.version
		else getCard 1

catch error
	console.error if error instanceof Error then error.message else error
	process.exit 1
