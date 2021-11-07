package seat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SeatDto {
	private String seat_id, theater_num, show_num;
	private boolean chk_seat;
}
