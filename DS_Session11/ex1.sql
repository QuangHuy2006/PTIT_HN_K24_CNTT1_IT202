USE social_network_pro;
delimiter $$
-- create procedure
create procedure getUserPost (in p_user_id int)
begin
	select post_id, content, created_at
    from posts p
    where p.user_id = p_user_id;
end $$
delimiter ;
-- call procedure
call getUserPost(1);