module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class Album
  # you will need to add tracks to the following and the initialize()
	attr_accessor :number_of_albums, :title, :artist, :genre, :track_number, :tracks

# complete the missing code:
	def initialize (number_of_albums, title, artist, genre, track_number, tracks)
		# insert lines here
		  @number_of_albums = number_of_albums
		  @title = title
		  @artist = artist
		  @genre = genre
		  @track_number = track_number
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


  def read_album(music_file)
  
	# read in all the Album's fields/attributes including all the tracks
	# complete the missing code
	 album_number = music_file.gets.to_i
	 album_artist = music_file.gets
	 album_title = music_file.gets
	 album_genre = music_file.gets.to_i
	 tracks = read_tracks(music_file)
	 album = Album.new(album_title, album_artist, album_genre, tracks)
	  return album
  end
  
  def menu_option_1()
music_file = File.new ("album.txt", "r")
puts 'The file must contain the number of albums, the first album name, the first artist name, the genre of the album, the number of tracks (up to 15), the name and file location of each track and the album information for the remaining albums.'
end

def menu_option_2()

end

def menu_option_3()

end
  
def menu_option_4()

end




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
      menu_option_1()
    when 2
      menu_option_2()
	when 3 
	  menu_option_3()
	when 4
	  menu_option_4()
    else
      puts 'Please select again'
    end
  end until finished
end
