get '/' do
  erb :"static/index"
end

post '/signup' do
	user = User.new(params[:user])
	if user.save
		session[:user_id] = user.id 
		redirect "/users/#{user.id}"
	else
		erb :'/static/error'
	end
end

post '/login' do
	@user = User.find_by(email: params[:user][:email])
	if @user && @user.authenticate(params[:user][:password])
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		erb :'/static/error'
	end
end

post '/logout' do
	session[:user_id] = nil
	redirect '/'
end

get "/users/:user_id" do
	@user = User.find(params[:user_id])
	@posts = Post.all
	erb :'/static/profile'
end

post '/post' do
	@posts = current_user.posts.new(my_post: params[:user][:post])
	if @posts.save
		redirect "/users/#{current_user.id}"
	else
		redirect "/users/#{current_user.id}"
	end
end

post '/comment/:post_id' do
	post = Post.find(params[:post_id])
	@comment = post.comments.new(my_comment: params[:user][:comment])
	if @comment.save
		redirect "/users/#{current_user.id}"
	else
		redirect "/users/#{current_user.id}"
	end
end

post "/post/:post_id/destroy" do
# get '/users/:comment_id/edit'
	post = Post.find(params[:post_id])
	post.destroy
	redirect "/users/#{current_user.id}"
end
# end
post "/post/:post_id/edit" do
	post = Post.find(params[:post_id])
	post.update(my_post: params[:user][:post])
	redirect "/users/#{current_user.id}"
end

