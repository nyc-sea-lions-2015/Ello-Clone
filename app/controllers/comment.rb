get '/posts/:id/comments/new' do
	@post = Post.find_by(:id => params[:id])
	erb :"comments/new", layout: !request.xhr?
end

post '/posts/:id/comments/new' do
	@post = Post.find_by(:id => params[:id])
	@comment =  Comment.new( content: params[:content],
                             user_id: session[:user_id],
                             post_id: @post.id) 

	if @comment.save
		if request.xhr?
			erb :_new_comment, layout: false, locals: {comment: @comment}
		else 
			redirect "/posts/#{params[:id]}/comments"
		end
	else
		[404, 'This comment could not be created']
	end
end
