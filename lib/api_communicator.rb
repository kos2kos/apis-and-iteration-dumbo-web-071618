require 'rest-client'
require 'json'
require 'pry'

def get_all_characters
  character_hash = JSON.parse(RestClient.get('http://www.swapi.co/api/people/'))
  next_page = JSON.parse(RestClient.get(character_hash["next"]))
  while next_page["next"] != nil
    character_hash["results"] << next_page["results"]
    next_page = JSON.parse(RestClient.get(next_page["next"]))
  end
  character_hash["results"] << next_page["results"]
  character_hash["results"] = character_hash["results"].flatten
end

def next_page(character_hash)
  next_url = JSON.parse(RestClient.get(character_hash["next"]))
  next_url
end

# all_characters_iteration


def get_character_movies_from_api(character)
  #make the web request
  # binding.pry
  character_page = JSON.parse(RestClient.get('http://www.swapi.co/api/people/'))
  found_character = nil

  found_character = all_characters_iteration.find do |char_name|
    char_name["name"] == character
    end
    # binding.pry
  found_character["films"]

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

# iterate over the character hash to find the collection of `films` for the given
#   `character`
# collect those film API urls, make a web request to each URL to get the info
#  for that film
# return value of this method should be collection of info about each film.
#  i.e. an array of hashes in which each hash reps a given film
# this collection will be the argument given to `parse_character_movies`
#  and that method will do some nice presentation stuff: puts out a list
#  of movies by title. play around with puts out other info about a given film.


def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  #iterate through films_hash
  films_hash.each do |film_url|
    #we are requesting from API to get film information
    current_movie = RestClient.get(film_url)
    movie_hash = JSON.parse(current_movie)
  end
  movie_hash["title"]
  # binding.pry
end

# arr_movies = ["https://www.swapi.co/api/films/2/",
#    "https://www.swapi.co/api/films/6/",
#    "https://www.swapi.co/api/films/3/",
#    "https://www.swapi.co/api/films/1/"]
#
# parse_character_movies(arr_movies)

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

show_character_movies("Padmé Amidala")
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
