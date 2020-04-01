import com.alibaba.fastjson.JSON;
import org.apache.commons.codec.binary.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class Demo2 extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		this.doGet(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		resp.setCharacterEncoding("utf-8");
		String borrowid = req.getParameter("borrowid");
		String info = null;
		byte[] output = null;
		String key = "A91DBAB64154FE7A640E89E0089F0A1E";
		Map<String, String> map = new HashMap<>();

		// if (borrowid != null && borrowid.equals("")) {
		try {
			SecretKeySpec skey = new SecretKeySpec(key.getBytes(), "AES");
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");// 算法/模式/补码方式
			cipher.init(Cipher.ENCRYPT_MODE, skey);
			output = cipher.doFinal(borrowid.getBytes());
		} catch (Exception var5) {
			var5.printStackTrace();
		}
		info = Base64.encodeBase64String(output);
		System.out.println(info);
		// }
		map.put("info", info);

		PrintWriter writer = resp.getWriter();
		writer.print(JSON.toJSON(map));
		writer.flush();
		writer.close();
	}

}
