package com.sa.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sa.util.Constants;

public class AdhocServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String text = req.getParameter("text");
		try {
			if(text.length() < 50)
			{
				resp.sendRedirect("adhoc.jsp?msg=Text must contains at least 50 characters");
				return;
			}
			String output = runScript(text);
			String lines[] = output.split("\n");
			float neg = Float.valueOf(lines[0]);
			float pos = Float.valueOf(lines[1]);

			resp.sendRedirect("adhoc.jsp?neg=" + neg + "&pos=" + pos);

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("adhoc.jsp?msg=Error: " + e.getMessage());
		}

	}

	public String runScript(String tweet) throws Exception {
		List<String> command = new ArrayList<String>();
		command.add("python3");
		command.add(Constants.FILENAME);
		command.add("\"" + tweet + "\"");
		ProcessBuilder builder = new ProcessBuilder(command);
		builder.directory(new File(Constants.DIRECTORY));
		System.out.println("Running command .. " + command);

		final Process process = builder.start();
		InputStream is = process.getInputStream();
		InputStreamReader isr = new InputStreamReader(is);
		BufferedReader br = new BufferedReader(isr);
		String line = "";
		String output = "";
		while ((line = br.readLine()) != null) {
			if (output.length() != 0)
				output += "\n";
			output += line;
		}
		return output;

	}

}
