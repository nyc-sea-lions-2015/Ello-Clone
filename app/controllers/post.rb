get '/posts/:id/comments' do
	@post = Post.find_by(:id => params[:id])
	@comments = @post.comments
	erb :'posts/show'
end

get '/users/:id/posts/:id' do
	@user=User.find_by(:id => params[:id])
	@post = Post.find_by(:id => params[:id])
	@comments = @post.comments
	p @post
	erb :'posts/show'
end

get '/users/home/:id/posts/new' do
	@user = User.find_by(:id => params[:id])

	erb :'posts/new', layout: !request.xhr?
end

post '/users/home/:id/posts/new' do
	@user = User.find_by(:id => params[:id])
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