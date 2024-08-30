package belin_card;

#if nodejs import js.Node; #end
import tink.Cli;
using StringTools;
using tink.CoreApi;

/**
	Print the business card of Cédric Belin, full stack developer.

	> npx @cedx/card [flags]
**/
final class Program {

	/** Diplay this help. **/
	public var help = false;

	/** Output the version number. **/
	public var version = false;

	/** Creates a new program. **/
	public function new() {}

	/** Application entry point. **/
	public static function main() {
		#if nodejs Node.process.title = "Cédric Belin's Card"; #end
		Cli.process(Sys.args(), new Program()).handle(Cli.exit);
	}

	// Runs this command.
	@:defaultCommand
	public function run(): Promise<Noise> {
		if (help || version) {
			Sys.println(version ? Platform.packageVersion : Cli.getDoc(this));
			return Noise;
		}

		final builder = new CardBuilder()
			.header()
				.line()
					.line("   <light_white>Cédric Belin</>")
					.line("   <white>Project manager & lead developer at</> <light_white>MC2IT</>")
				.line()
					.label("GitHub", "<gray>https://github.com/</><cyan>cedx</>")
					.label("LinkedIn", "<gray>https://linkedin.com/in/</><cyan>cedxbelin</>")
					.label("Mastodon", "<gray>https://mastodon.social/</><cyan>@cedx</>")
				.line()
					.label("Card", "<yellow>npx</> <white>@cedx/card</>")
					.label("Email", "<white>cedric@belin.io</>")
					.label("Website", "<white>https://belin.io</>")
				.line()
			.footer();

		Console.printlnFormatted('${CardBuilder.newLine}$builder');
		return Noise;
	}
}
