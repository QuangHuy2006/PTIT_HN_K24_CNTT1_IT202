USE social_network_pro;
delimiter $$
create procedure CalculateUserActivityScore(p_user_id int, out activity_score int, out activity_level varchar(50))
begin
	declare total_like int;
    declare total_comment int;
    declare total_post int;
    select count(user_id) into total_like from likes where user_id = p_user_id;
    select count(user_id) into total_comment from comments where user_id = p_user_id;
    select count(user_id) into total_post from posts where user_id = p_user_id;
    set activity_score = total_like * 3 + total_comment * 5 + total_post * 10;
    if activity_score > 500 then set activity_level = 'Rất tích cực';
    elseif activity_score between 200 and 500 then set activity_level = 'Tích cực';
    else set activity_level = 'Bình thường'; end if;
end $$
delimiter ;
call CalculateUserActivityScore(1,@diem, @mucdo);
select @diem as mark, @mucdo as level;