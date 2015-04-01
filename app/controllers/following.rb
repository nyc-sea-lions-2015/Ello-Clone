get '/followings/:id/followers' do
	@user = User.find_by(:id => params[:id])
	@followers = @user.followers
	erb :'user/followings'
end

get '/followings/:id/followings' do
	@user = User.find_by(:id => params[:id])
	@followings = @user.followings
end

put '/followings/:id' do
	@user_followings = User.find_by(:id => params[:id]).followings

	if params[:user_name] = ""
		[404, "Sorry something went wrong"]
	else
		@user_followings << User.find_by(:user_name => [:user_name])
		redirect back
	end
end
