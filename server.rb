require 'sinatra'
require 'sinatra/contrib'
require 'csv'
require 'pry'
require 'sinatra/reloader'

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

get '/' do
  @stories_votes = {}
  CSV.foreach("selected_sentences.csv", :headers => true) do |row|
    @stories_votes[row['Story']] = row['Upvotes'].to_i
  end
  @stories_votes = @stories_votes.sort_by { |stories, votes| votes }
  #@stories_votes.sort{|x,y| y[0] <=> x[0]}
  @stories_votes = Hash[*@stories_votes.flatten]
  erb :index
end

get '/industry' do
  @heading = "industry"
  verb("work.csv")
  phrase("work_phrases.csv")
  @sentence = "As a user, I want to #{@verb} #{@phrase} so that #{subject} #{can} #{@second_verb} #{@second_phrase}"
  erb :show
end

get '/for_fun' do
  @heading = "fun"
  verb("huge_list_verbs.csv")
  phrase("huge_list_nouns.csv")
  @sentence = "As a user, I want to #{@verb} #{@phrase} so that #{subject} #{can} #{@second_verb} #{@second_phrase}."
  erb :show
end

get '/pop_song' do
  @heading = "Pop Songs"
  verb_phrase("songs.csv")
  @sentence = "As a user, I want to #{@example1} so that #{subject} #{can} #{@example2}."
  erb :show
end

get '/launch' do
  @heading = "Launch"
  verb_phrase("launch.csv")
  @sentence = "As a user, I want to #{@example1} so that #{subject} #{can} #{@example2}."
  erb :show
end


post '/' do
  @saved_story = params[:sentence]

  CSV.open("selected_sentences.csv","a+") do |csv|
    csv << ["0", @saved_story]
  end

  redirect '/'
end

post '/upvote' do
  params[:name]
  binding.pry
  redirect '/'
end
