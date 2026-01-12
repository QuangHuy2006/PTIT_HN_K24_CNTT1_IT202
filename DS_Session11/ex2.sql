USE social_network_pro;
delimiter $$
-- create procedure
create procedure calculatePostLikes (in p_post_id int, out total_likes int)
begin
	select count(distinct user_id)
    into total_likes
    from likes
    where post_id = p_post_id;
end $$
delimiter ;
-- truyền biến vào
call calculatePostLikes(101, @kq);
select @kq;