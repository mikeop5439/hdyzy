<%@ page import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*" pageEncoding="gbk"%>
<%@ page import="java.io.OutputStream"%>

<%--	����JPG��ʽ��ͼƬ��֤��	--%>

<%!Color getRandColor(int fc, int bc)	//�������ͼƬ��rgb��ֵ
	{
		Random random = new Random();
		if (fc > 255)
			fc = 255;

		if (bc > 255)
			bc = 255;

		int r = fc + random.nextInt(bc - fc);

		int g = fc + random.nextInt(bc - fc);

		int b = fc + random.nextInt(bc - fc);

		return new Color(r, g, b);
	}
%>

<%
	try
	{
		response.setHeader("Pragma", "No-cache");
		
		response.setHeader("Cache-Control", "no-cache");
		
		response.setDateHeader("Expires", 0);
		
		int width = 100, height = 40;
		/* int width = 60, height = 20; */
		
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		
		OutputStream os = response.getOutputStream();
		
		Graphics2D g = (Graphics2D)image.getGraphics();
		
		Random random = new Random();
		
		// ���û��ʵ���ɫ
		g.setColor(getRandColor(200, 250));
		
		// ��ͼ�����ɸ���ͼƬ
		g.fillRect(0, 0, width, height);
		
		//�������ʽ
		g.setFont(new Font("Times New Roman", Font.PLAIN, 23));
		
		g.setColor(getRandColor(160, 200));

		//����ͼ���ڲ��ĸ�������
		for (int i = 0; i < 155; i++)
		{
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(32);
			int yl = random.nextInt(32);
			
			//���Ƹ�������
			g.drawLine(x, y, x + xl, y + yl);
		}
		
		String sRand = "";

		//����4Ϊ����ġ��в�ɫֵ����֤��
		for (int i = 0; i < 4; i++)
		{
			//����һλ��֤���ֵ
			String rand = String.valueOf(random.nextInt(10));

			sRand += rand;
			
			// �����ȡ����30֮��ĽǶ�
			int jiaodu = random.nextInt(60) - 30;
			double hudu = jiaodu * Math.PI / 180;
			// ������
			g.rotate(hudu, 25 * i + 6, 29);
			
			g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
			
			//�����ɵ���֤��ֵ������ɫ���ã��ѽ��и���
			g.drawString(rand, 25 * i + 6, 29);
			
			g.rotate(-hudu, 25 * i + 6, 29);
		}
		
		session.setAttribute("yanzhengma_InSession", sRand);
		
		g.dispose();
		
		//����JPEG��ʽ��ͼƬ��֤��
		ImageIO.write(image, "JPEG", os);
		
		os.flush();
		os.close();
		
		os = null;
		
		// ������������������������������������
		response.flushBuffer();
		
		/*	����ؼ�����	*/
		out.clear();
		
		out = pageContext.pushBody();
	} 
	catch (IllegalStateException e)
	{
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
%>
