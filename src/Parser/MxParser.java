// Generated from C:/Users/18303/IdeaProjects/Mx/src/Parser\Mx.g4 by ANTLR 4.9.1
package Parser;


import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class MxParser extends Parser {
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
	public static final int
		RULE_program = 0, RULE_programunit = 1, RULE_classdef = 2, RULE_constructdeclar = 3, 
		RULE_fundeclar = 4, RULE_parameterlist = 5, RULE_vardeclarstat = 6, RULE_vardeclarlist = 7, 
		RULE_vardeclar = 8, RULE_suite = 9, RULE_statement = 10, RULE_expression = 11, 
		RULE_expressionlist = 12, RULE_newtype = 13, RULE_basictype = 14, RULE_nonarray = 15, 
		RULE_type = 16, RULE_allconst = 17;
	private static String[] makeRuleNames() {
		return new String[] {
			"program", "programunit", "classdef", "constructdeclar", "fundeclar", 
			"parameterlist", "vardeclarstat", "vardeclarlist", "vardeclar", "suite", 
			"statement", "expression", "expressionlist", "newtype", "basictype", 
			"nonarray", "type", "allconst"
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

	@Override
	public String getGrammarFileName() { return "Mx.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public MxParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class ProgramContext extends ParserRuleContext {
		public List<ProgramunitContext> programunit() {
			return getRuleContexts(ProgramunitContext.class);
		}
		public ProgramunitContext programunit(int i) {
			return getRuleContext(ProgramunitContext.class,i);
		}
		public ProgramContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_program; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterProgram(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitProgram(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitProgram(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ProgramContext program() throws RecognitionException {
		ProgramContext _localctx = new ProgramContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_program);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(39);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << INT) | (1L << BOOL) | (1L << STRING) | (1L << Void) | (1L << CLASS) | (1L << Semi) | (1L << Identifier))) != 0)) {
				{
				{
				setState(36);
				programunit();
				}
				}
				setState(41);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ProgramunitContext extends ParserRuleContext {
		public ProgramunitContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_programunit; }
	 
		public ProgramunitContext() { }
		public void copyFrom(ProgramunitContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class Programunit_funContext extends ProgramunitContext {
		public FundeclarContext fundeclar() {
			return getRuleContext(FundeclarContext.class,0);
		}
		public Programunit_funContext(ProgramunitContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterProgramunit_fun(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitProgramunit_fun(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitProgramunit_fun(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Programunit_classContext extends ProgramunitContext {
		public ClassdefContext classdef() {
			return getRuleContext(ClassdefContext.class,0);
		}
		public Programunit_classContext(ProgramunitContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterProgramunit_class(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitProgramunit_class(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitProgramunit_class(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Programunit_semiContext extends ProgramunitContext {
		public TerminalNode Semi() { return getToken(MxParser.Semi, 0); }
		public Programunit_semiContext(ProgramunitContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterProgramunit_semi(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitProgramunit_semi(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitProgramunit_semi(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Programunit_vardeclarContext extends ProgramunitContext {
		public VardeclarstatContext vardeclarstat() {
			return getRuleContext(VardeclarstatContext.class,0);
		}
		public Programunit_vardeclarContext(ProgramunitContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterProgramunit_vardeclar(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitProgramunit_vardeclar(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitProgramunit_vardeclar(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ProgramunitContext programunit() throws RecognitionException {
		ProgramunitContext _localctx = new ProgramunitContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_programunit);
		try {
			setState(46);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,1,_ctx) ) {
			case 1:
				_localctx = new Programunit_classContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(42);
				classdef();
				}
				break;
			case 2:
				_localctx = new Programunit_vardeclarContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(43);
				vardeclarstat();
				}
				break;
			case 3:
				_localctx = new Programunit_funContext(_localctx);
				enterOuterAlt(_localctx, 3);
				{
				setState(44);
				fundeclar();
				}
				break;
			case 4:
				_localctx = new Programunit_semiContext(_localctx);
				enterOuterAlt(_localctx, 4);
				{
				setState(45);
				match(Semi);
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ClassdefContext extends ParserRuleContext {
		public Token calssname;
		public TerminalNode CLASS() { return getToken(MxParser.CLASS, 0); }
		public TerminalNode Semi() { return getToken(MxParser.Semi, 0); }
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public List<ConstructdeclarContext> constructdeclar() {
			return getRuleContexts(ConstructdeclarContext.class);
		}
		public ConstructdeclarContext constructdeclar(int i) {
			return getRuleContext(ConstructdeclarContext.class,i);
		}
		public List<FundeclarContext> fundeclar() {
			return getRuleContexts(FundeclarContext.class);
		}
		public FundeclarContext fundeclar(int i) {
			return getRuleContext(FundeclarContext.class,i);
		}
		public List<VardeclarstatContext> vardeclarstat() {
			return getRuleContexts(VardeclarstatContext.class);
		}
		public VardeclarstatContext vardeclarstat(int i) {
			return getRuleContext(VardeclarstatContext.class,i);
		}
		public ClassdefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_classdef; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterClassdef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitClassdef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitClassdef(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ClassdefContext classdef() throws RecognitionException {
		ClassdefContext _localctx = new ClassdefContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_classdef);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(48);
			match(CLASS);
			setState(49);
			((ClassdefContext)_localctx).calssname = match(Identifier);
			setState(50);
			match(T__0);
			setState(56);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << INT) | (1L << BOOL) | (1L << STRING) | (1L << Void) | (1L << Identifier))) != 0)) {
				{
				setState(54);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,2,_ctx) ) {
				case 1:
					{
					setState(51);
					constructdeclar();
					}
					break;
				case 2:
					{
					setState(52);
					fundeclar();
					}
					break;
				case 3:
					{
					setState(53);
					vardeclarstat();
					}
					break;
				}
				}
				setState(58);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(59);
			match(T__1);
			setState(60);
			match(Semi);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ConstructdeclarContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public SuiteContext suite() {
			return getRuleContext(SuiteContext.class,0);
		}
		public ParameterlistContext parameterlist() {
			return getRuleContext(ParameterlistContext.class,0);
		}
		public ConstructdeclarContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_constructdeclar; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterConstructdeclar(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitConstructdeclar(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitConstructdeclar(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ConstructdeclarContext constructdeclar() throws RecognitionException {
		ConstructdeclarContext _localctx = new ConstructdeclarContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_constructdeclar);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(62);
			match(Identifier);
			setState(63);
			match(T__2);
			setState(65);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << INT) | (1L << BOOL) | (1L << STRING) | (1L << Identifier))) != 0)) {
				{
				setState(64);
				parameterlist();
				}
			}

			setState(67);
			match(T__3);
			setState(68);
			suite();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FundeclarContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public SuiteContext suite() {
			return getRuleContext(SuiteContext.class,0);
		}
		public TerminalNode Void() { return getToken(MxParser.Void, 0); }
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public ParameterlistContext parameterlist() {
			return getRuleContext(ParameterlistContext.class,0);
		}
		public FundeclarContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_fundeclar; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterFundeclar(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitFundeclar(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitFundeclar(this);
			else return visitor.visitChildren(this);
		}
	}

	public final FundeclarContext fundeclar() throws RecognitionException {
		FundeclarContext _localctx = new FundeclarContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_fundeclar);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(72);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case Void:
				{
				setState(70);
				match(Void);
				}
				break;
			case INT:
			case BOOL:
			case STRING:
			case Identifier:
				{
				setState(71);
				type(0);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			setState(74);
			match(Identifier);
			setState(75);
			match(T__2);
			setState(77);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << INT) | (1L << BOOL) | (1L << STRING) | (1L << Identifier))) != 0)) {
				{
				setState(76);
				parameterlist();
				}
			}

			setState(79);
			match(T__3);
			setState(80);
			suite();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ParameterlistContext extends ParserRuleContext {
		public List<TypeContext> type() {
			return getRuleContexts(TypeContext.class);
		}
		public TypeContext type(int i) {
			return getRuleContext(TypeContext.class,i);
		}
		public List<TerminalNode> Identifier() { return getTokens(MxParser.Identifier); }
		public TerminalNode Identifier(int i) {
			return getToken(MxParser.Identifier, i);
		}
		public List<TerminalNode> Comma() { return getTokens(MxParser.Comma); }
		public TerminalNode Comma(int i) {
			return getToken(MxParser.Comma, i);
		}
		public ParameterlistContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_parameterlist; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterParameterlist(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitParameterlist(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitParameterlist(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ParameterlistContext parameterlist() throws RecognitionException {
		ParameterlistContext _localctx = new ParameterlistContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_parameterlist);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(82);
			type(0);
			setState(83);
			match(Identifier);
			setState(90);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==Comma) {
				{
				{
				setState(84);
				match(Comma);
				setState(85);
				type(0);
				setState(86);
				match(Identifier);
				}
				}
				setState(92);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VardeclarstatContext extends ParserRuleContext {
		public VardeclarlistContext vardeclarlist() {
			return getRuleContext(VardeclarlistContext.class,0);
		}
		public TerminalNode Semi() { return getToken(MxParser.Semi, 0); }
		public VardeclarstatContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_vardeclarstat; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterVardeclarstat(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitVardeclarstat(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitVardeclarstat(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VardeclarstatContext vardeclarstat() throws RecognitionException {
		VardeclarstatContext _localctx = new VardeclarstatContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_vardeclarstat);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(93);
			vardeclarlist();
			setState(94);
			match(Semi);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VardeclarlistContext extends ParserRuleContext {
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public List<VardeclarContext> vardeclar() {
			return getRuleContexts(VardeclarContext.class);
		}
		public VardeclarContext vardeclar(int i) {
			return getRuleContext(VardeclarContext.class,i);
		}
		public List<TerminalNode> Comma() { return getTokens(MxParser.Comma); }
		public TerminalNode Comma(int i) {
			return getToken(MxParser.Comma, i);
		}
		public VardeclarlistContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_vardeclarlist; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterVardeclarlist(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitVardeclarlist(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitVardeclarlist(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VardeclarlistContext vardeclarlist() throws RecognitionException {
		VardeclarlistContext _localctx = new VardeclarlistContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_vardeclarlist);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(96);
			type(0);
			setState(97);
			vardeclar();
			setState(102);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==Comma) {
				{
				{
				setState(98);
				match(Comma);
				setState(99);
				vardeclar();
				}
				}
				setState(104);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VardeclarContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public TerminalNode Assign() { return getToken(MxParser.Assign, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public VardeclarContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_vardeclar; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterVardeclar(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitVardeclar(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitVardeclar(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VardeclarContext vardeclar() throws RecognitionException {
		VardeclarContext _localctx = new VardeclarContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_vardeclar);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(105);
			match(Identifier);
			setState(108);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==Assign) {
				{
				setState(106);
				match(Assign);
				setState(107);
				expression(0);
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class SuiteContext extends ParserRuleContext {
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public SuiteContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_suite; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterSuite(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitSuite(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitSuite(this);
			else return visitor.visitChildren(this);
		}
	}

	public final SuiteContext suite() throws RecognitionException {
		SuiteContext _localctx = new SuiteContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_suite);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(110);
			match(T__0);
			setState(114);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << T__2) | (1L << T__6) | (1L << T__7) | (1L << INT) | (1L << BOOL) | (1L << STRING) | (1L << If) | (1L << Return) | (1L << FOR) | (1L << WHILE) | (1L << BREAK) | (1L << CONTINUE) | (1L << NEW) | (1L << THIS) | (1L << NULL) | (1L << Plus) | (1L << Minus) | (1L << SELFPLUS) | (1L << SELFSUB) | (1L << Semi) | (1L << Lambda1) | (1L << Logicconst) | (1L << DecimalInteger) | (1L << STRINGCONST) | (1L << Identifier))) != 0)) {
				{
				{
				setState(111);
				statement();
				}
				}
				setState(116);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(117);
			match(T__1);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StatementContext extends ParserRuleContext {
		public StatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_statement; }
	 
		public StatementContext() { }
		public void copyFrom(StatementContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class Stat_suiteContext extends StatementContext {
		public SuiteContext suite() {
			return getRuleContext(SuiteContext.class,0);
		}
		public Stat_suiteContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterStat_suite(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitStat_suite(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitStat_suite(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Stat_forContext extends StatementContext {
		public VardeclarlistContext initvar;
		public ExpressionContext initexpr;
		public ExpressionContext codition;
		public ExpressionContext incr;
		public StatementContext forstat;
		public TerminalNode FOR() { return getToken(MxParser.FOR, 0); }
		public List<TerminalNode> Semi() { return getTokens(MxParser.Semi); }
		public TerminalNode Semi(int i) {
			return getToken(MxParser.Semi, i);
		}
		public StatementContext statement() {
			return getRuleContext(StatementContext.class,0);
		}
		public VardeclarlistContext vardeclarlist() {
			return getRuleContext(VardeclarlistContext.class,0);
		}
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public Stat_forContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterStat_for(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitStat_for(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitStat_for(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Stat_continueContext extends StatementContext {
		public TerminalNode CONTINUE() { return getToken(MxParser.CONTINUE, 0); }
		public TerminalNode Semi() { return getToken(MxParser.Semi, 0); }
		public Stat_continueContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterStat_continue(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitStat_continue(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitStat_continue(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Stat_returnContext extends StatementContext {
		public TerminalNode Return() { return getToken(MxParser.Return, 0); }
		public TerminalNode Semi() { return getToken(MxParser.Semi, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public Stat_returnContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterStat_return(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitStat_return(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitStat_return(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Stat_ifContext extends StatementContext {
		public ExpressionContext codition;
		public StatementContext thenstat;
		public StatementContext elsestat;
		public TerminalNode If() { return getToken(MxParser.If, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public TerminalNode Else() { return getToken(MxParser.Else, 0); }
		public Stat_ifContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterStat_if(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitStat_if(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitStat_if(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Stat_whileContext extends StatementContext {
		public ExpressionContext codition;
		public StatementContext whilestat;
		public TerminalNode WHILE() { return getToken(MxParser.WHILE, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public StatementContext statement() {
			return getRuleContext(StatementContext.class,0);
		}
		public Stat_whileContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterStat_while(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitStat_while(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitStat_while(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Stat_semiContext extends StatementContext {
		public TerminalNode Semi() { return getToken(MxParser.Semi, 0); }
		public Stat_semiContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterStat_semi(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitStat_semi(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitStat_semi(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Stat_vardeclarContext extends StatementContext {
		public VardeclarstatContext vardeclarstat() {
			return getRuleContext(VardeclarstatContext.class,0);
		}
		public Stat_vardeclarContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterStat_vardeclar(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitStat_vardeclar(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitStat_vardeclar(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Stat_breakContext extends StatementContext {
		public TerminalNode BREAK() { return getToken(MxParser.BREAK, 0); }
		public TerminalNode Semi() { return getToken(MxParser.Semi, 0); }
		public Stat_breakContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterStat_break(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitStat_break(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitStat_break(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Stat_exprContext extends StatementContext {
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode Semi() { return getToken(MxParser.Semi, 0); }
		public Stat_exprContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterStat_expr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitStat_expr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitStat_expr(this);
			else return visitor.visitChildren(this);
		}
	}

	public final StatementContext statement() throws RecognitionException {
		StatementContext _localctx = new StatementContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_statement);
		int _la;
		try {
			setState(165);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,16,_ctx) ) {
			case 1:
				_localctx = new Stat_suiteContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(119);
				suite();
				}
				break;
			case 2:
				_localctx = new Stat_vardeclarContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(120);
				vardeclarstat();
				}
				break;
			case 3:
				_localctx = new Stat_breakContext(_localctx);
				enterOuterAlt(_localctx, 3);
				{
				setState(121);
				match(BREAK);
				setState(122);
				match(Semi);
				}
				break;
			case 4:
				_localctx = new Stat_continueContext(_localctx);
				enterOuterAlt(_localctx, 4);
				{
				setState(123);
				match(CONTINUE);
				setState(124);
				match(Semi);
				}
				break;
			case 5:
				_localctx = new Stat_semiContext(_localctx);
				enterOuterAlt(_localctx, 5);
				{
				setState(125);
				match(Semi);
				}
				break;
			case 6:
				_localctx = new Stat_returnContext(_localctx);
				enterOuterAlt(_localctx, 6);
				{
				setState(126);
				match(Return);
				setState(128);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__2) | (1L << T__6) | (1L << T__7) | (1L << NEW) | (1L << THIS) | (1L << NULL) | (1L << Plus) | (1L << Minus) | (1L << SELFPLUS) | (1L << SELFSUB) | (1L << Lambda1) | (1L << Logicconst) | (1L << DecimalInteger) | (1L << STRINGCONST) | (1L << Identifier))) != 0)) {
					{
					setState(127);
					expression(0);
					}
				}

				setState(130);
				match(Semi);
				}
				break;
			case 7:
				_localctx = new Stat_exprContext(_localctx);
				enterOuterAlt(_localctx, 7);
				{
				setState(131);
				expression(0);
				setState(132);
				match(Semi);
				}
				break;
			case 8:
				_localctx = new Stat_ifContext(_localctx);
				enterOuterAlt(_localctx, 8);
				{
				setState(134);
				match(If);
				setState(135);
				match(T__2);
				setState(136);
				((Stat_ifContext)_localctx).codition = expression(0);
				setState(137);
				match(T__3);
				setState(138);
				((Stat_ifContext)_localctx).thenstat = statement();
				setState(141);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,12,_ctx) ) {
				case 1:
					{
					setState(139);
					match(Else);
					setState(140);
					((Stat_ifContext)_localctx).elsestat = statement();
					}
					break;
				}
				}
				break;
			case 9:
				_localctx = new Stat_whileContext(_localctx);
				enterOuterAlt(_localctx, 9);
				{
				setState(143);
				match(WHILE);
				setState(144);
				match(T__2);
				setState(145);
				((Stat_whileContext)_localctx).codition = expression(0);
				setState(146);
				match(T__3);
				setState(147);
				((Stat_whileContext)_localctx).whilestat = statement();
				}
				break;
			case 10:
				_localctx = new Stat_forContext(_localctx);
				enterOuterAlt(_localctx, 10);
				{
				setState(149);
				match(FOR);
				setState(150);
				match(T__2);
				setState(153);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,13,_ctx) ) {
				case 1:
					{
					setState(151);
					((Stat_forContext)_localctx).initvar = vardeclarlist();
					}
					break;
				case 2:
					{
					setState(152);
					((Stat_forContext)_localctx).initexpr = expression(0);
					}
					break;
				}
				setState(155);
				match(Semi);
				setState(157);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__2) | (1L << T__6) | (1L << T__7) | (1L << NEW) | (1L << THIS) | (1L << NULL) | (1L << Plus) | (1L << Minus) | (1L << SELFPLUS) | (1L << SELFSUB) | (1L << Lambda1) | (1L << Logicconst) | (1L << DecimalInteger) | (1L << STRINGCONST) | (1L << Identifier))) != 0)) {
					{
					setState(156);
					((Stat_forContext)_localctx).codition = expression(0);
					}
				}

				setState(159);
				match(Semi);
				setState(161);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__2) | (1L << T__6) | (1L << T__7) | (1L << NEW) | (1L << THIS) | (1L << NULL) | (1L << Plus) | (1L << Minus) | (1L << SELFPLUS) | (1L << SELFSUB) | (1L << Lambda1) | (1L << Logicconst) | (1L << DecimalInteger) | (1L << STRINGCONST) | (1L << Identifier))) != 0)) {
					{
					setState(160);
					((Stat_forContext)_localctx).incr = expression(0);
					}
				}

				setState(163);
				match(T__3);
				setState(164);
				((Stat_forContext)_localctx).forstat = statement();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExpressionContext extends ParserRuleContext {
		public ExpressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expression; }
	 
		public ExpressionContext() { }
		public void copyFrom(ExpressionContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class Expr_newContext extends ExpressionContext {
		public TerminalNode NEW() { return getToken(MxParser.NEW, 0); }
		public NewtypeContext newtype() {
			return getRuleContext(NewtypeContext.class,0);
		}
		public Expr_newContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterExpr_new(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitExpr_new(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitExpr_new(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Expr_constContext extends ExpressionContext {
		public AllconstContext allconst() {
			return getRuleContext(AllconstContext.class,0);
		}
		public Expr_constContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterExpr_const(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitExpr_const(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitExpr_const(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Expr_idetifierContext extends ExpressionContext {
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public Expr_idetifierContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterExpr_idetifier(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitExpr_idetifier(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitExpr_idetifier(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Expr_assignContext extends ExpressionContext {
		public ExpressionContext operand1;
		public ExpressionContext operand2;
		public TerminalNode Assign() { return getToken(MxParser.Assign, 0); }
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public Expr_assignContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterExpr_assign(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitExpr_assign(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitExpr_assign(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Expr_thisContext extends ExpressionContext {
		public TerminalNode THIS() { return getToken(MxParser.THIS, 0); }
		public Expr_thisContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterExpr_this(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitExpr_this(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitExpr_this(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Expr_parenexprContext extends ExpressionContext {
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public Expr_parenexprContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterExpr_parenexpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitExpr_parenexpr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitExpr_parenexpr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Expr_functionContext extends ExpressionContext {
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public ExpressionlistContext expressionlist() {
			return getRuleContext(ExpressionlistContext.class,0);
		}
		public Expr_functionContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterExpr_function(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitExpr_function(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitExpr_function(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Expr_binaryContext extends ExpressionContext {
		public ExpressionContext operand1;
		public Token op;
		public ExpressionContext operand2;
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public TerminalNode MUL() { return getToken(MxParser.MUL, 0); }
		public TerminalNode DIV() { return getToken(MxParser.DIV, 0); }
		public TerminalNode MOD() { return getToken(MxParser.MOD, 0); }
		public TerminalNode Plus() { return getToken(MxParser.Plus, 0); }
		public TerminalNode Minus() { return getToken(MxParser.Minus, 0); }
		public TerminalNode LeftShift() { return getToken(MxParser.LeftShift, 0); }
		public TerminalNode RightShift() { return getToken(MxParser.RightShift, 0); }
		public TerminalNode Equal() { return getToken(MxParser.Equal, 0); }
		public TerminalNode NotEqual() { return getToken(MxParser.NotEqual, 0); }
		public TerminalNode Greater() { return getToken(MxParser.Greater, 0); }
		public TerminalNode GreaterEqual() { return getToken(MxParser.GreaterEqual, 0); }
		public TerminalNode LessEqual() { return getToken(MxParser.LessEqual, 0); }
		public TerminalNode Less() { return getToken(MxParser.Less, 0); }
		public Expr_binaryContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterExpr_binary(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitExpr_binary(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitExpr_binary(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Expr_arrayContext extends ExpressionContext {
		public ExpressionContext array;
		public ExpressionContext index;
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public Expr_arrayContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterExpr_array(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitExpr_array(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitExpr_array(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Expr_lambdaContext extends ExpressionContext {
		public ParameterlistContext lambdapara;
		public ExpressionlistContext lambdaexprelist;
		public TerminalNode Lambda1() { return getToken(MxParser.Lambda1, 0); }
		public TerminalNode Lambda2() { return getToken(MxParser.Lambda2, 0); }
		public SuiteContext suite() {
			return getRuleContext(SuiteContext.class,0);
		}
		public ExpressionlistContext expressionlist() {
			return getRuleContext(ExpressionlistContext.class,0);
		}
		public ParameterlistContext parameterlist() {
			return getRuleContext(ParameterlistContext.class,0);
		}
		public Expr_lambdaContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterExpr_lambda(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitExpr_lambda(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitExpr_lambda(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Expr_singleContext extends ExpressionContext {
		public Token op;
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode Minus() { return getToken(MxParser.Minus, 0); }
		public TerminalNode Plus() { return getToken(MxParser.Plus, 0); }
		public TerminalNode SELFSUB() { return getToken(MxParser.SELFSUB, 0); }
		public TerminalNode SELFPLUS() { return getToken(MxParser.SELFPLUS, 0); }
		public Expr_singleContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterExpr_single(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitExpr_single(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitExpr_single(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Expr_memberContext extends ExpressionContext {
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode Dot() { return getToken(MxParser.Dot, 0); }
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public Expr_memberContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterExpr_member(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitExpr_member(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitExpr_member(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Expr_single_postContext extends ExpressionContext {
		public Token op;
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode SELFPLUS() { return getToken(MxParser.SELFPLUS, 0); }
		public TerminalNode SELFSUB() { return getToken(MxParser.SELFSUB, 0); }
		public Expr_single_postContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterExpr_single_post(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitExpr_single_post(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitExpr_single_post(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ExpressionContext expression() throws RecognitionException {
		return expression(0);
	}

	private ExpressionContext expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		ExpressionContext _localctx = new ExpressionContext(_ctx, _parentState);
		ExpressionContext _prevctx = _localctx;
		int _startState = 22;
		enterRecursionRule(_localctx, 22, RULE_expression, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(199);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__2:
				{
				_localctx = new Expr_parenexprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;

				setState(168);
				match(T__2);
				setState(169);
				expression(0);
				setState(170);
				match(T__3);
				}
				break;
			case NEW:
				{
				_localctx = new Expr_newContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(172);
				match(NEW);
				setState(173);
				newtype();
				}
				break;
			case T__6:
			case T__7:
				{
				_localctx = new Expr_singleContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(174);
				((Expr_singleContext)_localctx).op = _input.LT(1);
				_la = _input.LA(1);
				if ( !(_la==T__6 || _la==T__7) ) {
					((Expr_singleContext)_localctx).op = (Token)_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(175);
				expression(14);
				}
				break;
			case Plus:
			case Minus:
				{
				_localctx = new Expr_singleContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(176);
				((Expr_singleContext)_localctx).op = _input.LT(1);
				_la = _input.LA(1);
				if ( !(_la==Plus || _la==Minus) ) {
					((Expr_singleContext)_localctx).op = (Token)_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(177);
				expression(13);
				}
				break;
			case SELFPLUS:
			case SELFSUB:
				{
				_localctx = new Expr_singleContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(178);
				((Expr_singleContext)_localctx).op = _input.LT(1);
				_la = _input.LA(1);
				if ( !(_la==SELFPLUS || _la==SELFSUB) ) {
					((Expr_singleContext)_localctx).op = (Token)_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(179);
				expression(12);
				}
				break;
			case Lambda1:
				{
				_localctx = new Expr_lambdaContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(180);
				match(Lambda1);
				setState(186);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__2) {
					{
					setState(181);
					match(T__2);
					setState(183);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << INT) | (1L << BOOL) | (1L << STRING) | (1L << Identifier))) != 0)) {
						{
						setState(182);
						((Expr_lambdaContext)_localctx).lambdapara = parameterlist();
						}
					}

					setState(185);
					match(T__3);
					}
				}

				setState(188);
				match(Lambda2);
				setState(189);
				suite();
				setState(190);
				match(T__2);
				setState(192);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__2) | (1L << T__6) | (1L << T__7) | (1L << NEW) | (1L << THIS) | (1L << NULL) | (1L << Plus) | (1L << Minus) | (1L << SELFPLUS) | (1L << SELFSUB) | (1L << Lambda1) | (1L << Logicconst) | (1L << DecimalInteger) | (1L << STRINGCONST) | (1L << Identifier))) != 0)) {
					{
					setState(191);
					((Expr_lambdaContext)_localctx).lambdaexprelist = expressionlist();
					}
				}

				setState(194);
				match(T__3);
				}
				break;
			case THIS:
				{
				_localctx = new Expr_thisContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(196);
				match(THIS);
				}
				break;
			case NULL:
			case Logicconst:
			case DecimalInteger:
			case STRINGCONST:
				{
				_localctx = new Expr_constContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(197);
				allconst();
				}
				break;
			case Identifier:
				{
				_localctx = new Expr_idetifierContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(198);
				match(Identifier);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			_ctx.stop = _input.LT(-1);
			setState(240);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,23,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(238);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,22,_ctx) ) {
					case 1:
						{
						_localctx = new Expr_binaryContext(new ExpressionContext(_parentctx, _parentState));
						((Expr_binaryContext)_localctx).operand1 = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(201);
						if (!(precpred(_ctx, 11))) throw new FailedPredicateException(this, "precpred(_ctx, 11)");
						setState(202);
						((Expr_binaryContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << MUL) | (1L << DIV) | (1L << MOD))) != 0)) ) {
							((Expr_binaryContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(203);
						((Expr_binaryContext)_localctx).operand2 = expression(12);
						}
						break;
					case 2:
						{
						_localctx = new Expr_binaryContext(new ExpressionContext(_parentctx, _parentState));
						((Expr_binaryContext)_localctx).operand1 = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(204);
						if (!(precpred(_ctx, 10))) throw new FailedPredicateException(this, "precpred(_ctx, 10)");
						setState(205);
						((Expr_binaryContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==Plus || _la==Minus) ) {
							((Expr_binaryContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(206);
						((Expr_binaryContext)_localctx).operand2 = expression(11);
						}
						break;
					case 3:
						{
						_localctx = new Expr_binaryContext(new ExpressionContext(_parentctx, _parentState));
						((Expr_binaryContext)_localctx).operand1 = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(207);
						if (!(precpred(_ctx, 9))) throw new FailedPredicateException(this, "precpred(_ctx, 9)");
						setState(208);
						((Expr_binaryContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==LeftShift || _la==RightShift) ) {
							((Expr_binaryContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(209);
						((Expr_binaryContext)_localctx).operand2 = expression(10);
						}
						break;
					case 4:
						{
						_localctx = new Expr_binaryContext(new ExpressionContext(_parentctx, _parentState));
						((Expr_binaryContext)_localctx).operand1 = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(210);
						if (!(precpred(_ctx, 8))) throw new FailedPredicateException(this, "precpred(_ctx, 8)");
						setState(211);
						((Expr_binaryContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Less) | (1L << LessEqual) | (1L << Greater) | (1L << GreaterEqual) | (1L << Equal) | (1L << NotEqual))) != 0)) ) {
							((Expr_binaryContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(212);
						((Expr_binaryContext)_localctx).operand2 = expression(9);
						}
						break;
					case 5:
						{
						_localctx = new Expr_binaryContext(new ExpressionContext(_parentctx, _parentState));
						((Expr_binaryContext)_localctx).operand1 = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(213);
						if (!(precpred(_ctx, 7))) throw new FailedPredicateException(this, "precpred(_ctx, 7)");
						setState(214);
						((Expr_binaryContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__8 || _la==T__9) ) {
							((Expr_binaryContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(215);
						((Expr_binaryContext)_localctx).operand2 = expression(8);
						}
						break;
					case 6:
						{
						_localctx = new Expr_binaryContext(new ExpressionContext(_parentctx, _parentState));
						((Expr_binaryContext)_localctx).operand1 = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(216);
						if (!(precpred(_ctx, 6))) throw new FailedPredicateException(this, "precpred(_ctx, 6)");
						setState(217);
						((Expr_binaryContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__10) | (1L << T__11) | (1L << T__12))) != 0)) ) {
							((Expr_binaryContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(218);
						((Expr_binaryContext)_localctx).operand2 = expression(7);
						}
						break;
					case 7:
						{
						_localctx = new Expr_assignContext(new ExpressionContext(_parentctx, _parentState));
						((Expr_assignContext)_localctx).operand1 = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(219);
						if (!(precpred(_ctx, 3))) throw new FailedPredicateException(this, "precpred(_ctx, 3)");
						setState(220);
						match(Assign);
						setState(221);
						((Expr_assignContext)_localctx).operand2 = expression(3);
						}
						break;
					case 8:
						{
						_localctx = new Expr_single_postContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(222);
						if (!(precpred(_ctx, 19))) throw new FailedPredicateException(this, "precpred(_ctx, 19)");
						setState(223);
						((Expr_single_postContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==SELFPLUS || _la==SELFSUB) ) {
							((Expr_single_postContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						}
						break;
					case 9:
						{
						_localctx = new Expr_memberContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(224);
						if (!(precpred(_ctx, 17))) throw new FailedPredicateException(this, "precpred(_ctx, 17)");
						setState(225);
						match(Dot);
						setState(226);
						match(Identifier);
						}
						break;
					case 10:
						{
						_localctx = new Expr_functionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(227);
						if (!(precpred(_ctx, 16))) throw new FailedPredicateException(this, "precpred(_ctx, 16)");
						setState(228);
						match(T__2);
						setState(230);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__2) | (1L << T__6) | (1L << T__7) | (1L << NEW) | (1L << THIS) | (1L << NULL) | (1L << Plus) | (1L << Minus) | (1L << SELFPLUS) | (1L << SELFSUB) | (1L << Lambda1) | (1L << Logicconst) | (1L << DecimalInteger) | (1L << STRINGCONST) | (1L << Identifier))) != 0)) {
							{
							setState(229);
							expressionlist();
							}
						}

						setState(232);
						match(T__3);
						}
						break;
					case 11:
						{
						_localctx = new Expr_arrayContext(new ExpressionContext(_parentctx, _parentState));
						((Expr_arrayContext)_localctx).array = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(233);
						if (!(precpred(_ctx, 15))) throw new FailedPredicateException(this, "precpred(_ctx, 15)");
						setState(234);
						match(T__4);
						setState(235);
						((Expr_arrayContext)_localctx).index = expression(0);
						setState(236);
						match(T__5);
						}
						break;
					}
					} 
				}
				setState(242);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,23,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class ExpressionlistContext extends ParserRuleContext {
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public List<TerminalNode> Comma() { return getTokens(MxParser.Comma); }
		public TerminalNode Comma(int i) {
			return getToken(MxParser.Comma, i);
		}
		public ExpressionlistContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expressionlist; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterExpressionlist(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitExpressionlist(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitExpressionlist(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ExpressionlistContext expressionlist() throws RecognitionException {
		ExpressionlistContext _localctx = new ExpressionlistContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_expressionlist);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(243);
			expression(0);
			setState(248);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==Comma) {
				{
				{
				setState(244);
				match(Comma);
				setState(245);
				expression(0);
				}
				}
				setState(250);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class NewtypeContext extends ParserRuleContext {
		public NewtypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_newtype; }
	 
		public NewtypeContext() { }
		public void copyFrom(NewtypeContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class NewerrorContext extends NewtypeContext {
		public NonarrayContext nonarray() {
			return getRuleContext(NonarrayContext.class,0);
		}
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public NewerrorContext(NewtypeContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterNewerror(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitNewerror(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitNewerror(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class NewclassContext extends NewtypeContext {
		public NonarrayContext nonarray() {
			return getRuleContext(NonarrayContext.class,0);
		}
		public NewclassContext(NewtypeContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterNewclass(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitNewclass(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitNewclass(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class NewarrayContext extends NewtypeContext {
		public NonarrayContext nonarray() {
			return getRuleContext(NonarrayContext.class,0);
		}
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public NewarrayContext(NewtypeContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterNewarray(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitNewarray(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitNewarray(this);
			else return visitor.visitChildren(this);
		}
	}

	public final NewtypeContext newtype() throws RecognitionException {
		NewtypeContext _localctx = new NewtypeContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_newtype);
		try {
			int _alt;
			setState(295);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,30,_ctx) ) {
			case 1:
				_localctx = new NewerrorContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(251);
				nonarray();
				setState(256); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(252);
						match(T__4);
						setState(253);
						expression(0);
						setState(254);
						match(T__5);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(258); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,25,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				setState(262); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(260);
						match(T__4);
						setState(261);
						match(T__5);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(264); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,26,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				setState(270); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(266);
						match(T__4);
						setState(267);
						expression(0);
						setState(268);
						match(T__5);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(272); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,27,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				}
				break;
			case 2:
				_localctx = new NewarrayContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(274);
				nonarray();
				setState(279); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(275);
						match(T__4);
						setState(276);
						expression(0);
						setState(277);
						match(T__5);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(281); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,28,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				setState(287);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,29,_ctx);
				while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
					if ( _alt==1 ) {
						{
						{
						setState(283);
						match(T__4);
						setState(284);
						match(T__5);
						}
						} 
					}
					setState(289);
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,29,_ctx);
				}
				}
				break;
			case 3:
				_localctx = new NewclassContext(_localctx);
				enterOuterAlt(_localctx, 3);
				{
				setState(290);
				nonarray();
				setState(291);
				match(T__2);
				setState(292);
				match(T__3);
				}
				break;
			case 4:
				_localctx = new NewclassContext(_localctx);
				enterOuterAlt(_localctx, 4);
				{
				setState(294);
				nonarray();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class BasictypeContext extends ParserRuleContext {
		public TerminalNode STRING() { return getToken(MxParser.STRING, 0); }
		public TerminalNode BOOL() { return getToken(MxParser.BOOL, 0); }
		public TerminalNode INT() { return getToken(MxParser.INT, 0); }
		public BasictypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_basictype; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterBasictype(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitBasictype(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitBasictype(this);
			else return visitor.visitChildren(this);
		}
	}

	public final BasictypeContext basictype() throws RecognitionException {
		BasictypeContext _localctx = new BasictypeContext(_ctx, getState());
		enterRule(_localctx, 28, RULE_basictype);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(297);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << INT) | (1L << BOOL) | (1L << STRING))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class NonarrayContext extends ParserRuleContext {
		public BasictypeContext basictype() {
			return getRuleContext(BasictypeContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public NonarrayContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_nonarray; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterNonarray(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitNonarray(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitNonarray(this);
			else return visitor.visitChildren(this);
		}
	}

	public final NonarrayContext nonarray() throws RecognitionException {
		NonarrayContext _localctx = new NonarrayContext(_ctx, getState());
		enterRule(_localctx, 30, RULE_nonarray);
		try {
			setState(301);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case INT:
			case BOOL:
			case STRING:
				enterOuterAlt(_localctx, 1);
				{
				setState(299);
				basictype();
				}
				break;
			case Identifier:
				enterOuterAlt(_localctx, 2);
				{
				setState(300);
				match(Identifier);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class TypeContext extends ParserRuleContext {
		public TypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_type; }
	 
		public TypeContext() { }
		public void copyFrom(TypeContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class ArrayContext extends TypeContext {
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public ArrayContext(TypeContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterArray(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitArray(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitArray(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class BasicContext extends TypeContext {
		public BasictypeContext basictype() {
			return getRuleContext(BasictypeContext.class,0);
		}
		public BasicContext(TypeContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterBasic(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitBasic(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitBasic(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class ClassContext extends TypeContext {
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public ClassContext(TypeContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterClass(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitClass(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitClass(this);
			else return visitor.visitChildren(this);
		}
	}

	public final TypeContext type() throws RecognitionException {
		return type(0);
	}

	private TypeContext type(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		TypeContext _localctx = new TypeContext(_ctx, _parentState);
		TypeContext _prevctx = _localctx;
		int _startState = 32;
		enterRecursionRule(_localctx, 32, RULE_type, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(306);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case Identifier:
				{
				_localctx = new ClassContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;

				setState(304);
				match(Identifier);
				}
				break;
			case INT:
			case BOOL:
			case STRING:
				{
				_localctx = new BasicContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(305);
				basictype();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			_ctx.stop = _input.LT(-1);
			setState(313);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,33,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new ArrayContext(new TypeContext(_parentctx, _parentState));
					pushNewRecursionContext(_localctx, _startState, RULE_type);
					setState(308);
					if (!(precpred(_ctx, 3))) throw new FailedPredicateException(this, "precpred(_ctx, 3)");
					setState(309);
					match(T__4);
					setState(310);
					match(T__5);
					}
					} 
				}
				setState(315);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,33,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class AllconstContext extends ParserRuleContext {
		public TerminalNode Logicconst() { return getToken(MxParser.Logicconst, 0); }
		public TerminalNode STRINGCONST() { return getToken(MxParser.STRINGCONST, 0); }
		public TerminalNode NULL() { return getToken(MxParser.NULL, 0); }
		public TerminalNode DecimalInteger() { return getToken(MxParser.DecimalInteger, 0); }
		public AllconstContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_allconst; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterAllconst(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitAllconst(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitAllconst(this);
			else return visitor.visitChildren(this);
		}
	}

	public final AllconstContext allconst() throws RecognitionException {
		AllconstContext _localctx = new AllconstContext(_ctx, getState());
		enterRule(_localctx, 34, RULE_allconst);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(316);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << NULL) | (1L << Logicconst) | (1L << DecimalInteger) | (1L << STRINGCONST))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 11:
			return expression_sempred((ExpressionContext)_localctx, predIndex);
		case 16:
			return type_sempred((TypeContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean expression_sempred(ExpressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(_ctx, 11);
		case 1:
			return precpred(_ctx, 10);
		case 2:
			return precpred(_ctx, 9);
		case 3:
			return precpred(_ctx, 8);
		case 4:
			return precpred(_ctx, 7);
		case 5:
			return precpred(_ctx, 6);
		case 6:
			return precpred(_ctx, 3);
		case 7:
			return precpred(_ctx, 19);
		case 8:
			return precpred(_ctx, 17);
		case 9:
			return precpred(_ctx, 16);
		case 10:
			return precpred(_ctx, 15);
		}
		return true;
	}
	private boolean type_sempred(TypeContext _localctx, int predIndex) {
		switch (predIndex) {
		case 11:
			return precpred(_ctx, 3);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3=\u0141\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\3\2\7\2(\n\2\f\2\16\2+\13\2\3\3\3\3\3\3\3\3\5\3\61\n\3\3\4"+
		"\3\4\3\4\3\4\3\4\3\4\7\49\n\4\f\4\16\4<\13\4\3\4\3\4\3\4\3\5\3\5\3\5\5"+
		"\5D\n\5\3\5\3\5\3\5\3\6\3\6\5\6K\n\6\3\6\3\6\3\6\5\6P\n\6\3\6\3\6\3\6"+
		"\3\7\3\7\3\7\3\7\3\7\3\7\7\7[\n\7\f\7\16\7^\13\7\3\b\3\b\3\b\3\t\3\t\3"+
		"\t\3\t\7\tg\n\t\f\t\16\tj\13\t\3\n\3\n\3\n\5\no\n\n\3\13\3\13\7\13s\n"+
		"\13\f\13\16\13v\13\13\3\13\3\13\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\5"+
		"\f\u0083\n\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\5\f\u0090\n\f"+
		"\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\5\f\u009c\n\f\3\f\3\f\5\f\u00a0"+
		"\n\f\3\f\3\f\5\f\u00a4\n\f\3\f\3\f\5\f\u00a8\n\f\3\r\3\r\3\r\3\r\3\r\3"+
		"\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\5\r\u00ba\n\r\3\r\5\r\u00bd"+
		"\n\r\3\r\3\r\3\r\3\r\5\r\u00c3\n\r\3\r\3\r\3\r\3\r\3\r\5\r\u00ca\n\r\3"+
		"\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r"+
		"\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\5\r\u00e9\n\r\3\r\3\r\3\r"+
		"\3\r\3\r\3\r\7\r\u00f1\n\r\f\r\16\r\u00f4\13\r\3\16\3\16\3\16\7\16\u00f9"+
		"\n\16\f\16\16\16\u00fc\13\16\3\17\3\17\3\17\3\17\3\17\6\17\u0103\n\17"+
		"\r\17\16\17\u0104\3\17\3\17\6\17\u0109\n\17\r\17\16\17\u010a\3\17\3\17"+
		"\3\17\3\17\6\17\u0111\n\17\r\17\16\17\u0112\3\17\3\17\3\17\3\17\3\17\6"+
		"\17\u011a\n\17\r\17\16\17\u011b\3\17\3\17\7\17\u0120\n\17\f\17\16\17\u0123"+
		"\13\17\3\17\3\17\3\17\3\17\3\17\5\17\u012a\n\17\3\20\3\20\3\21\3\21\5"+
		"\21\u0130\n\21\3\22\3\22\3\22\5\22\u0135\n\22\3\22\3\22\3\22\7\22\u013a"+
		"\n\22\f\22\16\22\u013d\13\22\3\23\3\23\3\23\2\4\30\"\24\2\4\6\b\n\f\16"+
		"\20\22\24\26\30\32\34\36 \"$\2\f\3\2\t\n\3\2%&\3\2*+\3\2\')\3\2#$\4\2"+
		"\37\"\61\62\3\2\13\f\3\2\r\17\3\2\20\22\4\2\36\36\668\2\u016e\2)\3\2\2"+
		"\2\4\60\3\2\2\2\6\62\3\2\2\2\b@\3\2\2\2\nJ\3\2\2\2\fT\3\2\2\2\16_\3\2"+
		"\2\2\20b\3\2\2\2\22k\3\2\2\2\24p\3\2\2\2\26\u00a7\3\2\2\2\30\u00c9\3\2"+
		"\2\2\32\u00f5\3\2\2\2\34\u0129\3\2\2\2\36\u012b\3\2\2\2 \u012f\3\2\2\2"+
		"\"\u0134\3\2\2\2$\u013e\3\2\2\2&(\5\4\3\2\'&\3\2\2\2(+\3\2\2\2)\'\3\2"+
		"\2\2)*\3\2\2\2*\3\3\2\2\2+)\3\2\2\2,\61\5\6\4\2-\61\5\16\b\2.\61\5\n\6"+
		"\2/\61\7.\2\2\60,\3\2\2\2\60-\3\2\2\2\60.\3\2\2\2\60/\3\2\2\2\61\5\3\2"+
		"\2\2\62\63\7\34\2\2\63\64\79\2\2\64:\7\3\2\2\659\5\b\5\2\669\5\n\6\2\67"+
		"9\5\16\b\28\65\3\2\2\28\66\3\2\2\28\67\3\2\2\29<\3\2\2\2:8\3\2\2\2:;\3"+
		"\2\2\2;=\3\2\2\2<:\3\2\2\2=>\7\4\2\2>?\7.\2\2?\7\3\2\2\2@A\79\2\2AC\7"+
		"\5\2\2BD\5\f\7\2CB\3\2\2\2CD\3\2\2\2DE\3\2\2\2EF\7\6\2\2FG\5\24\13\2G"+
		"\t\3\2\2\2HK\7\26\2\2IK\5\"\22\2JH\3\2\2\2JI\3\2\2\2KL\3\2\2\2LM\79\2"+
		"\2MO\7\5\2\2NP\5\f\7\2ON\3\2\2\2OP\3\2\2\2PQ\3\2\2\2QR\7\6\2\2RS\5\24"+
		"\13\2S\13\3\2\2\2TU\5\"\22\2U\\\79\2\2VW\7/\2\2WX\5\"\22\2XY\79\2\2Y["+
		"\3\2\2\2ZV\3\2\2\2[^\3\2\2\2\\Z\3\2\2\2\\]\3\2\2\2]\r\3\2\2\2^\\\3\2\2"+
		"\2_`\5\20\t\2`a\7.\2\2a\17\3\2\2\2bc\5\"\22\2ch\5\22\n\2de\7/\2\2eg\5"+
		"\22\n\2fd\3\2\2\2gj\3\2\2\2hf\3\2\2\2hi\3\2\2\2i\21\3\2\2\2jh\3\2\2\2"+
		"kn\79\2\2lm\7\60\2\2mo\5\30\r\2nl\3\2\2\2no\3\2\2\2o\23\3\2\2\2pt\7\3"+
		"\2\2qs\5\26\f\2rq\3\2\2\2sv\3\2\2\2tr\3\2\2\2tu\3\2\2\2uw\3\2\2\2vt\3"+
		"\2\2\2wx\7\4\2\2x\25\3\2\2\2y\u00a8\5\24\13\2z\u00a8\5\16\b\2{|\7\31\2"+
		"\2|\u00a8\7.\2\2}~\7\32\2\2~\u00a8\7.\2\2\177\u00a8\7.\2\2\u0080\u0082"+
		"\7\25\2\2\u0081\u0083\5\30\r\2\u0082\u0081\3\2\2\2\u0082\u0083\3\2\2\2"+
		"\u0083\u0084\3\2\2\2\u0084\u00a8\7.\2\2\u0085\u0086\5\30\r\2\u0086\u0087"+
		"\7.\2\2\u0087\u00a8\3\2\2\2\u0088\u0089\7\23\2\2\u0089\u008a\7\5\2\2\u008a"+
		"\u008b\5\30\r\2\u008b\u008c\7\6\2\2\u008c\u008f\5\26\f\2\u008d\u008e\7"+
		"\24\2\2\u008e\u0090\5\26\f\2\u008f\u008d\3\2\2\2\u008f\u0090\3\2\2\2\u0090"+
		"\u00a8\3\2\2\2\u0091\u0092\7\30\2\2\u0092\u0093\7\5\2\2\u0093\u0094\5"+
		"\30\r\2\u0094\u0095\7\6\2\2\u0095\u0096\5\26\f\2\u0096\u00a8\3\2\2\2\u0097"+
		"\u0098\7\27\2\2\u0098\u009b\7\5\2\2\u0099\u009c\5\20\t\2\u009a\u009c\5"+
		"\30\r\2\u009b\u0099\3\2\2\2\u009b\u009a\3\2\2\2\u009b\u009c\3\2\2\2\u009c"+
		"\u009d\3\2\2\2\u009d\u009f\7.\2\2\u009e\u00a0\5\30\r\2\u009f\u009e\3\2"+
		"\2\2\u009f\u00a0\3\2\2\2\u00a0\u00a1\3\2\2\2\u00a1\u00a3\7.\2\2\u00a2"+
		"\u00a4\5\30\r\2\u00a3\u00a2\3\2\2\2\u00a3\u00a4\3\2\2\2\u00a4\u00a5\3"+
		"\2\2\2\u00a5\u00a6\7\6\2\2\u00a6\u00a8\5\26\f\2\u00a7y\3\2\2\2\u00a7z"+
		"\3\2\2\2\u00a7{\3\2\2\2\u00a7}\3\2\2\2\u00a7\177\3\2\2\2\u00a7\u0080\3"+
		"\2\2\2\u00a7\u0085\3\2\2\2\u00a7\u0088\3\2\2\2\u00a7\u0091\3\2\2\2\u00a7"+
		"\u0097\3\2\2\2\u00a8\27\3\2\2\2\u00a9\u00aa\b\r\1\2\u00aa\u00ab\7\5\2"+
		"\2\u00ab\u00ac\5\30\r\2\u00ac\u00ad\7\6\2\2\u00ad\u00ca\3\2\2\2\u00ae"+
		"\u00af\7\33\2\2\u00af\u00ca\5\34\17\2\u00b0\u00b1\t\2\2\2\u00b1\u00ca"+
		"\5\30\r\20\u00b2\u00b3\t\3\2\2\u00b3\u00ca\5\30\r\17\u00b4\u00b5\t\4\2"+
		"\2\u00b5\u00ca\5\30\r\16\u00b6\u00bc\7\64\2\2\u00b7\u00b9\7\5\2\2\u00b8"+
		"\u00ba\5\f\7\2\u00b9\u00b8\3\2\2\2\u00b9\u00ba\3\2\2\2\u00ba\u00bb\3\2"+
		"\2\2\u00bb\u00bd\7\6\2\2\u00bc\u00b7\3\2\2\2\u00bc\u00bd\3\2\2\2\u00bd"+
		"\u00be\3\2\2\2\u00be\u00bf\7\65\2\2\u00bf\u00c0\5\24\13\2\u00c0\u00c2"+
		"\7\5\2\2\u00c1\u00c3\5\32\16\2\u00c2\u00c1\3\2\2\2\u00c2\u00c3\3\2\2\2"+
		"\u00c3\u00c4\3\2\2\2\u00c4\u00c5\7\6\2\2\u00c5\u00ca\3\2\2\2\u00c6\u00ca"+
		"\7\35\2\2\u00c7\u00ca\5$\23\2\u00c8\u00ca\79\2\2\u00c9\u00a9\3\2\2\2\u00c9"+
		"\u00ae\3\2\2\2\u00c9\u00b0\3\2\2\2\u00c9\u00b2\3\2\2\2\u00c9\u00b4\3\2"+
		"\2\2\u00c9\u00b6\3\2\2\2\u00c9\u00c6\3\2\2\2\u00c9\u00c7\3\2\2\2\u00c9"+
		"\u00c8\3\2\2\2\u00ca\u00f2\3\2\2\2\u00cb\u00cc\f\r\2\2\u00cc\u00cd\t\5"+
		"\2\2\u00cd\u00f1\5\30\r\16\u00ce\u00cf\f\f\2\2\u00cf\u00d0\t\3\2\2\u00d0"+
		"\u00f1\5\30\r\r\u00d1\u00d2\f\13\2\2\u00d2\u00d3\t\6\2\2\u00d3\u00f1\5"+
		"\30\r\f\u00d4\u00d5\f\n\2\2\u00d5\u00d6\t\7\2\2\u00d6\u00f1\5\30\r\13"+
		"\u00d7\u00d8\f\t\2\2\u00d8\u00d9\t\b\2\2\u00d9\u00f1\5\30\r\n\u00da\u00db"+
		"\f\b\2\2\u00db\u00dc\t\t\2\2\u00dc\u00f1\5\30\r\t\u00dd\u00de\f\5\2\2"+
		"\u00de\u00df\7\60\2\2\u00df\u00f1\5\30\r\5\u00e0\u00e1\f\25\2\2\u00e1"+
		"\u00f1\t\4\2\2\u00e2\u00e3\f\23\2\2\u00e3\u00e4\7\63\2\2\u00e4\u00f1\7"+
		"9\2\2\u00e5\u00e6\f\22\2\2\u00e6\u00e8\7\5\2\2\u00e7\u00e9\5\32\16\2\u00e8"+
		"\u00e7\3\2\2\2\u00e8\u00e9\3\2\2\2\u00e9\u00ea\3\2\2\2\u00ea\u00f1\7\6"+
		"\2\2\u00eb\u00ec\f\21\2\2\u00ec\u00ed\7\7\2\2\u00ed\u00ee\5\30\r\2\u00ee"+
		"\u00ef\7\b\2\2\u00ef\u00f1\3\2\2\2\u00f0\u00cb\3\2\2\2\u00f0\u00ce\3\2"+
		"\2\2\u00f0\u00d1\3\2\2\2\u00f0\u00d4\3\2\2\2\u00f0\u00d7\3\2\2\2\u00f0"+
		"\u00da\3\2\2\2\u00f0\u00dd\3\2\2\2\u00f0\u00e0\3\2\2\2\u00f0\u00e2\3\2"+
		"\2\2\u00f0\u00e5\3\2\2\2\u00f0\u00eb\3\2\2\2\u00f1\u00f4\3\2\2\2\u00f2"+
		"\u00f0\3\2\2\2\u00f2\u00f3\3\2\2\2\u00f3\31\3\2\2\2\u00f4\u00f2\3\2\2"+
		"\2\u00f5\u00fa\5\30\r\2\u00f6\u00f7\7/\2\2\u00f7\u00f9\5\30\r\2\u00f8"+
		"\u00f6\3\2\2\2\u00f9\u00fc\3\2\2\2\u00fa\u00f8\3\2\2\2\u00fa\u00fb\3\2"+
		"\2\2\u00fb\33\3\2\2\2\u00fc\u00fa\3\2\2\2\u00fd\u0102\5 \21\2\u00fe\u00ff"+
		"\7\7\2\2\u00ff\u0100\5\30\r\2\u0100\u0101\7\b\2\2\u0101\u0103\3\2\2\2"+
		"\u0102\u00fe\3\2\2\2\u0103\u0104\3\2\2\2\u0104\u0102\3\2\2\2\u0104\u0105"+
		"\3\2\2\2\u0105\u0108\3\2\2\2\u0106\u0107\7\7\2\2\u0107\u0109\7\b\2\2\u0108"+
		"\u0106\3\2\2\2\u0109\u010a\3\2\2\2\u010a\u0108\3\2\2\2\u010a\u010b\3\2"+
		"\2\2\u010b\u0110\3\2\2\2\u010c\u010d\7\7\2\2\u010d\u010e\5\30\r\2\u010e"+
		"\u010f\7\b\2\2\u010f\u0111\3\2\2\2\u0110\u010c\3\2\2\2\u0111\u0112\3\2"+
		"\2\2\u0112\u0110\3\2\2\2\u0112\u0113\3\2\2\2\u0113\u012a\3\2\2\2\u0114"+
		"\u0119\5 \21\2\u0115\u0116\7\7\2\2\u0116\u0117\5\30\r\2\u0117\u0118\7"+
		"\b\2\2\u0118\u011a\3\2\2\2\u0119\u0115\3\2\2\2\u011a\u011b\3\2\2\2\u011b"+
		"\u0119\3\2\2\2\u011b\u011c\3\2\2\2\u011c\u0121\3\2\2\2\u011d\u011e\7\7"+
		"\2\2\u011e\u0120\7\b\2\2\u011f\u011d\3\2\2\2\u0120\u0123\3\2\2\2\u0121"+
		"\u011f\3\2\2\2\u0121\u0122\3\2\2\2\u0122\u012a\3\2\2\2\u0123\u0121\3\2"+
		"\2\2\u0124\u0125\5 \21\2\u0125\u0126\7\5\2\2\u0126\u0127\7\6\2\2\u0127"+
		"\u012a\3\2\2\2\u0128\u012a\5 \21\2\u0129\u00fd\3\2\2\2\u0129\u0114\3\2"+
		"\2\2\u0129\u0124\3\2\2\2\u0129\u0128\3\2\2\2\u012a\35\3\2\2\2\u012b\u012c"+
		"\t\n\2\2\u012c\37\3\2\2\2\u012d\u0130\5\36\20\2\u012e\u0130\79\2\2\u012f"+
		"\u012d\3\2\2\2\u012f\u012e\3\2\2\2\u0130!\3\2\2\2\u0131\u0132\b\22\1\2"+
		"\u0132\u0135\79\2\2\u0133\u0135\5\36\20\2\u0134\u0131\3\2\2\2\u0134\u0133"+
		"\3\2\2\2\u0135\u013b\3\2\2\2\u0136\u0137\f\5\2\2\u0137\u0138\7\7\2\2\u0138"+
		"\u013a\7\b\2\2\u0139\u0136\3\2\2\2\u013a\u013d\3\2\2\2\u013b\u0139\3\2"+
		"\2\2\u013b\u013c\3\2\2\2\u013c#\3\2\2\2\u013d\u013b\3\2\2\2\u013e\u013f"+
		"\t\13\2\2\u013f%\3\2\2\2$)\608:CJO\\hnt\u0082\u008f\u009b\u009f\u00a3"+
		"\u00a7\u00b9\u00bc\u00c2\u00c9\u00e8\u00f0\u00f2\u00fa\u0104\u010a\u0112"+
		"\u011b\u0121\u0129\u012f\u0134\u013b";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}