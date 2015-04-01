get '/auth/login' do
	erb :'auth/login'
end

post '/auth/login' do
	@user = User.find_by(email: params[:email])
	p params[:email]
	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect '/'
	else
		set_error("Login failed")
		redirect '/login'
	end
end

get '/auth/signup' do
	erb :'auth/signup'
end

post '/auth/signup' do
	@user = User.new(
						user_name: params[:user_name],
						email: params[:email],
						password: params[:password])

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