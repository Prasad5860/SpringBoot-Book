package com.example.rest.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.rest.model.Book;
import com.example.rest.model.User;

class BookMapper implements RowMapper<Book> {
	public Book mapRow(ResultSet rs, int row) throws SQLException {
		Book book = new Book();
		book.setId(rs.getLong("id"));
		book.setName(rs.getString("name"));
		book.setPublisher(rs.getString("publisher"));
		book.setType(rs.getString("type"));
		// Explicitly handle LocalDate conversion
		book.setDate(rs.getDate("date").toLocalDate());
		return book;

	}
}

@Repository
public class AppRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public boolean check(User user) {
		String sql = "SELECT password FROM usersTb_203 WHERE username = ?";
		try {
			String storedPassword = jdbcTemplate.queryForObject(sql, new Object[] { user.getUsername() }, String.class);
			return storedPassword != null && storedPassword.equals(user.getPassword());
		} catch (Exception e) {
			// Handle exception (e.g., user not found)
			return false;
		}
	}

	public List<Book> getAllBooks() {
		String sql = "select * from Book_203";
		return jdbcTemplate.query(sql, new BookMapper());
	}

	public Book getbyId(Long id) {
		String sql = "select * from Book_203 where id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new BookMapper());
	}

	public void update(Book book) {
		String sql = "UPDATE Book_203 SET name = ?, publisher = ?, type = ?, date = ? WHERE id = ?";
		jdbcTemplate.update(sql, book.getName(), book.getPublisher(), book.getType(), book.getDate(), book.getId());
	}

	public void delete(Long id) {
		String sql = "delete from Book_203 where id = ?";
		jdbcTemplate.update(sql, id);
	}

	public void insert(Book book) {
		String sql = "INSERT INTO Book_203 (name, publisher, type, date) VALUES (?, ?, ?, ?)";
		jdbcTemplate.update(sql, book.getName(), book.getPublisher(), book.getType(), book.getDate());
	}

}
