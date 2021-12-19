package card;

#if php
import php.Const;
import php.Global;
#end

using StringTools;
using card.StringBuilder;

/** Print the business card of Cédric Belin, full stack developer. **/
class Program {

	/** The string corresponding to a line break. **/
	public static final newLine = Sys.systemName() == "Windows" ? "\r\n" : "\n";

	/** Output usage information. **/
	public var help = false;

	/** Output the version number. **/
	public var version = false;

	/** Creates a new program. **/
	public function new() {}

	/** Application entry point. **/
	public static function main() {
		#if php Global.error_reporting(Global.error_reporting() & ~Const.E_DEPRECATED); #end
		Cli.process(Sys.args(), new Program()).handle(Cli.exit);
	}

	// Runs this command.
	@:defaultCommand
	public function run(rest: Rest<String>): Promise<Noise> {
		if (help || version) {
			Sys.println(help ? Cli.getDoc(this) : Version.packageVersion);
			return Noise;
		}

		final buffer = new StringBuf()
			.header()
				.line()
					.center("<light_white>Cédric Belin</> <green>/</> <white>cedx</>")
					.center("<white>Project manager & lead developer at</> <light_white>MC2IT</>")
				.line()
					.label("GitHub", "<gray>https://github.com/</><cyan>cedx</>")
					.label("LinkedIn", "<gray>https://linkedin.com/in/</><cyan>cedxbelin</>")
					.label("Twitter", "<gray>https://twitter.com/</><cyan>cedxbelin</>")
				.line()
					.label("Card", getCardLabel().sure())
					.label("E-mail", "<white>cedric@belin.io</>")
					.label("Web", "<white>https://belin.io</>")
				.line()
			.footer();

		Console.formatMode = AsciiTerminal;
		Console.logPrefix = "";
		Console.log('$newLine$buffer');
		return Noise;
	}

	/** Gets the command corresponding to the card invokation. **/
	function getCardLabel() return switch Version.haxeTarget {
		case JavaScript: Success("<yellow>npx</> <white>@cedx/card</>");
		case Neko: Success("<yellow>haxelib</> <white>run cedx</>");
		case PHP: Success("<yellow>composer</> <white>global exec card</>");
		default: Failure(new Error(MethodNotAllowed, "Unsupported compilation target."));
	}
}
