delimiter $$
create trigger trg_CheckEntrateBeforeUpdate before update on visione
    for each row 
    begin 
        if (old.entrate > 0) then
            set new.entrate = old.entrate - 1;
        else signal sqlstate '45001' set message_text = "Abbonamento Scaduto";
        end if;
    end $$
delimiter ;
