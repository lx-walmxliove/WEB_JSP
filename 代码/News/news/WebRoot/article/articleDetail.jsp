<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312" import="bean.article.*,java.util.*,bean.comment.*"%>
    <%
		String id=request.getParameter("id");
		int Articleid=Integer.parseInt(id);
		Article article=ArticleDAOImp.findArticleById(Articleid);
		%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String basepath1=basePath+"images/mispuppy.jpg";//logoͼƬ·��
String basepath2=basePath+"css/hyperlink.css";//header css��
//����7��Ϊ�˵�����
String basepath3=basePath+"index.jsp";
String basepath4=basePath+"Item.jsp?id=16";
String basepath5=basePath+"Item.jsp?id=17";
String basepath6=basePath+"Item.jsp?id=18";
String basepath7=basePath+"Item.jsp?id=19";
String basepath8=basePath+"Item.jsp?id=20";
String basepath9=basePath+"Item.jsp?id=21";
//����Ϊ���۹�������
String basepathcmt=basePath+"article/cmtBoard.jsp?id="+id;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>Insert title here</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
        <LINK 
rel=stylesheet type=text/css href="<%=basepath2%>"></LINK>
        
        
        
		<style type="text/css">
#pre_content {
	width: 90%;
	margin-left: auto;
	padding: 2px;
	border-left: 1px solid green;
	background-color: #FFF;
	margin-top: 5px;
	margin-right: auto;
	text-align: justify;
}
        #content {
	width: 950px;
	margin-right: auto;
	margin-left: auto;
	background-color: #FFF;
	margin-top: 5px;
}
        </style>
	</head>
	<body>
		
        <DIV style="WIDTH: 950px" id=tabsJ class=shadow><IMG 
      style="MARGIN-LEFT: 0px" src="<%=basepath1%>" width=950> 
      <UL>
        <LI id=current><A 
        href="<%=basepath3%>"><SPAN>��ҳ</SPAN></A> 
        <LI><A 
        href="<%=basepath4%>"><SPAN>Java</SPAN></A> 

        <LI><A 
        href="<%=basepath6%>"><SPAN>���ݿ�</SPAN></A> 

        <LI><A 
        href="<%=basepath5%>"><SPAN>.Net</SPAN></A> 

        <LI><A 
        href="<%=basepath7%>"><SPAN>�Ƽ���</SPAN></A> 

        <LI><A 
        href="<%=basepath8%>"><SPAN>����Ա</SPAN></A> 

        <LI><A 
        href="<%=basepath9%>"><SPAN>web����</SPAN></A> 

        <LI><A 
        href="<%=basepath3%>"><SPAN>����Ա�б�</SPAN></A> 

        <LI><A 
        href="<%=basepath3%>"><SPAN>��ϵ����</SPAN></A> 
        </LI></UL></DIV>
<div id="content">
		<div id="pre_content">
			<div>
				<h3 align="center"><%=article.getArtitle()%></h3>
				���ߣ�<%=article.getArtauthor()%>&nbsp;&nbsp;&nbsp;&nbsp;���ڣ�<%=article.getArtupdateTime() %>&nbsp;&nbsp;&nbsp;&nbsp;�鿴����:<%=article.getViewnum() %>
				<hr color="#66CCFF"/>
                <DL>
          <DD>
                <div>
				<%=article.getContent() %>
                </div>
                </DD>
                </DL>
			</div>
			<hr color="#66CCFF"/>
		<a href="<%=basepathcmt%>">��Ҫ����</a>
		</div>
  </div>
        <TABLE align="center">
        <TBODY>
        <TR>
          <TD>������Ϣϵͳ(MIS)����ʵ����</TD></TR></TBODY></TABLE>
	</body>
</html>