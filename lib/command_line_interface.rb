require 'pry'
def welcome
  # puts out a welcome message here!
  puts "Hey what's up?!"
end

def get_character_from_user
  puts "please enter a character"
  name = gets
  name
  # use gets to capture the user's input. This method should return that input, downcased.

end

get_character_from_user
