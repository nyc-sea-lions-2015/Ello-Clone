get '/auth/login' do
	erb :'auth/login'
end

post '/auth/login' do
	@user = User.find_by(email: params[:email])

	# Dont leave debug code lying around!
	# p params[:email]
	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect '/' # Good redirect from POST
	else
		set_error("Login failed") # This method doesnt exist!!!
		redirect '/login'
	end
end

get '/auth/signup' do
	erb :'auth/signup'
end

post '/auth/signup' do
	@user = User.new(params) # Just pass the params hash when the object attributes match the params

	if @user.save
		session[:user_id] = @user.id
		redirect '/'
	else
		set_error("signup failed")
		redirect '/signup'
	end
end

get '/auth/logout' do
	session[:user_id] = nil
	redirect '/'
end
