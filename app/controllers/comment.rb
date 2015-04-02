get '/posts/:id/comments/new' do
	# Better is to do:
	# This allows the controller to catch the error if the id doesnt exist
	# Harder to catch this in the view when you are calling nil.id or something
	@post = Post.find(params[:id])
	#@post = Post.find_by(:id => params[:id])
	erb :"comments/new", layout: !request.xhr? # I like this!
end

post '/posts/:id/comments/new' do
	@post = Post.find_by(:id => params[:id])
	# this is more concise - use the AR association to build the appropriate objects
	# Also conveys the meaning a little better - not passing around IDS as much
	@post.comments.build(content: params[:content], user_id: session[:user_iparamsd])

	#@comment =  Comment.new( content: params[:content],
                             #user_id: session[:user_id],
                             #post_id: @post.id)
#
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
