import {spawn} from "node:child_process";
import {readFile} from "node:fs/promises";
import del from "del";

// The file patterns providing the list of source files.
const sources = ["*.js", "bin/*.js", "lib/**/*.js"];

/** Builds the project. */
export function build() {
	return exec("npx", ["tsc"]);
}

/** Deletes all generated files and reset any saved state. */
export function clean() {
	return del("var/**/*");
}

/** Builds the documentation. */
export function doc() {
	return exec("npx", ["jsdoc", "--configure", "etc/jsdoc.json"]);
}

/** Fixes the coding standards issues. */
export function fix() {
	return Promise.reject(new Error("TODO eslint"));
	// exec("npx", ["eslint", "--config=etc/eslint.json", "--fix", ...sources])
}

/** Performs the static analysis of source code. */
export function lint() {
	return Promise.reject(new Error("TODO eslint"));
	// exec("npx", ["eslint", "--config=etc/eslint.json", ...sources])
}

/** Publishes the package in the registry. */
export async function publish() {
	await exec("npm", ["publish"]);
	const {version} = JSON.parse(await readFile(new URL("package.json", import.meta.url), "utf8"));
	for (const command of [["tag"], ["push", "origin"]]) await exec("git", [...command, `v${version}`]);
}

/** Watches for file changes. */
export default function watch() {
	return exec("npx", ["tsc", "--watch"]);
}

/**
 * Spawns a new process using the specified command.
 * @param {string} command The command to run.
 * @param {string[]} [args] The command arguments.
 * @return {Promise<void>} Resolves when the command is finally terminated.
 */
function exec(command, args = []) {
	return new Promise((resolve, reject) => spawn(command, args, {shell: true, stdio: "inherit"})
    .on("close", code => code ? reject(new Error(`${command}: ${code}`)) : resolve())
  );
}
