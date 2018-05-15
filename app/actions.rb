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

get '/logout' do
  session[:user_id] = nil
end

post '/login' do
  user_name = params[:username]
  password = params[:password]

  user = User.find_by(username: user_name)

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
  session.to_s

end

before '/private' do
  halt(401, erb(:error_401)) unless current_user
end

get '/private' do
  erb(:private)
end
