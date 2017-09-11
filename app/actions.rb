# Homepage (Root path)
mookie = {
  name: "Mookie",
  age: 1,
  breed: "Golden Doodle"
}
ruby = {
  name: "Ruby",
  age: 2,
  breed: "Cavalier Spaniel"
}

pets = [mookie, ruby]

helpers do

  def current_user
    User.find_by(id: session[:user_id])
  end
  
end

get '/' do
  erb :index
end

get '/names' do
  @pets = pets
  erb :names
end

get '/login' do
  erb :login
end

post '/login' do
  user_name = params[:username]
  # username = "kristin"
  password = params[:password]

  user = User.find_by(username: user_name)

  # if user && user.password == password
  #   "Hello #{user.username}"
  # else 
  #   "wrong login credentials"
  # end

  if user
    if user.password == password
      session[:user_id] = user.id
      "Hello #{user.username}"
    else 
      "wrong password"
    end
  else 
    "No user with that username"
  end

  #user = User.find_by(username: "kristin")
end

get '/logout' do
  session[:user_id] = nil
  erb(:index)
end

