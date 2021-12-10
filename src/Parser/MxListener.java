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
	 * Enter a parse tree produced by the {@code programunit_class}
	 * labeled alternative in {@link MxParser#programunit}.
	 * @param ctx the parse tree
	 */
	void enterProgramunit_class(MxParser.Programunit_classContext ctx);
	/**
	 * Exit a parse tree produced by the {@code programunit_class}
	 * labeled alternative in {@link MxParser#programunit}.
	 * @param ctx the parse tree
	 */
	void exitProgramunit_class(MxParser.Programunit_classContext ctx);
	/**
	 * Enter a parse tree produced by the {@code programunit_vardeclar}
	 * labeled alternative in {@link MxParser#programunit}.
	 * @param ctx the parse tree
	 */
	void enterProgramunit_vardeclar(MxParser.Programunit_vardeclarContext ctx);
	/**
	 * Exit a parse tree produced by the {@code programunit_vardeclar}
	 * labeled alternative in {@link MxParser#programunit}.
	 * @param ctx the parse tree
	 */
	void exitProgramunit_vardeclar(MxParser.Programunit_vardeclarContext ctx);
	/**
	 * Enter a parse tree produced by the {@code programunit_fun}
	 * labeled alternative in {@link MxParser#programunit}.
	 * @param ctx the parse tree
	 */
	void enterProgramunit_fun(MxParser.Programunit_funContext ctx);
	/**
	 * Exit a parse tree produced by the {@code programunit_fun}
	 * labeled alternative in {@link MxParser#programunit}.
	 * @param ctx the parse tree
	 */
	void exitProgramunit_fun(MxParser.Programunit_funContext ctx);
	/**
	 * Enter a parse tree produced by the {@code programunit_semi}
	 * labeled alternative in {@link MxParser#programunit}.
	 * @param ctx the parse tree
	 */
	void enterProgramunit_semi(MxParser.Programunit_semiContext ctx);
	/**
	 * Exit a parse tree produced by the {@code programunit_semi}
	 * labeled alternative in {@link MxParser#programunit}.
	 * @param ctx the parse tree
	 */
	void exitProgramunit_semi(MxParser.Programunit_semiContext ctx);
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
	 * Enter a parse tree produced by the {@code stat_suite}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStat_suite(MxParser.Stat_suiteContext ctx);
	/**
	 * Exit a parse tree produced by the {@code stat_suite}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStat_suite(MxParser.Stat_suiteContext ctx);
	/**
	 * Enter a parse tree produced by the {@code stat_vardeclar}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStat_vardeclar(MxParser.Stat_vardeclarContext ctx);
	/**
	 * Exit a parse tree produced by the {@code stat_vardeclar}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStat_vardeclar(MxParser.Stat_vardeclarContext ctx);
	/**
	 * Enter a parse tree produced by the {@code stat_break}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStat_break(MxParser.Stat_breakContext ctx);
	/**
	 * Exit a parse tree produced by the {@code stat_break}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStat_break(MxParser.Stat_breakContext ctx);
	/**
	 * Enter a parse tree produced by the {@code stat_continue}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStat_continue(MxParser.Stat_continueContext ctx);
	/**
	 * Exit a parse tree produced by the {@code stat_continue}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStat_continue(MxParser.Stat_continueContext ctx);
	/**
	 * Enter a parse tree produced by the {@code stat_semi}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStat_semi(MxParser.Stat_semiContext ctx);
	/**
	 * Exit a parse tree produced by the {@code stat_semi}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStat_semi(MxParser.Stat_semiContext ctx);
	/**
	 * Enter a parse tree produced by the {@code stat_return}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStat_return(MxParser.Stat_returnContext ctx);
	/**
	 * Exit a parse tree produced by the {@code stat_return}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStat_return(MxParser.Stat_returnContext ctx);
	/**
	 * Enter a parse tree produced by the {@code stat_expr}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStat_expr(MxParser.Stat_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code stat_expr}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStat_expr(MxParser.Stat_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code stat_if}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStat_if(MxParser.Stat_ifContext ctx);
	/**
	 * Exit a parse tree produced by the {@code stat_if}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStat_if(MxParser.Stat_ifContext ctx);
	/**
	 * Enter a parse tree produced by the {@code stat_while}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStat_while(MxParser.Stat_whileContext ctx);
	/**
	 * Exit a parse tree produced by the {@code stat_while}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStat_while(MxParser.Stat_whileContext ctx);
	/**
	 * Enter a parse tree produced by the {@code stat_for}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStat_for(MxParser.Stat_forContext ctx);
	/**
	 * Exit a parse tree produced by the {@code stat_for}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStat_for(MxParser.Stat_forContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expr_new}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpr_new(MxParser.Expr_newContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expr_new}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpr_new(MxParser.Expr_newContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expr_const}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpr_const(MxParser.Expr_constContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expr_const}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpr_const(MxParser.Expr_constContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expr_idetifier}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpr_idetifier(MxParser.Expr_idetifierContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expr_idetifier}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpr_idetifier(MxParser.Expr_idetifierContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expr_assign}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpr_assign(MxParser.Expr_assignContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expr_assign}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpr_assign(MxParser.Expr_assignContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expr_this}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpr_this(MxParser.Expr_thisContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expr_this}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpr_this(MxParser.Expr_thisContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expr_parenexpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpr_parenexpr(MxParser.Expr_parenexprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expr_parenexpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpr_parenexpr(MxParser.Expr_parenexprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expr_function}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpr_function(MxParser.Expr_functionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expr_function}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpr_function(MxParser.Expr_functionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expr_binary}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpr_binary(MxParser.Expr_binaryContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expr_binary}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpr_binary(MxParser.Expr_binaryContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expr_array}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpr_array(MxParser.Expr_arrayContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expr_array}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpr_array(MxParser.Expr_arrayContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expr_lambda}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpr_lambda(MxParser.Expr_lambdaContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expr_lambda}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpr_lambda(MxParser.Expr_lambdaContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expr_single}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpr_single(MxParser.Expr_singleContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expr_single}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpr_single(MxParser.Expr_singleContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expr_member}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpr_member(MxParser.Expr_memberContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expr_member}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpr_member(MxParser.Expr_memberContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expr_single_post}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpr_single_post(MxParser.Expr_single_postContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expr_single_post}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpr_single_post(MxParser.Expr_single_postContext ctx);
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
	/**
	 * Enter a parse tree produced by {@link MxParser#allconst}.
	 * @param ctx the parse tree
	 */
	void enterAllconst(MxParser.AllconstContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#allconst}.
	 * @param ctx the parse tree
	 */
	void exitAllconst(MxParser.AllconstContext ctx);
}