package repositories;

import entities.Ticket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Rustem.
 */
@Repository
public interface TicketRepository  extends JpaRepository<Ticket, Long> {
    Ticket findById(int id);

    void deleteTicketById(int id);
}
