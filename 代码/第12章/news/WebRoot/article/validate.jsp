<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="java.awt.*" %>
<%@ page import="java.awt.image.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.imageio.*" %>
<%!
 Color getRandColor(int fc,int bc){
  Random r = new Random();
  if(fc > 255)
   fc = 255;
  if(bc > 255)
   bc = 255;
  int red = fc + r.nextInt(bc - fc);
  int green = fc + r.nextInt(bc - fc);
  int blue = fc + r.nextInt(bc - fc);
  return new Color(red,green,blue);
 }
%>

<%
 //����ҳ�治����
 response.setHeader("Pragma", "No-cache");
 response.setHeader("Cache-Control", "no-cache");
 response.setDateHeader("Expires", 0);
//���濪ʼ��--����ͼ��
 Random r = new Random();
 int width = 60,height = 20;
 BufferedImage pic = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
 Graphics gc = pic.getGraphics();
 gc.setColor(getRandColor(200,250));
 gc.fillRect(0, 0, width, height);
 gc.setFont(new Font("Times New Roman",Font.PLAIN,18));
 
 gc.setColor(getRandColor(160,200));
 for(int i=0;i<200;i++){
  int x1 = r.nextInt(width);
  int y1 = r.nextInt(height);
  int x2 = r.nextInt(15);
  int y2 = r.nextInt(15);
  gc.drawLine(x1, y1, x2, y2);
 }
 
 gc.setColor(getRandColor(120,240));
 for(int i=0;i<100;i++){
  int x = r.nextInt(width);
  int y = r.nextInt(height);
  gc.drawOval(x, y, 0,0);
 }
 
 String rs="";
 String rn="";
  for(int i = 0;i<4;i++){
   rn = String.valueOf(r.nextInt(10));
   rs += rn;
   gc.setColor(new Color(20+r.nextInt(110),20+r.nextInt(110),20+r.nextInt(110)));
   gc.drawString(rn,13*i+6,16);
  }
 
 gc.dispose();
 try{
 session.setAttribute("code", rs);//����session������codeΪ���ɵ���֤�루String���ͣ���JSP��һ�㿿session�������ݲ���ò���
 }catch(Throwable t){
  getServletContext().log(t.getMessage());//������дlog����Ҫץ�쳣
 }
 ImageIO.write(pic,"JPEG",response.getOutputStream());//���ͼƬ��һҳ�棬������
 out.clear();//����һ��Ҫ�ر�������Ϊ������ҳ����г�ͻ
 out = pageContext.popBody();
%>