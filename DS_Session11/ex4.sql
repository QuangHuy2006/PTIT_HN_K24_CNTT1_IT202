USE social_network_pro;
delimiter $$
-- create procedure
create procedure calculateBonusPoints (in p_user_id int, inout p_bonus_points int)
begin
	declare total_post int;
	select count(*) into total_post from posts where user_id = p_user_id;
    if total_post >= 20 then set p_bonus_points = p_bonus_points + 100;
    elseif total_post >= 10 then set p_bonus_points = p_bonus_points + 50;
    end if;
end $$
-- call procedure
set @kq = 0;
call calculateBonusPoints(1, @kq);
select @kq
delimiter ;
