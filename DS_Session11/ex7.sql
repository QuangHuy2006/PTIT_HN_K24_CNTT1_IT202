USE social_network_pro;
delimiter $$
create procedure createPostAndNotify(p_user_id int, p_content varchar(50))
begin 
	declare message varchar(50);
    declare u_full_name varchar(50);
    declare u_friend_id int;
    declare cur_friend cursor for
    select friend_id
    from friends
    where user_id = p_user_id and status = 'accepted';
    select full_name into u_full_name from users where user_id = p_user_id;
	insert into posts(user_id, content) values
    (p_user_id, p_content);
    open cur_friend;
    read_loop: loop
    fetch cur_friend into u_friend_id;
    leave read_loop;
    if u_friend_id <> p_user_id then
    insert into notifications(user_id, type, content) values
    (u_friend_id,'new_post', concat((select full_name from users where user_id = p_user_id),' đã đăng bài viết mới'));
    end if;
    end loop;
    close cur_friend;
end $$

delimiter ;
call createPostAndNotify(1, 'quang yêu tươi');
select * from notifications