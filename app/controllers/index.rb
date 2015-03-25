enable :sessions



get '/' do
  # Look in app/views/index.erb
  redirect to "/login"
end

get '/login' do
	erb :index
end

post '/login' do
	#authenticate
 @user = User.authenticate(params[:user][:email], params[:user][:password])	
 if @user
 	session[:user_id] = @user.id
 	redirect '/secretpage'
 else
 	@errors = ["Authentication failed. Try again"]
 	erb :index
 end
end

get '/secretpage' do
	if session[:user_id]
		erb :secretpage
	else
		@errors = ["You must be logged in to view your secret page. Please login"]
		erb :index
	end
end

get '/signup' do
	erb :signup
end

post '/signup' do
	u = User.find_by(email: params[:user][:email])
	if u.nil?
		@user = User.create(params[:user])
		redirect to '/login'
	else
		@errors = ["Email is already in the system. Try another email"]
		# @errors = @user.errors.full_messages
		erb :signup
	end
end

get '/logout' do
	session.clear
	redirect to '/'
end