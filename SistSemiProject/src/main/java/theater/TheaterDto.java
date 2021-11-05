package theater;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class TheaterDto {
	private String theater_num, seat_num;
	private boolean chk_seat;
}
