<%@ page language="java"  pageEncoding="utf-8"%>
<%//Use of PersonBean in a JSP. %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--���������JSP��ͨ��useBean������ǩ����һ��idΪperson,Java��ΪPersonBean��Beanʵ��-->
<jsp:useBean id="person" class="beans.PersonBean" scope="page"/>
<!--��һ�д������ñ�beanTest���û������ֵΪperson��������ֵ -->
<jsp:setProperty name="person" property="*"/>
<html>
  <head>
    <title>useBean����ʾ��</title>	
  </head>
  <body>
   Name:<jsp:getProperty name="person" property="name"/> <br>
   <!--��ȡperson������name������ֵ -->
   Deceased?<jsp:getProperty name="person" property="deceased"/><br>
   <!--��ȡperson������deceased������ֵ -->
   <!-- ���洴���ı�beanTest���û�������Ϣ��Ϊ��Ϊperson��JavaBean �ṩ����ֵ -->
   <form name="beanTest" method="post" action="testPersonBean.jsp">
   Enter a name:<input type="text" name="name" size="50"><br>
   Choose an option:
   <select name="deceased">
   <option value="false">Alive</option>
   <option value="true">Dead</option>
   </select>
   <input type="submit" value="Test the Bean">
   </form>
  </body>
</html>
