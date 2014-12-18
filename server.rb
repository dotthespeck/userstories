require 'sinatra'
require 'sinatra/contrib'
require 'csv'
require 'pry'

get '/' do

  erb :index
end

get '/industry' do

  verb_list = CSV.read("work.csv")
  verb_list.shuffle!
  @verb = verb_list[0].join
  @second_verb = verb_list[1].join

  phrase_list = CSV.read("work_phrases.csv")
  phrase_list.shuffle!
  @phrase = phrase_list[0].join
  @second_phrase = phrase_list[1].join

  erb :industry
end

get '/for_fun' do

  erb :for_fun
end

get '/pop_song' do

  songs = CSV.read("songs.csv")
  songs.shuffle!
  @lyrics = songs[0].join
  @more_lyrics = songs[1].join

  erb :pop_song
end
