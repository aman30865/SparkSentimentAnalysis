package com.sa.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sa.dao.TweetsDAO;
import com.sa.model.Tweets;
import com.sa.util.DBConnection;

public class TweetsDAOImpl implements TweetsDAO {

	@Override
	public void write(Tweets model) throws Exception {
		Connection con = null;
		try {
			con = DBConnection.connect();
			con.createStatement().execute(
					"delete from tweets where email in (select email from tweets group by email having count(email) > 100)");

			PreparedStatement ps = con.prepareStatement("insert into tweets values (?,?,?,?)");
			ps.setString(1, model.getEmail());
			ps.setString(2, model.getTweet());
			ps.setString(3, model.getPos());
			ps.setString(4, model.getNeg());
			ps.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
	}

	@Override
	public List<Tweets> readPositive(String email) throws Exception {
		Connection con = null;
		List<Tweets> result = new ArrayList<>();
		try {
			con = DBConnection.connect();
			ResultSet rs = con.createStatement().executeQuery("select * from tweets where email='" + email + "' and pos >= neg");
			while (rs.next()) {
				Tweets t = new Tweets();
				t.setEmail(rs.getString("email"));
				t.setTweet(rs.getString("tweet"));
				t.setPos(rs.getString("pos"));
				t.setNeg(rs.getString("neg"));
				result.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return result;
	}

	@Override
	public List<Tweets> readNegative(String email) throws Exception {
		Connection con = null;
		List<Tweets> result = new ArrayList<>();
		try {
			con = DBConnection.connect();
			ResultSet rs = con.createStatement().executeQuery("select * from tweets where email='" + email + "' and pos < neg");
			while (rs.next()) {
				Tweets t = new Tweets();
				t.setEmail(rs.getString("email"));
				t.setTweet(rs.getString("tweet"));
				t.setPos(rs.getString("pos"));
				t.setNeg(rs.getString("neg"));
				result.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return result;
	}

	
	@Override
	public int getPositiveCount(String email) throws Exception {
		Connection con = null;

		try {
			con = DBConnection.connect();
			ResultSet rs = con.createStatement()
					.executeQuery("select count(*) from tweets where email='" + email + "' and pos >= neg");
			return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			con.close();
		}
	}

	@Override
	public int getNegativeCount(String email) throws Exception {
		Connection con = null;

		try {
			con = DBConnection.connect();
			ResultSet rs = con.createStatement()
					.executeQuery("select count(*) from tweets where email='" + email + "' and pos < neg");
			return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			con.close();
		}
	}

}
