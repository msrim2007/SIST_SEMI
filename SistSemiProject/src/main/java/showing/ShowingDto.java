package showing;

import java.sql.Timestamp;

import lombok.Getter;

import lombok.Setter;

@Setter
@Getter
public class ShowingDto {
	private String show_num, movie_num;
	private Timestamp showing_date;
}
