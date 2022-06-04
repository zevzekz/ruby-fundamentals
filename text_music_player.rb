require "./input_functions"

module Genre
  POP, INDIE, ABSTRACT_HIP_HOP, ALTERNATIVE = *1..4
end

$genre_names = ["Null", "Pop", "Indie", "Abstract Hip Hop", "Alternative"]

class Track
	attr_accessor :name, :location

	def initialize (name, location)
		@name = name
		@location = location
	end
end

class Album
	attr_accessor :title, :artist, :genre, :tracks

	def initialize (title, artist, genre, tracks)
		@title = title
		@artist = artist
		@genre = genre
		@tracks = tracks
	end
end

def read_track(music_file)
	track_location = music_file.gets
	track_name = music_file.gets
  
	track = Track.new(track_location, track_name)
	return track
end

def print_track(track)
	puts("Title is: " + track.name)
	puts("Location is: " + track.location)
end

def read_tracks(music_file)
	tracks = Array.new()
	index = 0
  count = music_file.gets().to_i()
	   
	while(index < count)
		track = read_track(music_file)
		tracks << track
		index += 1
	end
		
	return tracks
end

def print_tracks(tracks)  
	index = 0
	
	while(index < tracks.length)
		puts("Below is the list of tracks...")
		puts("Track number #{index + 1}:")
		print_track(tracks[index])
		index += 1
	end
end

def read_album(music_file, count)
  index = 0

  while(index < count.to_i)
    album_title = music_file.gets
    album_artist = music_file.gets
    album_genre = music_file.gets().to_i()
    tracks = read_tracks(music_file)
    $album = Album.new(album_title, album_artist, album_genre, tracks)
    index += 1
  end

	return $album
end

def print_album()
	puts("The title is #{$album.title}.")
	puts("The artist is #{$album.artist}.")
	puts("The genre is #{$album.genre.to_s}: #{$genre_names[$album.genre]}")
	print_tracks($album.tracks) 
end

def read_albums(music_file, count)
  albums = Array.new()
  index = 0

  while(index < count.to_i)
    $album = read_album(music_file, count)
		albums << $album
    index += 1
  end

  return albums
end

def print_albums(albums, count)
  index = 0
  while(index < count.to_i)
    puts("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
    puts("The following is album #{index + 1}'s information: ")
    print_album()
    index += 1
  end
end

def main()
	puts("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
  puts("Welcome to the music player".upcase)

	finished = false
  begin
    puts("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
    puts("Main Menu:")
    puts("1 To Read in Albums")
    puts("2 To Display Albums")
    puts("3 To Select an Album to play")
    puts("4 To Update an existing Album")
    puts("5 Exit the application")
    choice = read_integer_in_range("Please enter your choice:", 1, 5)
    case choice
    when 1
      puts("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
      puts("Enter album info-storage file name: ")
      albumInfo = gets().chomp
      music_file = File.new(albumInfo, "r")
      count = music_file.gets()
      puts("The album count: #{count}")
      albums = read_albums(music_file, count)
      music_file.close()
    when 2
      print_albums(albums, count)
    when 3
      puts("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
      selected_album = read_integer_in_range("Enter album number: ", 1, 4)
      case selected_album
      when 1

      when 2

      when 3

      when 4

      end
    when 4

    when 5
      finished = true
    else
      puts("Please select again")
    end
  end until finished
  puts("Bye!")
end

main()
