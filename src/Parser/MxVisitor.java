// Generated from C:/Users/18303/IdeaProjects/Mx/src/Parser\Mx.g4 by ANTLR 4.9.1
package Parser;

import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link MxParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface MxVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link MxParser#program}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram(MxParser.ProgramContext ctx);
	/**
	 * Visit a parse tree produced by the {@code programunit_class}
	 * labeled alternative in {@link MxParser#programunit}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgramunit_class(MxParser.Programunit_classContext ctx);
	/**
	 * Visit a parse tree produced by the {@code programunit_vardeclar}
	 * labeled alternative in {@link MxParser#programunit}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgramunit_vardeclar(MxParser.Programunit_vardeclarContext ctx);
	/**
	 * Visit a parse tree produced by the {@code programunit_fun}
	 * labeled alternative in {@link MxParser#programunit}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgramunit_fun(MxParser.Programunit_funContext ctx);
	/**
	 * Visit a parse tree produced by the {@code programunit_semi}
	 * labeled alternative in {@link MxParser#programunit}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgramunit_semi(MxParser.Programunit_semiContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#classdef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassdef(MxParser.ClassdefContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#constructdeclar}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConstructdeclar(MxParser.ConstructdeclarContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#fundeclar}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFundeclar(MxParser.FundeclarContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#parameterlist}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParameterlist(MxParser.ParameterlistContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#vardeclarstat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVardeclarstat(MxParser.VardeclarstatContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#vardeclarlist}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVardeclarlist(MxParser.VardeclarlistContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#vardeclar}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVardeclar(MxParser.VardeclarContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#suite}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSuite(MxParser.SuiteContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_suite}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_suite(MxParser.Stat_suiteContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_vardeclar}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_vardeclar(MxParser.Stat_vardeclarContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_break}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_break(MxParser.Stat_breakContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_continue}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_continue(MxParser.Stat_continueContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_semi}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_semi(MxParser.Stat_semiContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_return}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_return(MxParser.Stat_returnContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_expr}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_expr(MxParser.Stat_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_if}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_if(MxParser.Stat_ifContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_while}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_while(MxParser.Stat_whileContext ctx);
	/**
	 * Visit a parse tree produced by the {@code stat_for}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat_for(MxParser.Stat_forContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_new}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_new(MxParser.Expr_newContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_const}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_const(MxParser.Expr_constContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_idetifier}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_idetifier(MxParser.Expr_idetifierContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_assign}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_assign(MxParser.Expr_assignContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_this}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_this(MxParser.Expr_thisContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_parenexpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_parenexpr(MxParser.Expr_parenexprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_function}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_function(MxParser.Expr_functionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_binary}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_binary(MxParser.Expr_binaryContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_array}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_array(MxParser.Expr_arrayContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_lambda}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_lambda(MxParser.Expr_lambdaContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_single}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_single(MxParser.Expr_singleContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_member}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_member(MxParser.Expr_memberContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_single_post}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_single_post(MxParser.Expr_single_postContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#expressionlist}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpressionlist(MxParser.ExpressionlistContext ctx);
	/**
	 * Visit a parse tree produced by the {@code newerror}
	 * labeled alternative in {@link MxParser#newtype}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNewerror(MxParser.NewerrorContext ctx);
	/**
	 * Visit a parse tree produced by the {@code newarray}
	 * labeled alternative in {@link MxParser#newtype}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNewarray(MxParser.NewarrayContext ctx);
	/**
	 * Visit a parse tree produced by the {@code newclass}
	 * labeled alternative in {@link MxParser#newtype}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNewclass(MxParser.NewclassContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#basictype}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBasictype(MxParser.BasictypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#nonarray}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNonarray(MxParser.NonarrayContext ctx);
	/**
	 * Visit a parse tree produced by the {@code array}
	 * labeled alternative in {@link MxParser#type}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArray(MxParser.ArrayContext ctx);
	/**
	 * Visit a parse tree produced by the {@code basic}
	 * labeled alternative in {@link MxParser#type}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBasic(MxParser.BasicContext ctx);
	/**
	 * Visit a parse tree produced by the {@code class}
	 * labeled alternative in {@link MxParser#type}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClass(MxParser.ClassContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#allconst}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAllconst(MxParser.AllconstContext ctx);
}