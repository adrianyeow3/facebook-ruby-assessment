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

post '/comment' do
	@posts = current_user.posts.new(my_post: params[:user][:comment])
	if @posts.save
		redirect "/users/#{current_user.id}"
	else
		redirect "/users/#{current_user.id}"
	end
end

