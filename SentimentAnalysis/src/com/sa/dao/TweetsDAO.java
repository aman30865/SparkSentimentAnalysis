package com.sa.dao;

import java.util.List;

import com.sa.model.Tweets;

public interface TweetsDAO {

	public void write(Tweets model) throws Exception;

	public int getPositiveCount(String email) throws Exception;

	public int getNegativeCount(String email) throws Exception;

	public List<Tweets> readNegative(String email) throws Exception;

	public List<Tweets> readPositive(String email) throws Exception;
}
