require "sinatra"
require "sinatra/reloader"

# get("/") do
#   "
#   <h1>Welcome to your Sinatra App!</h1>
#   <p>Define some routes in app.rb</p>
#   "
# end

# app.rb
require 'sinatra'

# Helper method to determine outcome, using "We" phrasing
def rps_result(user_move, comp_move)
  if user_move == comp_move
    "We tied!"
  elsif (user_move == "rock" && comp_move == "scissors") ||
        (user_move == "paper" && comp_move == "rock") ||
        (user_move == "scissors" && comp_move == "paper")
    "We won!"
  else
    "We lost!"
  end
end

get '/' do
  erb :index
end

get '/rock' do
  @user_move = "rock"
  @comp_move = ["rock", "paper", "scissors"].sample
  @result    = rps_result(@user_move, @comp_move)
  erb :rock_move
end

get '/paper' do
  @user_move = "paper"
  @comp_move = ["rock", "paper", "scissors"].sample
  @result    = rps_result(@user_move, @comp_move)
  erb :paper_move
end

get '/scissors' do
  @user_move = "scissors"
  @comp_move = ["rock", "paper", "scissors"].sample
  @result    = rps_result(@user_move, @comp_move)
  erb :scissors_move
end

__END__

@@ layout
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Rock Paper Scissors</title>
  </head>
  <body>
    <%= yield %>
  </body>
</html>

@@ index
<h1>Welcome to Rock-Paper-Scissors!!</h1>
<ul>
  <li><a href="/rock">Play Rock</a></li>
  <li><a href="/paper">Play Paper</a></li>
  <li><a href="/scissors">Play Scissors</a></li>
</ul>

@@ rock_move
<h2>You chose <%= @user_move %></h2>
<h2>They played <%= @comp_move %></h2>
<p><%= @result %></p>

<ul>
  <li><a href="/">Rules</a></li>
  <li><a href="/rock">Play Rock</a></li>
  <li><a href="/paper">Play Paper</a></li>
  <li><a href="/scissors">Play Scissors</a></li>
</ul>

@@ paper_move
<h2>You chose <%= @user_move %></h2>
<h2>They played <%= @comp_move %></h2>
<p><%= @result %></p>

<ul>
  <li><a href="/">Rules</a></li>
  <li><a href="/rock">Play Rock</a></li>
  <li><a href="/paper">Play Paper</a></li>
  <li><a href="/scissors">Play Scissors</a></li>
</ul>

@@ scissors_move
<h2>You chose <%= @user_move %></h2>
<h2>They played <%= @comp_move %></h2>
<p><%= @result %></p>

<ul>
  <li><a href="/">Rules</a></li>
  <li><a href="/rock">Play Rock</a></li>
  <li><a href="/paper">Play Paper</a></li>
  <li><a href="/scissors">Play Scissors</a></li>
</ul>
