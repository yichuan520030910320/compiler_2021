// Generated from C:/Users/18303/IdeaProjects/Mx/src/Parser\Mx.g4 by ANTLR 4.9.1
package Parser;



import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class MxLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.9.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		INT=1, BOOL=2, STRING=3, If=4, Else=5, Return=6, Void=7, FOR=8, WHILE=9, 
		BREAK=10, CONTINUE=11, NEW=12, CLASS=13, THIS=14, NULL=15, TRUE=16, FALSE=17, 
		LeftParen=18, RightParen=19, LeftBracket=20, RightBracket=21, LeftBrace=22, 
		RightBrace=23, Less=24, LessEqual=25, Greater=26, GreaterEqual=27, LeftShift=28, 
		RightShift=29, Plus=30, Minus=31, MUL=32, DIV=33, MOD=34, SELFPLUS=35, 
		SELFSUB=36, And=37, Or=38, AndAnd=39, OrOr=40, Xor=41, Not=42, Tilde=43, 
		Question=44, Colon=45, Semi=46, Comma=47, Assign=48, Equal=49, NotEqual=50, 
		Dot=51, LOGIC_CONST=52, Identifier=53, DecimalInteger=54, STRINGCONST=55, 
		Whitespace=56, Newline=57, BlockComment=58, LineComment=59;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"INT", "BOOL", "STRING", "If", "Else", "Return", "Void", "FOR", "WHILE", 
			"BREAK", "CONTINUE", "NEW", "CLASS", "THIS", "NULL", "TRUE", "FALSE", 
			"LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", 
			"RightBrace", "Less", "LessEqual", "Greater", "GreaterEqual", "LeftShift", 
			"RightShift", "Plus", "Minus", "MUL", "DIV", "MOD", "SELFPLUS", "SELFSUB", 
			"And", "Or", "AndAnd", "OrOr", "Xor", "Not", "Tilde", "Question", "Colon", 
			"Semi", "Comma", "Assign", "Equal", "NotEqual", "Dot", "LOGIC_CONST", 
			"Identifier", "DecimalInteger", "STRINGCONST", "ESC", "Whitespace", "Newline", 
			"BlockComment", "LineComment"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'int'", "'bool'", "'string'", "'if'", "'else'", "'return'", "'void'", 
			"'for'", "'while'", "'break'", "'continue'", "'new'", "'class'", "'this'", 
			"'null'", "'true'", "'false'", "'('", "')'", "'['", "']'", "'{'", "'}'", 
			"'<'", "'<='", "'>'", "'>='", "'<<'", "'>>'", "'+'", "'-'", "'*'", "'/'", 
			"'%'", "'++'", "'--'", "'&'", "'|'", "'&&'", "'||'", "'^'", "'!'", "'~'", 
			"'?'", "':'", "';'", "','", "'='", "'=='", "'!='", "'.'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "INT", "BOOL", "STRING", "If", "Else", "Return", "Void", "FOR", 
			"WHILE", "BREAK", "CONTINUE", "NEW", "CLASS", "THIS", "NULL", "TRUE", 
			"FALSE", "LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", 
			"RightBrace", "Less", "LessEqual", "Greater", "GreaterEqual", "LeftShift", 
			"RightShift", "Plus", "Minus", "MUL", "DIV", "MOD", "SELFPLUS", "SELFSUB", 
			"And", "Or", "AndAnd", "OrOr", "Xor", "Not", "Tilde", "Question", "Colon", 
			"Semi", "Comma", "Assign", "Equal", "NotEqual", "Dot", "LOGIC_CONST", 
			"Identifier", "DecimalInteger", "STRINGCONST", "Whitespace", "Newline", 
			"BlockComment", "LineComment"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}


	public MxLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "Mx.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2=\u0175\b\1\4\2\t"+
		"\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"+
		"\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t+\4"+
		",\t,\4-\t-\4.\t.\4/\t/\4\60\t\60\4\61\t\61\4\62\t\62\4\63\t\63\4\64\t"+
		"\64\4\65\t\65\4\66\t\66\4\67\t\67\48\t8\49\t9\4:\t:\4;\t;\4<\t<\4=\t="+
		"\3\2\3\2\3\2\3\2\3\3\3\3\3\3\3\3\3\3\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\5\3"+
		"\5\3\5\3\6\3\6\3\6\3\6\3\6\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\b\3\b\3\b\3\b"+
		"\3\b\3\t\3\t\3\t\3\t\3\n\3\n\3\n\3\n\3\n\3\n\3\13\3\13\3\13\3\13\3\13"+
		"\3\13\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\r\3\r\3\r\3\r\3\16\3\16\3"+
		"\16\3\16\3\16\3\16\3\17\3\17\3\17\3\17\3\17\3\20\3\20\3\20\3\20\3\20\3"+
		"\21\3\21\3\21\3\21\3\21\3\22\3\22\3\22\3\22\3\22\3\22\3\23\3\23\3\24\3"+
		"\24\3\25\3\25\3\26\3\26\3\27\3\27\3\30\3\30\3\31\3\31\3\32\3\32\3\32\3"+
		"\33\3\33\3\34\3\34\3\34\3\35\3\35\3\35\3\36\3\36\3\36\3\37\3\37\3 \3 "+
		"\3!\3!\3\"\3\"\3#\3#\3$\3$\3$\3%\3%\3%\3&\3&\3\'\3\'\3(\3(\3(\3)\3)\3"+
		")\3*\3*\3+\3+\3,\3,\3-\3-\3.\3.\3/\3/\3\60\3\60\3\61\3\61\3\62\3\62\3"+
		"\62\3\63\3\63\3\63\3\64\3\64\3\65\3\65\5\65\u0128\n\65\3\66\3\66\7\66"+
		"\u012c\n\66\f\66\16\66\u012f\13\66\3\67\3\67\7\67\u0133\n\67\f\67\16\67"+
		"\u0136\13\67\3\67\5\67\u0139\n\67\38\38\38\78\u013e\n8\f8\168\u0141\13"+
		"8\38\38\39\39\39\39\39\39\59\u014b\n9\3:\6:\u014e\n:\r:\16:\u014f\3:\3"+
		":\3;\3;\5;\u0156\n;\3;\5;\u0159\n;\3;\3;\3<\3<\3<\3<\7<\u0161\n<\f<\16"+
		"<\u0164\13<\3<\3<\3<\3<\3<\3=\3=\3=\3=\7=\u016f\n=\f=\16=\u0172\13=\3"+
		"=\3=\4\u013f\u0162\2>\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25\f\27"+
		"\r\31\16\33\17\35\20\37\21!\22#\23%\24\'\25)\26+\27-\30/\31\61\32\63\33"+
		"\65\34\67\359\36;\37= ?!A\"C#E$G%I&K\'M(O)Q*S+U,W-Y.[/]\60_\61a\62c\63"+
		"e\64g\65i\66k\67m8o9q\2s:u;w<y=\3\2\b\4\2C\\c|\6\2\62;C\\aac|\3\2\63;"+
		"\3\2\62;\4\2\13\13\"\"\4\2\f\f\17\17\2\u0180\2\3\3\2\2\2\2\5\3\2\2\2\2"+
		"\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2"+
		"\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2"+
		"\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2"+
		"\2\2)\3\2\2\2\2+\3\2\2\2\2-\3\2\2\2\2/\3\2\2\2\2\61\3\2\2\2\2\63\3\2\2"+
		"\2\2\65\3\2\2\2\2\67\3\2\2\2\29\3\2\2\2\2;\3\2\2\2\2=\3\2\2\2\2?\3\2\2"+
		"\2\2A\3\2\2\2\2C\3\2\2\2\2E\3\2\2\2\2G\3\2\2\2\2I\3\2\2\2\2K\3\2\2\2\2"+
		"M\3\2\2\2\2O\3\2\2\2\2Q\3\2\2\2\2S\3\2\2\2\2U\3\2\2\2\2W\3\2\2\2\2Y\3"+
		"\2\2\2\2[\3\2\2\2\2]\3\2\2\2\2_\3\2\2\2\2a\3\2\2\2\2c\3\2\2\2\2e\3\2\2"+
		"\2\2g\3\2\2\2\2i\3\2\2\2\2k\3\2\2\2\2m\3\2\2\2\2o\3\2\2\2\2s\3\2\2\2\2"+
		"u\3\2\2\2\2w\3\2\2\2\2y\3\2\2\2\3{\3\2\2\2\5\177\3\2\2\2\7\u0084\3\2\2"+
		"\2\t\u008b\3\2\2\2\13\u008e\3\2\2\2\r\u0093\3\2\2\2\17\u009a\3\2\2\2\21"+
		"\u009f\3\2\2\2\23\u00a3\3\2\2\2\25\u00a9\3\2\2\2\27\u00af\3\2\2\2\31\u00b8"+
		"\3\2\2\2\33\u00bc\3\2\2\2\35\u00c2\3\2\2\2\37\u00c7\3\2\2\2!\u00cc\3\2"+
		"\2\2#\u00d1\3\2\2\2%\u00d7\3\2\2\2\'\u00d9\3\2\2\2)\u00db\3\2\2\2+\u00dd"+
		"\3\2\2\2-\u00df\3\2\2\2/\u00e1\3\2\2\2\61\u00e3\3\2\2\2\63\u00e5\3\2\2"+
		"\2\65\u00e8\3\2\2\2\67\u00ea\3\2\2\29\u00ed\3\2\2\2;\u00f0\3\2\2\2=\u00f3"+
		"\3\2\2\2?\u00f5\3\2\2\2A\u00f7\3\2\2\2C\u00f9\3\2\2\2E\u00fb\3\2\2\2G"+
		"\u00fd\3\2\2\2I\u0100\3\2\2\2K\u0103\3\2\2\2M\u0105\3\2\2\2O\u0107\3\2"+
		"\2\2Q\u010a\3\2\2\2S\u010d\3\2\2\2U\u010f\3\2\2\2W\u0111\3\2\2\2Y\u0113"+
		"\3\2\2\2[\u0115\3\2\2\2]\u0117\3\2\2\2_\u0119\3\2\2\2a\u011b\3\2\2\2c"+
		"\u011d\3\2\2\2e\u0120\3\2\2\2g\u0123\3\2\2\2i\u0127\3\2\2\2k\u0129\3\2"+
		"\2\2m\u0138\3\2\2\2o\u013a\3\2\2\2q\u014a\3\2\2\2s\u014d\3\2\2\2u\u0158"+
		"\3\2\2\2w\u015c\3\2\2\2y\u016a\3\2\2\2{|\7k\2\2|}\7p\2\2}~\7v\2\2~\4\3"+
		"\2\2\2\177\u0080\7d\2\2\u0080\u0081\7q\2\2\u0081\u0082\7q\2\2\u0082\u0083"+
		"\7n\2\2\u0083\6\3\2\2\2\u0084\u0085\7u\2\2\u0085\u0086\7v\2\2\u0086\u0087"+
		"\7t\2\2\u0087\u0088\7k\2\2\u0088\u0089\7p\2\2\u0089\u008a\7i\2\2\u008a"+
		"\b\3\2\2\2\u008b\u008c\7k\2\2\u008c\u008d\7h\2\2\u008d\n\3\2\2\2\u008e"+
		"\u008f\7g\2\2\u008f\u0090\7n\2\2\u0090\u0091\7u\2\2\u0091\u0092\7g\2\2"+
		"\u0092\f\3\2\2\2\u0093\u0094\7t\2\2\u0094\u0095\7g\2\2\u0095\u0096\7v"+
		"\2\2\u0096\u0097\7w\2\2\u0097\u0098\7t\2\2\u0098\u0099\7p\2\2\u0099\16"+
		"\3\2\2\2\u009a\u009b\7x\2\2\u009b\u009c\7q\2\2\u009c\u009d\7k\2\2\u009d"+
		"\u009e\7f\2\2\u009e\20\3\2\2\2\u009f\u00a0\7h\2\2\u00a0\u00a1\7q\2\2\u00a1"+
		"\u00a2\7t\2\2\u00a2\22\3\2\2\2\u00a3\u00a4\7y\2\2\u00a4\u00a5\7j\2\2\u00a5"+
		"\u00a6\7k\2\2\u00a6\u00a7\7n\2\2\u00a7\u00a8\7g\2\2\u00a8\24\3\2\2\2\u00a9"+
		"\u00aa\7d\2\2\u00aa\u00ab\7t\2\2\u00ab\u00ac\7g\2\2\u00ac\u00ad\7c\2\2"+
		"\u00ad\u00ae\7m\2\2\u00ae\26\3\2\2\2\u00af\u00b0\7e\2\2\u00b0\u00b1\7"+
		"q\2\2\u00b1\u00b2\7p\2\2\u00b2\u00b3\7v\2\2\u00b3\u00b4\7k\2\2\u00b4\u00b5"+
		"\7p\2\2\u00b5\u00b6\7w\2\2\u00b6\u00b7\7g\2\2\u00b7\30\3\2\2\2\u00b8\u00b9"+
		"\7p\2\2\u00b9\u00ba\7g\2\2\u00ba\u00bb\7y\2\2\u00bb\32\3\2\2\2\u00bc\u00bd"+
		"\7e\2\2\u00bd\u00be\7n\2\2\u00be\u00bf\7c\2\2\u00bf\u00c0\7u\2\2\u00c0"+
		"\u00c1\7u\2\2\u00c1\34\3\2\2\2\u00c2\u00c3\7v\2\2\u00c3\u00c4\7j\2\2\u00c4"+
		"\u00c5\7k\2\2\u00c5\u00c6\7u\2\2\u00c6\36\3\2\2\2\u00c7\u00c8\7p\2\2\u00c8"+
		"\u00c9\7w\2\2\u00c9\u00ca\7n\2\2\u00ca\u00cb\7n\2\2\u00cb \3\2\2\2\u00cc"+
		"\u00cd\7v\2\2\u00cd\u00ce\7t\2\2\u00ce\u00cf\7w\2\2\u00cf\u00d0\7g\2\2"+
		"\u00d0\"\3\2\2\2\u00d1\u00d2\7h\2\2\u00d2\u00d3\7c\2\2\u00d3\u00d4\7n"+
		"\2\2\u00d4\u00d5\7u\2\2\u00d5\u00d6\7g\2\2\u00d6$\3\2\2\2\u00d7\u00d8"+
		"\7*\2\2\u00d8&\3\2\2\2\u00d9\u00da\7+\2\2\u00da(\3\2\2\2\u00db\u00dc\7"+
		"]\2\2\u00dc*\3\2\2\2\u00dd\u00de\7_\2\2\u00de,\3\2\2\2\u00df\u00e0\7}"+
		"\2\2\u00e0.\3\2\2\2\u00e1\u00e2\7\177\2\2\u00e2\60\3\2\2\2\u00e3\u00e4"+
		"\7>\2\2\u00e4\62\3\2\2\2\u00e5\u00e6\7>\2\2\u00e6\u00e7\7?\2\2\u00e7\64"+
		"\3\2\2\2\u00e8\u00e9\7@\2\2\u00e9\66\3\2\2\2\u00ea\u00eb\7@\2\2\u00eb"+
		"\u00ec\7?\2\2\u00ec8\3\2\2\2\u00ed\u00ee\7>\2\2\u00ee\u00ef\7>\2\2\u00ef"+
		":\3\2\2\2\u00f0\u00f1\7@\2\2\u00f1\u00f2\7@\2\2\u00f2<\3\2\2\2\u00f3\u00f4"+
		"\7-\2\2\u00f4>\3\2\2\2\u00f5\u00f6\7/\2\2\u00f6@\3\2\2\2\u00f7\u00f8\7"+
		",\2\2\u00f8B\3\2\2\2\u00f9\u00fa\7\61\2\2\u00faD\3\2\2\2\u00fb\u00fc\7"+
		"\'\2\2\u00fcF\3\2\2\2\u00fd\u00fe\7-\2\2\u00fe\u00ff\7-\2\2\u00ffH\3\2"+
		"\2\2\u0100\u0101\7/\2\2\u0101\u0102\7/\2\2\u0102J\3\2\2\2\u0103\u0104"+
		"\7(\2\2\u0104L\3\2\2\2\u0105\u0106\7~\2\2\u0106N\3\2\2\2\u0107\u0108\7"+
		"(\2\2\u0108\u0109\7(\2\2\u0109P\3\2\2\2\u010a\u010b\7~\2\2\u010b\u010c"+
		"\7~\2\2\u010cR\3\2\2\2\u010d\u010e\7`\2\2\u010eT\3\2\2\2\u010f\u0110\7"+
		"#\2\2\u0110V\3\2\2\2\u0111\u0112\7\u0080\2\2\u0112X\3\2\2\2\u0113\u0114"+
		"\7A\2\2\u0114Z\3\2\2\2\u0115\u0116\7<\2\2\u0116\\\3\2\2\2\u0117\u0118"+
		"\7=\2\2\u0118^\3\2\2\2\u0119\u011a\7.\2\2\u011a`\3\2\2\2\u011b\u011c\7"+
		"?\2\2\u011cb\3\2\2\2\u011d\u011e\7?\2\2\u011e\u011f\7?\2\2\u011fd\3\2"+
		"\2\2\u0120\u0121\7#\2\2\u0121\u0122\7?\2\2\u0122f\3\2\2\2\u0123\u0124"+
		"\7\60\2\2\u0124h\3\2\2\2\u0125\u0128\5#\22\2\u0126\u0128\5!\21\2\u0127"+
		"\u0125\3\2\2\2\u0127\u0126\3\2\2\2\u0128j\3\2\2\2\u0129\u012d\t\2\2\2"+
		"\u012a\u012c\t\3\2\2\u012b\u012a\3\2\2\2\u012c\u012f\3\2\2\2\u012d\u012b"+
		"\3\2\2\2\u012d\u012e\3\2\2\2\u012el\3\2\2\2\u012f\u012d\3\2\2\2\u0130"+
		"\u0134\t\4\2\2\u0131\u0133\t\5\2\2\u0132\u0131\3\2\2\2\u0133\u0136\3\2"+
		"\2\2\u0134\u0132\3\2\2\2\u0134\u0135\3\2\2\2\u0135\u0139\3\2\2\2\u0136"+
		"\u0134\3\2\2\2\u0137\u0139\7\62\2\2\u0138\u0130\3\2\2\2\u0138\u0137\3"+
		"\2\2\2\u0139n\3\2\2\2\u013a\u013f\7$\2\2\u013b\u013e\5q9\2\u013c\u013e"+
		"\13\2\2\2\u013d\u013b\3\2\2\2\u013d\u013c\3\2\2\2\u013e\u0141\3\2\2\2"+
		"\u013f\u0140\3\2\2\2\u013f\u013d\3\2\2\2\u0140\u0142\3\2\2\2\u0141\u013f"+
		"\3\2\2\2\u0142\u0143\7$\2\2\u0143p\3\2\2\2\u0144\u0145\7^\2\2\u0145\u014b"+
		"\7$\2\2\u0146\u0147\7^\2\2\u0147\u014b\7^\2\2\u0148\u0149\7^\2\2\u0149"+
		"\u014b\7p\2\2\u014a\u0144\3\2\2\2\u014a\u0146\3\2\2\2\u014a\u0148\3\2"+
		"\2\2\u014br\3\2\2\2\u014c\u014e\t\6\2\2\u014d\u014c\3\2\2\2\u014e\u014f"+
		"\3\2\2\2\u014f\u014d\3\2\2\2\u014f\u0150\3\2\2\2\u0150\u0151\3\2\2\2\u0151"+
		"\u0152\b:\2\2\u0152t\3\2\2\2\u0153\u0155\7\17\2\2\u0154\u0156\7\f\2\2"+
		"\u0155\u0154\3\2\2\2\u0155\u0156\3\2\2\2\u0156\u0159\3\2\2\2\u0157\u0159"+
		"\7\f\2\2\u0158\u0153\3\2\2\2\u0158\u0157\3\2\2\2\u0159\u015a\3\2\2\2\u015a"+
		"\u015b\b;\2\2\u015bv\3\2\2\2\u015c\u015d\7\61\2\2\u015d\u015e\7,\2\2\u015e"+
		"\u0162\3\2\2\2\u015f\u0161\13\2\2\2\u0160\u015f\3\2\2\2\u0161\u0164\3"+
		"\2\2\2\u0162\u0163\3\2\2\2\u0162\u0160\3\2\2\2\u0163\u0165\3\2\2\2\u0164"+
		"\u0162\3\2\2\2\u0165\u0166\7,\2\2\u0166\u0167\7\61\2\2\u0167\u0168\3\2"+
		"\2\2\u0168\u0169\b<\2\2\u0169x\3\2\2\2\u016a\u016b\7\61\2\2\u016b\u016c"+
		"\7\61\2\2\u016c\u0170\3\2\2\2\u016d\u016f\n\7\2\2\u016e\u016d\3\2\2\2"+
		"\u016f\u0172\3\2\2\2\u0170\u016e\3\2\2\2\u0170\u0171\3\2\2\2\u0171\u0173"+
		"\3\2\2\2\u0172\u0170\3\2\2\2\u0173\u0174\b=\2\2\u0174z\3\2\2\2\17\2\u0127"+
		"\u012d\u0134\u0138\u013d\u013f\u014a\u014f\u0155\u0158\u0162\u0170\3\b"+
		"\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}