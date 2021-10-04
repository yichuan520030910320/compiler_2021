// Generated from C:/Users/18303/IdeaProjects/Mx/src/Parser\Mx.g4 by ANTLR 4.9.1
package Parser;



import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link MxParser}.
 */
public interface MxListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link MxParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(MxParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(MxParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#programunit}.
	 * @param ctx the parse tree
	 */
	void enterProgramunit(MxParser.ProgramunitContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#programunit}.
	 * @param ctx the parse tree
	 */
	void exitProgramunit(MxParser.ProgramunitContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#classdef}.
	 * @param ctx the parse tree
	 */
	void enterClassdef(MxParser.ClassdefContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#classdef}.
	 * @param ctx the parse tree
	 */
	void exitClassdef(MxParser.ClassdefContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#constructdeclar}.
	 * @param ctx the parse tree
	 */
	void enterConstructdeclar(MxParser.ConstructdeclarContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#constructdeclar}.
	 * @param ctx the parse tree
	 */
	void exitConstructdeclar(MxParser.ConstructdeclarContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#fundeclar}.
	 * @param ctx the parse tree
	 */
	void enterFundeclar(MxParser.FundeclarContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#fundeclar}.
	 * @param ctx the parse tree
	 */
	void exitFundeclar(MxParser.FundeclarContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#parameterlist}.
	 * @param ctx the parse tree
	 */
	void enterParameterlist(MxParser.ParameterlistContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#parameterlist}.
	 * @param ctx the parse tree
	 */
	void exitParameterlist(MxParser.ParameterlistContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#vardeclarstat}.
	 * @param ctx the parse tree
	 */
	void enterVardeclarstat(MxParser.VardeclarstatContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#vardeclarstat}.
	 * @param ctx the parse tree
	 */
	void exitVardeclarstat(MxParser.VardeclarstatContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#vardeclarlist}.
	 * @param ctx the parse tree
	 */
	void enterVardeclarlist(MxParser.VardeclarlistContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#vardeclarlist}.
	 * @param ctx the parse tree
	 */
	void exitVardeclarlist(MxParser.VardeclarlistContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#vardeclar}.
	 * @param ctx the parse tree
	 */
	void enterVardeclar(MxParser.VardeclarContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#vardeclar}.
	 * @param ctx the parse tree
	 */
	void exitVardeclar(MxParser.VardeclarContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#suite}.
	 * @param ctx the parse tree
	 */
	void enterSuite(MxParser.SuiteContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#suite}.
	 * @param ctx the parse tree
	 */
	void exitSuite(MxParser.SuiteContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(MxParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(MxParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(MxParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(MxParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#expressionlist}.
	 * @param ctx the parse tree
	 */
	void enterExpressionlist(MxParser.ExpressionlistContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#expressionlist}.
	 * @param ctx the parse tree
	 */
	void exitExpressionlist(MxParser.ExpressionlistContext ctx);
	/**
	 * Enter a parse tree produced by the {@code newarray}
	 * labeled alternative in {@link MxParser#newtype}.
	 * @param ctx the parse tree
	 */
	void enterNewarray(MxParser.NewarrayContext ctx);
	/**
	 * Exit a parse tree produced by the {@code newarray}
	 * labeled alternative in {@link MxParser#newtype}.
	 * @param ctx the parse tree
	 */
	void exitNewarray(MxParser.NewarrayContext ctx);
	/**
	 * Enter a parse tree produced by the {@code newerror}
	 * labeled alternative in {@link MxParser#newtype}.
	 * @param ctx the parse tree
	 */
	void enterNewerror(MxParser.NewerrorContext ctx);
	/**
	 * Exit a parse tree produced by the {@code newerror}
	 * labeled alternative in {@link MxParser#newtype}.
	 * @param ctx the parse tree
	 */
	void exitNewerror(MxParser.NewerrorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code newclass}
	 * labeled alternative in {@link MxParser#newtype}.
	 * @param ctx the parse tree
	 */
	void enterNewclass(MxParser.NewclassContext ctx);
	/**
	 * Exit a parse tree produced by the {@code newclass}
	 * labeled alternative in {@link MxParser#newtype}.
	 * @param ctx the parse tree
	 */
	void exitNewclass(MxParser.NewclassContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#basictype}.
	 * @param ctx the parse tree
	 */
	void enterBasictype(MxParser.BasictypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#basictype}.
	 * @param ctx the parse tree
	 */
	void exitBasictype(MxParser.BasictypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#nonarray}.
	 * @param ctx the parse tree
	 */
	void enterNonarray(MxParser.NonarrayContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#nonarray}.
	 * @param ctx the parse tree
	 */
	void exitNonarray(MxParser.NonarrayContext ctx);
	/**
	 * Enter a parse tree produced by the {@code array}
	 * labeled alternative in {@link MxParser#type}.
	 * @param ctx the parse tree
	 */
	void enterArray(MxParser.ArrayContext ctx);
	/**
	 * Exit a parse tree produced by the {@code array}
	 * labeled alternative in {@link MxParser#type}.
	 * @param ctx the parse tree
	 */
	void exitArray(MxParser.ArrayContext ctx);
	/**
	 * Enter a parse tree produced by the {@code basic}
	 * labeled alternative in {@link MxParser#type}.
	 * @param ctx the parse tree
	 */
	void enterBasic(MxParser.BasicContext ctx);
	/**
	 * Exit a parse tree produced by the {@code basic}
	 * labeled alternative in {@link MxParser#type}.
	 * @param ctx the parse tree
	 */
	void exitBasic(MxParser.BasicContext ctx);
	/**
	 * Enter a parse tree produced by the {@code class}
	 * labeled alternative in {@link MxParser#type}.
	 * @param ctx the parse tree
	 */
	void enterClass(MxParser.ClassContext ctx);
	/**
	 * Exit a parse tree produced by the {@code class}
	 * labeled alternative in {@link MxParser#type}.
	 * @param ctx the parse tree
	 */
	void exitClass(MxParser.ClassContext ctx);
}