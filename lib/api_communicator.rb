require 'rest-client'
require 'json'
require 'pry'

def get_all_characters
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  character_hash.
end


def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
# binding.pry
  found_character = character_hash["results"].find do |char_name|
    char_name["name"] == character
    end

  films = found_character["films"]
# binding.pry
  films

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

get_character_movies_from_api("Han Solo")

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  #iterate through films_hash
  films_hash.each do |film_url|
    #we are requesting from API to get film information
    current_movie = RestClient.get(film_url)
    movie_hash = JSON.parse(current_movie)
    puts movie_hash["title"]
  end
end
# arr_movies = ["https://www.swapi.co/api/films/2/",
#    "https://www.swapi.co/api/films/6/",
#    "https://www.swapi.co/api/films/3/",
#    "https://www.swapi.co/api/films/1/"]

# parse_character_movies(arr_movies)

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end


# show_character_movies("R2-D2")
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
