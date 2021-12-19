package card;

using StringTools;

/** TODO **/
abstract class StringBuilder {

	/** The string used to indent each line. **/
	static inline final indent = "   ";

	/** The inner width of a line, in characters. **/
	static inline final width = 50;

	// TODO
	public static function center(buffer: StringBuf, text: String)
		return line(buffer, '${repeat(" ", Math.floor((width - getLength(text)) / 2))}$text');

	/** Appends a footer to the specified string buffer. **/
	public static function footer(buffer: StringBuf)
		return addLine(buffer, '<green>╰${repeat("─")}╯</>');

	/** Appends a header to the specified string buffer. **/
	public static function header(buffer: StringBuf)
		return addLine(buffer, '<green>╭${repeat("─")}╮</>');

	// TODO
	public static function label(buffer: StringBuf, label: String, value: String)
		return line(buffer, '<light_white>$label:</> '.lpad(" ", 10 + indent.length + "<light_white></>".length) + value);

	// Appends a line to the specified string buffer. **/
	public static function line(buffer: StringBuf, text = "")
		return addLine(buffer, '<green>│</>$text${repeat(" ", width - getLength(text))}<green>│</>');

	// TODO
	static function addLine(buffer: StringBuf, text: String) {
		buffer.add('$indent$text${Program.newLine}');
		return buffer;
	}

	// TODO
	static function getLength(text: String) {
		final value = ~/<[^<]*>/g.replace(text, "");
		return #if neko value.contains("é") ? value.length - 1 : #end value.length;
	}

	// TODO
	static function repeat(character: String, length = width)
		return [for (_ in 0...length) character].join("");
}
