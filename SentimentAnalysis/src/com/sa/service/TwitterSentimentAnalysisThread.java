package com.sa.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import com.sa.dao.TweetsDAO;
import com.sa.daoimpl.TweetsDAOImpl;
import com.sa.model.Tweets;
import com.sa.util.Constants;

public class TwitterSentimentAnalysisThread implements Runnable {

	Thread t;
	String filename;
	String dir;
	String tweet;
	String email;
	TweetsDAO tDao;
	public TwitterSentimentAnalysisThread(String email, String tweet) {
		this.filename = Constants.FILENAME;
		this.email = email;
		tDao = new TweetsDAOImpl();		
		this.dir = Constants.DIRECTORY;
		this.tweet = tweet;
		t = new Thread(this);
		t.start();
	}

	@Override
	public void run() {
		try {
			String output = runScript();
			String lines[] = output.split("\n");
			float neg = Float.valueOf(lines[0]);
			float pos = Float.valueOf(lines[1]);
			System.out.println("Positve: " + pos + ", Negative: " + neg );
			Tweets twt = new Tweets();
			twt.setEmail(email);
			twt.setPos(String.valueOf(pos));
			twt.setNeg(String.valueOf(neg));
			twt.setTweet(tweet);
			tDao.write(twt);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(filename + " .. thrown Exception");
		}
	}

	public String runScript() throws Exception {
		List<String> command = new ArrayList<String>();
		command.add("python3");
		command.add(filename);
		command.add("\"" + tweet + "\"");
		ProcessBuilder builder = new ProcessBuilder(command);
		builder.directory(new File(dir));
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
