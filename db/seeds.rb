me = User.create({:email => 'mrbouzi', :user_name => 'mbouzi', :password => 'libery13'})
jen = User.create({:email => 'jrbouzi', :user_name => 'jbouzi', :password => 'libery12', :avatar =>('http://www.afcb.co.uk/images/common/bg_player_profile_default_big.png'), :header_image =>('http://blog.jimdo.com/wp-content/uploads/2014/01/tree-247122.jpg')})

Post.create({:image => ('http://blog.jimdo.com/wp-content/uploads/2014/01/tree-247122.jpg'), :user_id => 2 })

Following.create({:user_id => 2 , :follower_id => 1})