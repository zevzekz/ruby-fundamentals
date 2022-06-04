require './input_functions'

# Task 6.2 T - use the code from 6.2 T to help with this

module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class Album
  # you will need to add tracks to the following and the initialize()
	attr_accessor :title, :artist, :genre, :tracks

# complete the missing code:
	def initialize (title, artist, genre, tracks)
		# insert lines here
		@title = title
		  @artist = artist
		  @genre = genre
		  @tracks = tracks
	end
end

class Track
	attr_accessor :name, :location

	def initialize (name, location)
		@name = name
		@location = location
	end
end

def read_tracks()
	tracks = Array.new()
	count = read_integer_in_range("Enter track count: ", 0, 15)
	# Complete the missing code
	index = 0
		while (index < count)
		puts ("Enter track name")
		tracks << track
		index += 1

  end
return tracks
end

def read_track(music_file)
	name = music_file.gets().to_s.chomp()
	  location = music_file.gets()
	  track = Track.new(name, location)
	  return track
end

def search_for_track_name(tracks, search_string)

# Put a while loop here that searches through the tracks
# Use the read_string() function from input_functions.
# NB: you might need to use .chomp to compare the strings correctly
	index = 0
	found_index = -1
	while (index < tracks.length)
		if (tracks.name[index] == search_string)
			found_index = index
		end
		index += 1
	end
# Put your code here.
  return found_index
end
def read_genre()
  length = $genre_names.length
	index = 0
  # Complete the missing code
	while (index < $genre_names.length)
    puts "#{index + 1} " + $genre_names[index]
	index += 1
	end
	puts "Please pick an album genre (using a number from 1-4)"
	genre = gets().chomp.to_i
	return genre
	end
	
	def read_album()

  # read in all the Album's fields/attributes including all the tracks
  # complete the missing code
	 album_artist = gets().chomp
	 album_title = gets().chomp
	 album_genre = gets()chomp.to_i
	 tracks = read_tracks(music_file)
	 album = Album.new(album_title, album_artist, album_genre, tracks)
	  return album
end

def maintain_albums()
  finished = false
  begin
	puts '1 To Update Album Title'
	puts '2 To Update Album Genre'
	puts '3 To Enter Album'
	puts '4 Exit'
	choice = read_integer_in_range("Please enter your choice:", 1, 4)
	case choice
	when 1
	 update_album_title()
    when 2
     update_album_genre()
	when 3
	 enter_album()
	else puts 'please select again'
	end 
	end
 end

 def update_album_genre()
 puts 'You selected Update Album Genre. Press enter to continue'
 read_genre()
 maintain_albums()
end
 
 def update_album_title
 puts 'You selected Update Album Title. Press enter to continue'
 gets 
 maintain_albums()
end

def menu_option_1()
music_file = File.new ("album.txt", "r")
end
album.txt

def main()
  finished = false
  begin
    puts 'Main Menu:'
    puts '1 To read in album'
    puts '2 To display album'
    puts '3 To select an album to play'
	puts '4 Update an existing album'
	puts '5 Exit the application'
    choice = read_integer_in_range("Please enter your choice:", 1, 3)
    case choice
    when 1
      maintain_albums()
    when 2
      play_exisitng_album()
    else
      puts 'Please select again'
    end
  end until finished
end
