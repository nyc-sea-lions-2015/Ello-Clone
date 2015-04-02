get '/posts/:id/comments' do
	@post = Post.include(:comments).find(params[:id])
	#@comments = @post.comments
	erb :'posts/show'
end

# This isnt going to work.  You are clobbering the :id param
#get '/users/:id/posts/:id' do
get '/users/:user_id/posts/:post_id' do
	@user = User.find(params[:user_id])
	@post = Post.find(params[:post_id])

	# Same here - use include()
	@comments = @post.comments
	#p @post Dont PPPPP
	erb :'posts/show'
end

get '/users/home/:id/posts/new' do
	# Use User.find();
	@user = User.find_by(:id => params[:id])

	erb :'posts/new', layout: !request.xhr?
end

post '/users/home/:id/posts/new' do
	@user = User.find_by(:id => params[:id])
	# Use @user.posts.build(params) or something along those lines
	@post = Post.new(image: params[:image],
					content: params[:content],
					user_id: session[:user_id])
	@comments = @post.comments


	if @post.save
		redirect "/users/home/#{params[:id]}"
	else
		[404, 'This comment could not be created']
	end

end

delete '/posts/:id/comments' do
	@post=Post.find_by(:id => params[:id])
	@post.destroy
	redirect back
end
