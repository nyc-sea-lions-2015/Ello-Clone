get '/users/:id' do
	@user = User.find_by(:id => params[:id])
	@posts=@user.posts
	erb :'users/show'
end

get '/users/home/:id' do
	@user = User.find_by(:id => params[:id])
	p @user
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