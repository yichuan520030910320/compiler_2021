package frontend;

import AST.ASTnode;
import AST.EXPRnode.*;
import AST.EXPRnode.CONSTEXPRnode.Constbool_ASTnode;
import AST.EXPRnode.CONSTEXPRnode.Constint_ASTnode;
import AST.EXPRnode.CONSTEXPRnode.Constnull_ASTnode;
import AST.EXPRnode.CONSTEXPRnode.Conststring_ASTnode;
import AST.Rootnode;
import AST.STATnode.*;
import AST.TYPEnode.*;
import AST.VALDECLnode.*;
import Parser.MxBaseVisitor;
import Parser.MxParser;
import Utils.error.SemanticError;
import Utils.globalscope;
import Utils.position;
import org.antlr.v4.runtime.tree.ParseTree;

import java.util.LinkedList;
import java.util.LinkedList;

public class ASTbuilder extends MxBaseVisitor<ASTnode> {
    public globalscope Gscope;



    public ASTbuilder(globalscope Gscope_) {
        Gscope = Gscope_;
    }



    @Override
    public ASTnode visitAllconst(MxParser.AllconstContext ctx) {

        if (ctx.DecimalInteger() != null) {

            return new Constint_ASTnode(new position(ctx.getStart()), new Inttype_ASTnode(null, "int"), ctx.getText());
        }
        if (ctx.STRINGCONST() != null) {

            return new Conststring_ASTnode(new position(ctx.getStart()), new Stringtype_ASTnode(null, "string"), ctx.getText());
        }
        if (ctx.Logicconst() != null) {

            return new Constbool_ASTnode(new position(ctx.getStart()), new Booltype_ASTnode(null, "bool"), ctx.getText());
        } else {
            return new Constnull_ASTnode(new position(ctx.getStart()), new Nulltype_ASTnode(null, "null", 0), ctx.getText());
        }
    }

    @Override
    public ASTnode visitBasictype(MxParser.BasictypeContext ctx) {
        if (ctx.STRING() != null) {
            return new Stringtype_ASTnode(new position(ctx.getStart()), "string");
        } else if (ctx.BOOL() != null) {
            return new Booltype_ASTnode(new position(ctx.getStart()), "bool");
        } else {
            return new Inttype_ASTnode(new position(ctx.getStart()), "int");
        }
    }

    @Override
    public ASTnode visitNonarray(MxParser.NonarrayContext ctx) {
        if (ctx.Identifier() != null) {
            return new Classtype_ASTnode(new position(ctx.getStart()), ctx.getText(), ctx.getText());
        } else {
            return visit(ctx.basictype());
        }
    }

    @Override
    public ASTnode visitArray(MxParser.ArrayContext ctx) {
        Type_ASTnode basictype = (Type_ASTnode) visit(ctx.type());//这边产生了递归 和g4产生递归的模式一致
        return new Arraytype_ASTnode(basictype, new position(ctx.getStart()));
    }

    @Override
    public ASTnode visitClass(MxParser.ClassContext ctx) {
        return new Classtype_ASTnode(new position(ctx.getStart()), ctx.getText(), ctx.getText());
    }

    @Override
    public ASTnode visitBasic(MxParser.BasicContext ctx) {
        return visit(ctx.basictype());
    }

    @Override
    public ASTnode visitNewclass(MxParser.NewclassContext ctx) {
        Type_ASTnode type = (Type_ASTnode) visit(ctx.nonarray());

        return new NewExp_ASTnode(new position(ctx.getStart()), type, null, null, 0, type);
    }

    @Override
    public ASTnode visitNewerror(MxParser.NewerrorContext ctx) {
        throw new SemanticError(" can't new this type of array", new position(ctx.getStart()));
    }

    @Override
    public ASTnode visitNewarray(MxParser.NewarrayContext ctx) {//the num of [] is dim
        LinkedList<Expr_ASTnode> list = new LinkedList<>();
        for (int i = 0; i < ctx.expression().size(); i++) {
            list.add((Expr_ASTnode) visit(ctx.expression().get(i)));
        }
        Type_ASTnode basictype = (Type_ASTnode) visit(ctx.nonarray());
        int dim = 0;
        for (ParseTree child : ctx.children) {
            if (child.getText().equals("[")) {
                dim++;
            }
        }
        Arraytype_ASTnode array_type = new Arraytype_ASTnode(basictype, new position(ctx.getStart()), dim);
        array_type.arraytype=basictype;
        return new NewExp_ASTnode(new position(ctx.getStart()), basictype, null, list, dim, array_type);
    }


    @Override
    public ASTnode visitExpr_const(MxParser.Expr_constContext ctx) {
        return visit(ctx.allconst());
    }

    @Override
    public ASTnode visitExpr_idetifier(MxParser.Expr_idetifierContext ctx) {
        return new IdExp_ASTnode(new position(ctx.getStart()), null, ctx.getText(), ctx.getText());
    }

    @Override
    public ASTnode visitExpr_this(MxParser.Expr_thisContext ctx) {
        return new Thisexpr_ASTnode(new position(ctx.getStart()), null, null);
    }

    @Override
    public ASTnode visitExpr_parenexpr(MxParser.Expr_parenexprContext ctx) {
        return visit(ctx.expression());
    }

    @Override
    public ASTnode visitExpr_binary(MxParser.Expr_binaryContext ctx) {
        Binary_Enum op = null;
        String binaryop = ctx.op.getText();
        switch (binaryop) {
            case "*" -> op = Binary_Enum.MUL;
            case "/" -> op = Binary_Enum.DIV;
            case "%" -> op = Binary_Enum.MOD;
            case "+" -> op = Binary_Enum.ADD;
            case "-" -> op = Binary_Enum.SUB;
            case "<<" -> op = Binary_Enum.LEFT_SHIFT;
            case ">>" -> op = Binary_Enum.RIGHT_SHIFT;
            case "&&" -> op = Binary_Enum.AND;
            case "||" -> op = Binary_Enum.OR;
            case "&" -> op = Binary_Enum.Bitwise_and;
            case "|" -> op = Binary_Enum.Bitwise_or;
            case "^" -> op = Binary_Enum.Bitwise_xor;
            case "==" -> op = Binary_Enum.EQUALEQUAL;
            case "!=" -> op = Binary_Enum.NOT_EQUAL;
            case ">" -> op = Binary_Enum.GREATER;
            case ">=" -> op = Binary_Enum.GREATEREQUAL;
            case "<" -> op = Binary_Enum.LESSER;
            case "<=" -> op = Binary_Enum.LESSEREQUAL;
            default -> System.out.println("binary expression miss the op in astbuilder");
        }
        Expr_ASTnode lhs = (Expr_ASTnode) visit(ctx.operand1);
        Expr_ASTnode rhs = (Expr_ASTnode) visit(ctx.operand2);
        return new BinaryExp_ASTnode(new position(ctx.getStart()), null, lhs, rhs, op);
    }

    @Override
    public ASTnode visitExpr_single(MxParser.Expr_singleContext ctx) {//代表前置的运算符
        Single_Enum op = null;
        String singleop = ctx.op.getText();
        switch (singleop) {
            case "++" -> op = Single_Enum.SELFPLUS;
            case "--" -> op = Single_Enum.SELFSUB;
            case "+" -> op = Single_Enum.ADD;
            case "-" -> op = Single_Enum.SUB;
            case "!" -> op = Single_Enum.NOT;
            case "~" -> op = Single_Enum.TILDE;
            default -> System.out.println("single expression miss the op in astbuilder front");
        }
        Expr_ASTnode expr = (Expr_ASTnode) visit(ctx.expression());
        return new Front_UnaryExp_ASTnode(new position(ctx.getStart()), null, expr, op);
    }

    @Override
    public ASTnode visitExpr_single_post(MxParser.Expr_single_postContext ctx) {
        Single_Enum op = null;
        String singleop = ctx.op.getText();
        switch (singleop) {
            case "++" -> op = Single_Enum.SELFPLUS;
            case "--" -> op = Single_Enum.SELFSUB;
            default -> System.out.println("single expression miss the op in astbuilder post");
        }
        Expr_ASTnode expr = (Expr_ASTnode) visit(ctx.expression());
        return new Post_UnaryExp_ASTnode(new position(ctx.getStart()), null, expr, op);
    }

    @Override
    public ASTnode visitExpr_assign(MxParser.Expr_assignContext ctx) {//和binaryexpr同构
        Binary_Enum op = Binary_Enum.EQUAL;
        Expr_ASTnode lhs = (Expr_ASTnode) visit(ctx.operand1);
        Expr_ASTnode rhs = (Expr_ASTnode) visit(ctx.operand2);
        return new BinaryExp_ASTnode(new position(ctx.getStart()), null, lhs, rhs, op);
    }

    @Override
    public ASTnode visitExpr_member(MxParser.Expr_memberContext ctx) {
        Expr_ASTnode lhs = (Expr_ASTnode) visit(ctx.expression());
        String identifier = ctx.Identifier().getText();
        return new MemberExp_ASTnode(new position(ctx.getStart()), null, null, lhs, identifier);
    }

    @Override
    public ASTnode visitExpr_array(MxParser.Expr_arrayContext ctx) {
        Expr_ASTnode array = (Expr_ASTnode) visit(ctx.array);
        Expr_ASTnode index = (Expr_ASTnode) visit(ctx.index);
        return new ArrayExp_ASTnode(new position(ctx.getStart()), null, null, array, index);
    }

    @Override
    public ASTnode visitExpr_function(MxParser.Expr_functionContext ctx) {
        LinkedList<Expr_ASTnode> exprlist = new LinkedList<>();
        Expr_ASTnode exp1 = (Expr_ASTnode) visit(ctx.expression());
        if (ctx.expressionlist() == null) {
            return new FunctioncallExp_ASTnode(new position(ctx.getStart()), null, ctx.getText(), exp1, null);
        }

        for (int i = 0; i < ctx.expressionlist().expression().size(); i++) {
            Expr_ASTnode tmpexpr = (Expr_ASTnode) visit(ctx.expressionlist().expression().get(i));
            exprlist.add(tmpexpr);
        }
        return new FunctioncallExp_ASTnode(new position(ctx.getStart()), null, ctx.getText(), exp1, exprlist);
    }

    @Override
    public ASTnode visitExpr_lambda(MxParser.Expr_lambdaContext ctx) {
        Paralist_ASTnode paralist = ctx.lambdapara == null ? null : (Paralist_ASTnode) visit(ctx.parameterlist());
        Suite_ASTnode suite = (Suite_ASTnode) visit(ctx.suite());
        LinkedList<Expr_ASTnode> funcalllist = new LinkedList<>();
        if (ctx.lambdaexprelist != null) {
            for (int i = 0; i < ctx.lambdaexprelist.expression().size(); i++) {
                funcalllist.add((Expr_ASTnode) visit(ctx.expressionlist().expression().get(i)));
            }
        }
        return new LambdaExp_ASTnode(new position(ctx.getStart()), null, paralist, suite, funcalllist);
    }

    @Override
    public ASTnode visitVardeclar(MxParser.VardeclarContext ctx) {
        String id = ctx.Identifier().getText();
        Expr_ASTnode expr = null;
        if (ctx.expression() != null) {
            expr = (Expr_ASTnode) visit(ctx.expression());
        }
        return new Singlevaluedecl_ASTnode(new position(ctx.getStart()), null, id, expr);
    }

    @Override
    public ASTnode visitVardeclarlist(MxParser.VardeclarlistContext ctx) {
        Type_ASTnode type = (Type_ASTnode) visit(ctx.type());
        LinkedList<Singlevaluedecl_ASTnode> vardellist = new LinkedList<>();
        for (int i = 0; i < ctx.vardeclar().size(); i++) {
            Singlevaluedecl_ASTnode tmpexpr = (Singlevaluedecl_ASTnode) visit(ctx.vardeclar().get(i));
            tmpexpr.type = type;
            vardellist.add(tmpexpr);
        }
        return new Valdeclstat_ASTnode(new position(ctx.getStart()), vardellist, type);
    }

    @Override
    public ASTnode visitVardeclarstat(MxParser.VardeclarstatContext ctx) {
        return visit(ctx.vardeclarlist());
    }

    @Override
    public ASTnode visitParameterlist(MxParser.ParameterlistContext ctx) {
        LinkedList<Singlevaluedecl_ASTnode> paralist = new LinkedList<>();
        for (int i = 0; i < ctx.Identifier().size(); i++) {
            Type_ASTnode tmptype = (Type_ASTnode) visit(ctx.type(i));
            Singlevaluedecl_ASTnode tempsingle = new Singlevaluedecl_ASTnode(new position(ctx.getStart()), tmptype, ctx.Identifier().get(i).getText(), null);
            paralist.add(tempsingle);
        }
        return new Paralist_ASTnode(new position(ctx.getStart()), paralist);
    }

    @Override
    public ASTnode visitSuite(MxParser.SuiteContext ctx) {
        LinkedList<Stat_ASTnode> stats = new LinkedList<>();
        for (int i = 0; i < ctx.statement().size(); i++) {
            if (ctx.statement().get(i).getText().equals(";"))continue;;

            stats.add((Stat_ASTnode) visit(ctx.statement().get(i)));
        }
        return new Suite_ASTnode(new position(ctx.getStart()), stats);
    }

    @Override
    public ASTnode visitStat_suite(MxParser.Stat_suiteContext ctx) {
        return visit(ctx.suite());
    }

    @Override
    public ASTnode visitStat_vardeclar(MxParser.Stat_vardeclarContext ctx) {
        return visit(ctx.vardeclarstat());
    }

    @Override
    public ASTnode visitStat_break(MxParser.Stat_breakContext ctx) {
        return new Breakstat_ASTnode(new position(ctx.getStart()));
    }

    @Override
    public ASTnode visitStat_continue(MxParser.Stat_continueContext ctx) {
        return new Continuestat_ASTnode(new position(ctx.getStart()));
    }

    @Override
    public ASTnode visitStat_return(MxParser.Stat_returnContext ctx) {
        Expr_ASTnode returnexpr = null;
        if (ctx.expression() != null) {
            returnexpr = (Expr_ASTnode) visit(ctx.expression());
        }
        if (returnexpr == null) {
            return new Returnstat_ASTnode(new position(ctx.getStart()), true, null);
        } else {
            return new Returnstat_ASTnode(new position(ctx.getStart()), false, returnexpr);
        }
    }

    @Override
    public ASTnode visitStat_expr(MxParser.Stat_exprContext ctx) {
        Expr_ASTnode expr = (Expr_ASTnode) visit(ctx.expression());
        return new Exprstat_ASTnode(new position(ctx.getStart()), expr);

    }

    @Override
    public ASTnode visitStat_if(MxParser.Stat_ifContext ctx) {
        Expr_ASTnode condition = (Expr_ASTnode) visit(ctx.codition);
        Stat_ASTnode thentat = (Stat_ASTnode) visit(ctx.thenstat);
        Stat_ASTnode elsestat = (ctx.elsestat == null ? null : (Stat_ASTnode) visit(ctx.elsestat));
        return new Ifstat_ASTnode(new position(ctx.getStart()), condition, thentat, elsestat);
    }

    @Override
    public ASTnode visitStat_while(MxParser.Stat_whileContext ctx) {
        Expr_ASTnode condition = (Expr_ASTnode) visit(ctx.codition);
        Stat_ASTnode whilestat = (Stat_ASTnode) visit(ctx.whilestat);
        return new Whilestat_ASTnode(new position(ctx.getStart()), condition, whilestat);
    }

    @Override
    public ASTnode visitStat_for(MxParser.Stat_forContext ctx) {
        Valdeclstat_ASTnode initvardel = (ctx.initvar == null ? null : (Valdeclstat_ASTnode) visit(ctx.initvar));
        Expr_ASTnode innitexpr = (ctx.initexpr == null ? null : (Expr_ASTnode) visit(ctx.initexpr));
        Expr_ASTnode condition = (ctx.codition == null ? null : (Expr_ASTnode) visit(ctx.codition));
        Expr_ASTnode incr = (ctx.incr == null ? null : (Expr_ASTnode) visit(ctx.incr));
        Stat_ASTnode forstat = (Stat_ASTnode) visit(ctx.forstat);
        return new Forstat_ASTnode(new position(ctx.getStart()), innitexpr, initvardel, condition, incr, forstat);
    }

    @Override
    public ASTnode visitConstructdeclar(MxParser.ConstructdeclarContext ctx) {
        String classname = ctx.Identifier().getText();
        Paralist_ASTnode constructparalist = ctx.parameterlist() == null ? null : (Paralist_ASTnode) visit(ctx.parameterlist());
        Suite_ASTnode suite = (Suite_ASTnode) visit(ctx.suite());
        return new Constructdecl_ASTnode(new position(ctx.getStart()), classname, constructparalist, suite);
    }

    @Override
    public ASTnode visitFundeclar(MxParser.FundeclarContext ctx) {
        boolean isvoid = ctx.Void() == null;
        Type_ASTnode type = ctx.type() == null ? new Voidtype_ASTnode(new position(ctx.getStart()), "void") : (Type_ASTnode) visit(ctx.type());
        String functionname = ctx.Identifier().getText();
        Paralist_ASTnode funcparalist = ctx.parameterlist() == null ? null : (Paralist_ASTnode) visit(ctx.parameterlist());
        Suite_ASTnode suite = (Suite_ASTnode) visit(ctx.suite());
        return new Fundecl_ASTnode(new position(ctx.getStart()), type, functionname, funcparalist, suite, isvoid);
    }

    @Override
    public ASTnode visitClassdef(MxParser.ClassdefContext ctx) {
        String classname = ctx.calssname.getText();
        LinkedList<Constructdecl_ASTnode> constructlist = new LinkedList<>();
        LinkedList<Fundecl_ASTnode> funlist = new LinkedList<>();
        LinkedList<Valdeclstat_ASTnode> valdecl = new LinkedList<>();
        for (int i = 0; i < ctx.constructdeclar().size(); i++) {
            constructlist.add((Constructdecl_ASTnode) visit(ctx.constructdeclar(i)));
        }
        for (int i = 0; i < ctx.fundeclar().size(); i++) {
            funlist.add((Fundecl_ASTnode) visit(ctx.fundeclar(i)));
        }
        for (int i = 0; i < ctx.vardeclarstat().size(); i++) {
            valdecl.add((Valdeclstat_ASTnode) visit(ctx.vardeclarstat(i)));
        }
        return new Classdecl_ASTnode(new position(ctx.getStart()), classname, funlist, valdecl, constructlist);
    }

    @Override
    public ASTnode visitProgramunit_class(MxParser.Programunit_classContext ctx) {
        return visit(ctx.classdef());
    }

    @Override
    public ASTnode visitProgramunit_fun(MxParser.Programunit_funContext ctx) {
        return visit(ctx.fundeclar());
    }

    @Override
    public ASTnode visitProgramunit_vardeclar(MxParser.Programunit_vardeclarContext ctx) {
        return visit(ctx.vardeclarstat());
    }

    @Override
    public ASTnode visitProgram(MxParser.ProgramContext ctx) {
        Rootnode programroot = new Rootnode(new position(ctx.getStart()));
        for (int i = 0; i < ctx.programunit().size(); i++) {
            programroot.list.add(visit(ctx.programunit(i)));
        }
        return programroot;
    }
}
