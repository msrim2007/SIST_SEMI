package reserve;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import mysql.db.DbConnect;

public class ReserveDao {
	DbConnect db = new DbConnect();
	
	public void insertReserve(ReserveDto dto) {
		String sql = "INSERT INTO reserve(user_num, show_num, theater_num, seat_id) ";
		sql += "VALUES('" + dto.getUser_num() + "', '" + dto.getShow_num() + "', '" + dto.getTheater_num() + "', '" + dto.getSeat_id() + "')";
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			stmt.execute(sql);
			setSeatCheck(dto.getSeat_id(), dto.getTheater_num());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(stmt, conn);
		}
	}
	
	public void setSeatCheck(String seat_id, String theater_num) {
		String sql = "UPDATE seat SET chk_seat=false WHERE (theater_num='" + theater_num + "') AND (";
		if (seat_id.contains(":")) {
			String[] seat_ids = seat_id.split(":");
			for (String i : seat_ids) {
				sql += "seat_id='" + i + "' OR ";
			}
			sql = sql.substring(0, sql.length() - 4) + ")";
		} else {
			sql += "seat_id='" + seat_id + "')";
		}
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			stmt.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(stmt, conn);
		}
	}
}
