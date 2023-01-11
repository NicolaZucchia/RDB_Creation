delimiter $$
create trigger trg_beforeUpdateVM14 before insert on visione
    for each row
    begin
        declare eta int(3);
        declare genereFilm varchar(15);
        select genere into genereFilm from film;
        set eta = age_Calculator(new.dataNascita);
        if (eta < 14) then
            if (genereFilm = "horror" or genereFilm = "erotico") then
                signal sqlstate '45001' set message_text = "VM14";
            end if;
        end if;
    end $$
delimiter ;
