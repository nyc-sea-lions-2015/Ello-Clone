get '/users' do
	@users = User.all
	erb :'users/all'
end

get '/users/:id' do
	@user = User.find_by(:id => params[:id])
	@posts=@user.posts
	erb :'users/show'
end

get '/users/:id/edit' do
	@user = User.find_by(:id => params[:id])
	@posts=@user.posts
	erb :'users/edit'
end

get '/users/home/:id' do
	@user = User.find_by(:id => params[:id])
	erb :'users/index'
end




put '/users/:id' do
	@user = User.find_by(:id => params[:id])
	
	if @user
		@user.user_name = params[:user_name]
		@user.email = params[:email]
		@user.bio = params[:bio]
		@user.header_image = params[:header_image]
		@user.avatar = params[:avatar]

		if @user.save
			redirect "/users/#{params[:id]}"
		else
			[500, 'something went wrong']
		end
	else
		[404, 'that user does not exist']
	end
end

delete '/users/:id/delete' do
	@user= Post.find_by(:id => params[:id])
	@user.destroy
	session[:user_id] = nil
	redirect '/'
end