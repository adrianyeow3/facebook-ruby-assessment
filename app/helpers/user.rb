helpers do
	def current_user
		if session[:user_id]
			if @current_user
				@current_user
			else
				@current_user = User.find_by_id(session[:user_id])
			end
			# @current_user ||= User.find_by_id(session[:user_id])
		end
	end

	def logged_in?
		!current_user.nil?
	end

end