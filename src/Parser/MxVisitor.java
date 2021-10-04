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
	 * Visit a parse tree produced by {@link MxParser#programunit}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgramunit(MxParser.ProgramunitContext ctx);
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
	 * Visit a parse tree produced by {@link MxParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatement(MxParser.StatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpression(MxParser.ExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#expressionlist}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpressionlist(MxParser.ExpressionlistContext ctx);
	/**
	 * Visit a parse tree produced by the {@code newarray}
	 * labeled alternative in {@link MxParser#newtype}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNewarray(MxParser.NewarrayContext ctx);
	/**
	 * Visit a parse tree produced by the {@code newerror}
	 * labeled alternative in {@link MxParser#newtype}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNewerror(MxParser.NewerrorContext ctx);
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
}