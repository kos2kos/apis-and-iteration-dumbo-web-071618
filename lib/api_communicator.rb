require 'rest-client'
require 'json'
require 'pry'

def next_page(url)
  all_characters = RestClient.get(url)
  hash = JSON.parse(all_characters)
  return hash
end

def all_characters_iteration
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  new_page = next_page(character_hash["next"])

  while
    #see if "next" does not equal nil
    #push in results to character_hash["results"]
    new_page["next"] != nil
    character_hash["results"] << new_page["results"]
    # binding.pry
    new_page = next_page(new_page["next"])
      if new_page["next"] == nil
        character_hash["results"] << new_page["results"]
      end
    character_hash["results"].flatten
    # binding.pry
  end
  character_hash["results"].flatten!
end

# all_characters_iteration

def get_character_movies_from_api(character)

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
# puts get_character_movies_from_api("Finn")

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


# puts show_character_movies("Han Solo")
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
