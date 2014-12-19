require 'sinatra'
require 'sinatra/contrib'
require 'csv'
require 'pry'

def can
  can_array = ["can", "can't"]
  can_array.shuffle!
  can_array[0]
end

def subject
  subject_array = ["I", "we"]
  subject_array.shuffle!
  subject_array[0]
end

def verb(file)
  verb_list = CSV.read(file)
  verb_list.shuffle!
  @verb = verb_list[0].join
  @second_verb = verb_list[1].join
end

def phrase(file)
  phrase_list = CSV.read(file)
  phrase_list.shuffle!
  @phrase = phrase_list[0].join
  @second_phrase = phrase_list[1].join
end

def verb_phrase(file)
  verb_phrase = CSV.read(file)
  verb_phrase.shuffle!
  @example1 = verb_phrase[0].join
  @example2 = verb_phrase[1].join
end

def print_sentence(sentence)
  new_array = []
  new_array << sentence
  new_array << 0
  CSV.open("selected_sentences.csv", "a") do |csv|
    csv << new_array
  end
end


get '/' do

  erb :index
end

post '/' do

  print_sentence(params)

  redirect '/'

end

get '/industry' do

verb("work.csv")
phrase("work_phrases.csv")

  @sentence = "As a user, I want to #{@verb} #{@phrase} so that #{subject} #{can} #{@second_verb} #{@second_phrase}"


  erb :industry
end

get '/for_fun' do

verb("huge_list_verbs.csv")
phrase("huge_list_nouns.csv")

@sentence = "As a user, I want to #{@verb} #{@phrase} so that #{subject} #{can} #{@second_verb} #{@second_phrase}"

  erb :for_fun
end

get '/pop_song' do

  verb_phrase("songs.csv")

  @sentence = "As a user, I want to #{@example1} so that #{subject} #{can} #{@example2}"

  print_sentence(@sentence)

binding.pry

  erb :pop_song
end


get '/launch' do

  verb_phrase("launch.csv")

  @sentence = "As a user, I want to #{@example1} so that #{subject} #{can} #{@example2}"

erb :launch
end
