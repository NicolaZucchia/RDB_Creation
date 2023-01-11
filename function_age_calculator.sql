create function age_Calculator (dataNascita datetime)
returns int
not deterministic
begin
    declare anni int(3);
    set anni = year(curdate()) - year(dataNascita);
    if (month(curdate()) < month(dataNascita)) then return (anni – 1);
    elseif (month(curdate()) = month(dataNascita)) then
        if (day(curdate()) < day(dataNascita)) then return (anni – 1);
        end if;
    else return anni;
    end if;
end;
