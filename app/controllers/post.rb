get '/posts/:id/comments' do
	@post = Post.find_by(:id => params[:id])
	@comments = @post.comments
	erb :'posts/show'
end

get '/users/:id/posts' do
	@user=User.find_by(:id => params[:id])
	@posts=@user.posts
end

get '/users/home/:id/posts/new' do
	@user = User.find_by(:id => params[:id])
	erb :'posts/new'
end

post '/users/home/:id/posts/new' do
	@user = User.find_by(:id => params[:id])
	@post = Post.new(picture: params[:picture],
					content: params[:content],
					user_id: session[:user_id])
	@comments = @post.comments


	if @post.save 
		redirect "/posts/#{params.id}/comments"
		else
		[404, 'This comment could not be created']
	end
end

delete '/posts/:id/comments'
	@post=Post.find_by(:id => params[:id])
	@post.destroy
end