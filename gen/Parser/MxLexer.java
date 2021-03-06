// Generated from C:/Users/18303/IdeaProjects/Mx/src/Parser\Mx.g4 by ANTLR 4.9.1
package Parser;

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
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, INT=14, BOOL=15, STRING=16, If=17, 
		Else=18, Return=19, Void=20, FOR=21, WHILE=22, BREAK=23, CONTINUE=24, 
		NEW=25, CLASS=26, THIS=27, NULL=28, Less=29, LessEqual=30, Greater=31, 
		GreaterEqual=32, LeftShift=33, RightShift=34, Plus=35, Minus=36, MUL=37, 
		DIV=38, MOD=39, SELFPLUS=40, SELFSUB=41, Question=42, Colon=43, Semi=44, 
		Comma=45, Assign=46, Equal=47, NotEqual=48, Dot=49, Lambda1=50, Lambda2=51, 
		Logicconst=52, DecimalInteger=53, STRINGCONST=54, Identifier=55, Whitespace=56, 
		Newline=57, BlockComment=58, LineComment=59;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "T__8", 
			"T__9", "T__10", "T__11", "T__12", "INT", "BOOL", "STRING", "If", "Else", 
			"Return", "Void", "FOR", "WHILE", "BREAK", "CONTINUE", "NEW", "CLASS", 
			"THIS", "NULL", "Less", "LessEqual", "Greater", "GreaterEqual", "LeftShift", 
			"RightShift", "Plus", "Minus", "MUL", "DIV", "MOD", "SELFPLUS", "SELFSUB", 
			"Question", "Colon", "Semi", "Comma", "Assign", "Equal", "NotEqual", 
			"Dot", "Lambda1", "Lambda2", "Logicconst", "DecimalInteger", "STRINGCONST", 
			"ESC", "Identifier", "Whitespace", "Newline", "BlockComment", "LineComment"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'{'", "'}'", "'('", "')'", "'['", "']'", "'!'", "'~'", "'&&'", 
			"'||'", "'&'", "'|'", "'^'", "'int'", "'bool'", "'string'", "'if'", "'else'", 
			"'return'", "'void'", "'for'", "'while'", "'break'", "'continue'", "'new'", 
			"'class'", "'this'", "'null'", "'<'", "'<='", "'>'", "'>='", "'<<'", 
			"'>>'", "'+'", "'-'", "'*'", "'/'", "'%'", "'++'", "'--'", "'?'", "':'", 
			"';'", "','", "'='", "'=='", "'!='", "'.'", "'[&]'", "'->'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, "INT", "BOOL", "STRING", "If", "Else", "Return", "Void", 
			"FOR", "WHILE", "BREAK", "CONTINUE", "NEW", "CLASS", "THIS", "NULL", 
			"Less", "LessEqual", "Greater", "GreaterEqual", "LeftShift", "RightShift", 
			"Plus", "Minus", "MUL", "DIV", "MOD", "SELFPLUS", "SELFSUB", "Question", 
			"Colon", "Semi", "Comma", "Assign", "Equal", "NotEqual", "Dot", "Lambda1", 
			"Lambda2", "Logicconst", "DecimalInteger", "STRINGCONST", "Identifier", 
			"Whitespace", "Newline", "BlockComment", "LineComment"
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2=\u0178\b\1\4\2\t"+
		"\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"+
		"\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t+\4"+
		",\t,\4-\t-\4.\t.\4/\t/\4\60\t\60\4\61\t\61\4\62\t\62\4\63\t\63\4\64\t"+
		"\64\4\65\t\65\4\66\t\66\4\67\t\67\48\t8\49\t9\4:\t:\4;\t;\4<\t<\4=\t="+
		"\3\2\3\2\3\3\3\3\3\4\3\4\3\5\3\5\3\6\3\6\3\7\3\7\3\b\3\b\3\t\3\t\3\n\3"+
		"\n\3\n\3\13\3\13\3\13\3\f\3\f\3\r\3\r\3\16\3\16\3\17\3\17\3\17\3\17\3"+
		"\20\3\20\3\20\3\20\3\20\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\22\3\22\3"+
		"\22\3\23\3\23\3\23\3\23\3\23\3\24\3\24\3\24\3\24\3\24\3\24\3\24\3\25\3"+
		"\25\3\25\3\25\3\25\3\26\3\26\3\26\3\26\3\27\3\27\3\27\3\27\3\27\3\27\3"+
		"\30\3\30\3\30\3\30\3\30\3\30\3\31\3\31\3\31\3\31\3\31\3\31\3\31\3\31\3"+
		"\31\3\32\3\32\3\32\3\32\3\33\3\33\3\33\3\33\3\33\3\33\3\34\3\34\3\34\3"+
		"\34\3\34\3\35\3\35\3\35\3\35\3\35\3\36\3\36\3\37\3\37\3\37\3 \3 \3!\3"+
		"!\3!\3\"\3\"\3\"\3#\3#\3#\3$\3$\3%\3%\3&\3&\3\'\3\'\3(\3(\3)\3)\3)\3*"+
		"\3*\3*\3+\3+\3,\3,\3-\3-\3.\3.\3/\3/\3\60\3\60\3\60\3\61\3\61\3\61\3\62"+
		"\3\62\3\63\3\63\3\63\3\63\3\64\3\64\3\64\3\65\3\65\3\65\3\65\3\65\3\65"+
		"\3\65\3\65\3\65\5\65\u012b\n\65\3\66\3\66\7\66\u012f\n\66\f\66\16\66\u0132"+
		"\13\66\3\66\5\66\u0135\n\66\3\67\3\67\3\67\7\67\u013a\n\67\f\67\16\67"+
		"\u013d\13\67\3\67\3\67\38\38\38\38\38\38\58\u0147\n8\39\39\79\u014b\n"+
		"9\f9\169\u014e\139\3:\6:\u0151\n:\r:\16:\u0152\3:\3:\3;\3;\5;\u0159\n"+
		";\3;\5;\u015c\n;\3;\3;\3<\3<\3<\3<\7<\u0164\n<\f<\16<\u0167\13<\3<\3<"+
		"\3<\3<\3<\3=\3=\3=\3=\7=\u0172\n=\f=\16=\u0175\13=\3=\3=\4\u013b\u0165"+
		"\2>\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25\f\27\r\31\16\33\17\35"+
		"\20\37\21!\22#\23%\24\'\25)\26+\27-\30/\31\61\32\63\33\65\34\67\359\36"+
		";\37= ?!A\"C#E$G%I&K\'M(O)Q*S+U,W-Y.[/]\60_\61a\62c\63e\64g\65i\66k\67"+
		"m8o\2q9s:u;w<y=\3\2\b\3\2\63;\3\2\62;\4\2C\\c|\6\2\62;C\\aac|\4\2\13\13"+
		"\"\"\4\2\f\f\17\17\2\u0183\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2"+
		"\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2"+
		"\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3"+
		"\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3\2\2\2\2+\3\2"+
		"\2\2\2-\3\2\2\2\2/\3\2\2\2\2\61\3\2\2\2\2\63\3\2\2\2\2\65\3\2\2\2\2\67"+
		"\3\2\2\2\29\3\2\2\2\2;\3\2\2\2\2=\3\2\2\2\2?\3\2\2\2\2A\3\2\2\2\2C\3\2"+
		"\2\2\2E\3\2\2\2\2G\3\2\2\2\2I\3\2\2\2\2K\3\2\2\2\2M\3\2\2\2\2O\3\2\2\2"+
		"\2Q\3\2\2\2\2S\3\2\2\2\2U\3\2\2\2\2W\3\2\2\2\2Y\3\2\2\2\2[\3\2\2\2\2]"+
		"\3\2\2\2\2_\3\2\2\2\2a\3\2\2\2\2c\3\2\2\2\2e\3\2\2\2\2g\3\2\2\2\2i\3\2"+
		"\2\2\2k\3\2\2\2\2m\3\2\2\2\2q\3\2\2\2\2s\3\2\2\2\2u\3\2\2\2\2w\3\2\2\2"+
		"\2y\3\2\2\2\3{\3\2\2\2\5}\3\2\2\2\7\177\3\2\2\2\t\u0081\3\2\2\2\13\u0083"+
		"\3\2\2\2\r\u0085\3\2\2\2\17\u0087\3\2\2\2\21\u0089\3\2\2\2\23\u008b\3"+
		"\2\2\2\25\u008e\3\2\2\2\27\u0091\3\2\2\2\31\u0093\3\2\2\2\33\u0095\3\2"+
		"\2\2\35\u0097\3\2\2\2\37\u009b\3\2\2\2!\u00a0\3\2\2\2#\u00a7\3\2\2\2%"+
		"\u00aa\3\2\2\2\'\u00af\3\2\2\2)\u00b6\3\2\2\2+\u00bb\3\2\2\2-\u00bf\3"+
		"\2\2\2/\u00c5\3\2\2\2\61\u00cb\3\2\2\2\63\u00d4\3\2\2\2\65\u00d8\3\2\2"+
		"\2\67\u00de\3\2\2\29\u00e3\3\2\2\2;\u00e8\3\2\2\2=\u00ea\3\2\2\2?\u00ed"+
		"\3\2\2\2A\u00ef\3\2\2\2C\u00f2\3\2\2\2E\u00f5\3\2\2\2G\u00f8\3\2\2\2I"+
		"\u00fa\3\2\2\2K\u00fc\3\2\2\2M\u00fe\3\2\2\2O\u0100\3\2\2\2Q\u0102\3\2"+
		"\2\2S\u0105\3\2\2\2U\u0108\3\2\2\2W\u010a\3\2\2\2Y\u010c\3\2\2\2[\u010e"+
		"\3\2\2\2]\u0110\3\2\2\2_\u0112\3\2\2\2a\u0115\3\2\2\2c\u0118\3\2\2\2e"+
		"\u011a\3\2\2\2g\u011e\3\2\2\2i\u012a\3\2\2\2k\u0134\3\2\2\2m\u0136\3\2"+
		"\2\2o\u0146\3\2\2\2q\u0148\3\2\2\2s\u0150\3\2\2\2u\u015b\3\2\2\2w\u015f"+
		"\3\2\2\2y\u016d\3\2\2\2{|\7}\2\2|\4\3\2\2\2}~\7\177\2\2~\6\3\2\2\2\177"+
		"\u0080\7*\2\2\u0080\b\3\2\2\2\u0081\u0082\7+\2\2\u0082\n\3\2\2\2\u0083"+
		"\u0084\7]\2\2\u0084\f\3\2\2\2\u0085\u0086\7_\2\2\u0086\16\3\2\2\2\u0087"+
		"\u0088\7#\2\2\u0088\20\3\2\2\2\u0089\u008a\7\u0080\2\2\u008a\22\3\2\2"+
		"\2\u008b\u008c\7(\2\2\u008c\u008d\7(\2\2\u008d\24\3\2\2\2\u008e\u008f"+
		"\7~\2\2\u008f\u0090\7~\2\2\u0090\26\3\2\2\2\u0091\u0092\7(\2\2\u0092\30"+
		"\3\2\2\2\u0093\u0094\7~\2\2\u0094\32\3\2\2\2\u0095\u0096\7`\2\2\u0096"+
		"\34\3\2\2\2\u0097\u0098\7k\2\2\u0098\u0099\7p\2\2\u0099\u009a\7v\2\2\u009a"+
		"\36\3\2\2\2\u009b\u009c\7d\2\2\u009c\u009d\7q\2\2\u009d\u009e\7q\2\2\u009e"+
		"\u009f\7n\2\2\u009f \3\2\2\2\u00a0\u00a1\7u\2\2\u00a1\u00a2\7v\2\2\u00a2"+
		"\u00a3\7t\2\2\u00a3\u00a4\7k\2\2\u00a4\u00a5\7p\2\2\u00a5\u00a6\7i\2\2"+
		"\u00a6\"\3\2\2\2\u00a7\u00a8\7k\2\2\u00a8\u00a9\7h\2\2\u00a9$\3\2\2\2"+
		"\u00aa\u00ab\7g\2\2\u00ab\u00ac\7n\2\2\u00ac\u00ad\7u\2\2\u00ad\u00ae"+
		"\7g\2\2\u00ae&\3\2\2\2\u00af\u00b0\7t\2\2\u00b0\u00b1\7g\2\2\u00b1\u00b2"+
		"\7v\2\2\u00b2\u00b3\7w\2\2\u00b3\u00b4\7t\2\2\u00b4\u00b5\7p\2\2\u00b5"+
		"(\3\2\2\2\u00b6\u00b7\7x\2\2\u00b7\u00b8\7q\2\2\u00b8\u00b9\7k\2\2\u00b9"+
		"\u00ba\7f\2\2\u00ba*\3\2\2\2\u00bb\u00bc\7h\2\2\u00bc\u00bd\7q\2\2\u00bd"+
		"\u00be\7t\2\2\u00be,\3\2\2\2\u00bf\u00c0\7y\2\2\u00c0\u00c1\7j\2\2\u00c1"+
		"\u00c2\7k\2\2\u00c2\u00c3\7n\2\2\u00c3\u00c4\7g\2\2\u00c4.\3\2\2\2\u00c5"+
		"\u00c6\7d\2\2\u00c6\u00c7\7t\2\2\u00c7\u00c8\7g\2\2\u00c8\u00c9\7c\2\2"+
		"\u00c9\u00ca\7m\2\2\u00ca\60\3\2\2\2\u00cb\u00cc\7e\2\2\u00cc\u00cd\7"+
		"q\2\2\u00cd\u00ce\7p\2\2\u00ce\u00cf\7v\2\2\u00cf\u00d0\7k\2\2\u00d0\u00d1"+
		"\7p\2\2\u00d1\u00d2\7w\2\2\u00d2\u00d3\7g\2\2\u00d3\62\3\2\2\2\u00d4\u00d5"+
		"\7p\2\2\u00d5\u00d6\7g\2\2\u00d6\u00d7\7y\2\2\u00d7\64\3\2\2\2\u00d8\u00d9"+
		"\7e\2\2\u00d9\u00da\7n\2\2\u00da\u00db\7c\2\2\u00db\u00dc\7u\2\2\u00dc"+
		"\u00dd\7u\2\2\u00dd\66\3\2\2\2\u00de\u00df\7v\2\2\u00df\u00e0\7j\2\2\u00e0"+
		"\u00e1\7k\2\2\u00e1\u00e2\7u\2\2\u00e28\3\2\2\2\u00e3\u00e4\7p\2\2\u00e4"+
		"\u00e5\7w\2\2\u00e5\u00e6\7n\2\2\u00e6\u00e7\7n\2\2\u00e7:\3\2\2\2\u00e8"+
		"\u00e9\7>\2\2\u00e9<\3\2\2\2\u00ea\u00eb\7>\2\2\u00eb\u00ec\7?\2\2\u00ec"+
		">\3\2\2\2\u00ed\u00ee\7@\2\2\u00ee@\3\2\2\2\u00ef\u00f0\7@\2\2\u00f0\u00f1"+
		"\7?\2\2\u00f1B\3\2\2\2\u00f2\u00f3\7>\2\2\u00f3\u00f4\7>\2\2\u00f4D\3"+
		"\2\2\2\u00f5\u00f6\7@\2\2\u00f6\u00f7\7@\2\2\u00f7F\3\2\2\2\u00f8\u00f9"+
		"\7-\2\2\u00f9H\3\2\2\2\u00fa\u00fb\7/\2\2\u00fbJ\3\2\2\2\u00fc\u00fd\7"+
		",\2\2\u00fdL\3\2\2\2\u00fe\u00ff\7\61\2\2\u00ffN\3\2\2\2\u0100\u0101\7"+
		"\'\2\2\u0101P\3\2\2\2\u0102\u0103\7-\2\2\u0103\u0104\7-\2\2\u0104R\3\2"+
		"\2\2\u0105\u0106\7/\2\2\u0106\u0107\7/\2\2\u0107T\3\2\2\2\u0108\u0109"+
		"\7A\2\2\u0109V\3\2\2\2\u010a\u010b\7<\2\2\u010bX\3\2\2\2\u010c\u010d\7"+
		"=\2\2\u010dZ\3\2\2\2\u010e\u010f\7.\2\2\u010f\\\3\2\2\2\u0110\u0111\7"+
		"?\2\2\u0111^\3\2\2\2\u0112\u0113\7?\2\2\u0113\u0114\7?\2\2\u0114`\3\2"+
		"\2\2\u0115\u0116\7#\2\2\u0116\u0117\7?\2\2\u0117b\3\2\2\2\u0118\u0119"+
		"\7\60\2\2\u0119d\3\2\2\2\u011a\u011b\7]\2\2\u011b\u011c\7(\2\2\u011c\u011d"+
		"\7_\2\2\u011df\3\2\2\2\u011e\u011f\7/\2\2\u011f\u0120\7@\2\2\u0120h\3"+
		"\2\2\2\u0121\u0122\7v\2\2\u0122\u0123\7t\2\2\u0123\u0124\7w\2\2\u0124"+
		"\u012b\7g\2\2\u0125\u0126\7h\2\2\u0126\u0127\7c\2\2\u0127\u0128\7n\2\2"+
		"\u0128\u0129\7u\2\2\u0129\u012b\7g\2\2\u012a\u0121\3\2\2\2\u012a\u0125"+
		"\3\2\2\2\u012bj\3\2\2\2\u012c\u0130\t\2\2\2\u012d\u012f\t\3\2\2\u012e"+
		"\u012d\3\2\2\2\u012f\u0132\3\2\2\2\u0130\u012e\3\2\2\2\u0130\u0131\3\2"+
		"\2\2\u0131\u0135\3\2\2\2\u0132\u0130\3\2\2\2\u0133\u0135\7\62\2\2\u0134"+
		"\u012c\3\2\2\2\u0134\u0133\3\2\2\2\u0135l\3\2\2\2\u0136\u013b\7$\2\2\u0137"+
		"\u013a\5o8\2\u0138\u013a\13\2\2\2\u0139\u0137\3\2\2\2\u0139\u0138\3\2"+
		"\2\2\u013a\u013d\3\2\2\2\u013b\u013c\3\2\2\2\u013b\u0139\3\2\2\2\u013c"+
		"\u013e\3\2\2\2\u013d\u013b\3\2\2\2\u013e\u013f\7$\2\2\u013fn\3\2\2\2\u0140"+
		"\u0141\7^\2\2\u0141\u0147\7$\2\2\u0142\u0143\7^\2\2\u0143\u0147\7^\2\2"+
		"\u0144\u0145\7^\2\2\u0145\u0147\7p\2\2\u0146\u0140\3\2\2\2\u0146\u0142"+
		"\3\2\2\2\u0146\u0144\3\2\2\2\u0147p\3\2\2\2\u0148\u014c\t\4\2\2\u0149"+
		"\u014b\t\5\2\2\u014a\u0149\3\2\2\2\u014b\u014e\3\2\2\2\u014c\u014a\3\2"+
		"\2\2\u014c\u014d\3\2\2\2\u014dr\3\2\2\2\u014e\u014c\3\2\2\2\u014f\u0151"+
		"\t\6\2\2\u0150\u014f\3\2\2\2\u0151\u0152\3\2\2\2\u0152\u0150\3\2\2\2\u0152"+
		"\u0153\3\2\2\2\u0153\u0154\3\2\2\2\u0154\u0155\b:\2\2\u0155t\3\2\2\2\u0156"+
		"\u0158\7\17\2\2\u0157\u0159\7\f\2\2\u0158\u0157\3\2\2\2\u0158\u0159\3"+
		"\2\2\2\u0159\u015c\3\2\2\2\u015a\u015c\7\f\2\2\u015b\u0156\3\2\2\2\u015b"+
		"\u015a\3\2\2\2\u015c\u015d\3\2\2\2\u015d\u015e\b;\2\2\u015ev\3\2\2\2\u015f"+
		"\u0160\7\61\2\2\u0160\u0161\7,\2\2\u0161\u0165\3\2\2\2\u0162\u0164\13"+
		"\2\2\2\u0163\u0162\3\2\2\2\u0164\u0167\3\2\2\2\u0165\u0166\3\2\2\2\u0165"+
		"\u0163\3\2\2\2\u0166\u0168\3\2\2\2\u0167\u0165\3\2\2\2\u0168\u0169\7,"+
		"\2\2\u0169\u016a\7\61\2\2\u016a\u016b\3\2\2\2\u016b\u016c\b<\2\2\u016c"+
		"x\3\2\2\2\u016d\u016e\7\61\2\2\u016e\u016f\7\61\2\2\u016f\u0173\3\2\2"+
		"\2\u0170\u0172\n\7\2\2\u0171\u0170\3\2\2\2\u0172\u0175\3\2\2\2\u0173\u0171"+
		"\3\2\2\2\u0173\u0174\3\2\2\2\u0174\u0176\3\2\2\2\u0175\u0173\3\2\2\2\u0176"+
		"\u0177\b=\2\2\u0177z\3\2\2\2\17\2\u012a\u0130\u0134\u0139\u013b\u0146"+
		"\u014c\u0152\u0158\u015b\u0165\u0173\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}