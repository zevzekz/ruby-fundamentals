require './input_functions'

class Album

    attr_accessor :album_name, :album_arist, :album_genre, :tracks
    def initialize(album_name,album_arist,album_genre,tracks)
        @album_name = album_name
        @album_arist = album_arist
        @album_genre = album_genre
        @tracks = tracks
    end
end

class Track
    attr_accessor :track_name, :track_location
    def initialize(track_name,track_location)
        @track_name = track_name
        @track_location = track_location
    end
end

def get_tracks(count,musicfile)
    i = 0
    tracks = Array.new()
    while (i < count) do
        track_name = musicfile.gets()
        track_location = musicfile.gets()
        tracks << Track.new(track_name,track_location)
        i += 1
    end

    return tracks
end


def read_albums(musicfile) 
    number_albums = musicfile.gets().to_i
    i = 0  
    albums = Array.new() 
    while (i < number_albums) do 
        album_name = musicfile.gets()
        album_arist = musicfile.gets()
        album_genre = musicfile.gets()
        number_tracks = musicfile.gets().to_i 
        tracks = get_tracks(number_tracks,musicfile)  
        albums << Album.new(album_name,album_arist,album_genre,tracks) 
        i += 1
    end

    return albums

end

def open_file()
    a_file = File.new(read_string("Enter file name: "), "r") 
    if a_file  
      albums = read_albums(a_file)
      a_file.close
      return albums
    else
      puts "Invalid file"
      return -1
    end
    
end

def print_genre(albums,genre)
    number_albums = albums.length()
    i = 0
    while ( i < number_albums)
        if (genre.chomp() == albums[i].album_genre.chomp())
            print_album(albums[i])
        end
        i += 1
    end
end

def print_album(album)
    puts("Album Name is : #{album.album_name}")
    puts("Album Artist is : #{album.album_arist}")
    puts("Album Genre is : #{album.album_genre}")
        album.tracks.each do |n|
            puts("Track Name is : #{n.track_name}")
            puts("Track Location is : #{n.track_location}")
        end
        puts
end

def print_albums(albums)
    i = 0
    albumscount = albums.length()
    while i < albumscount
        puts("Album Id is : #{i}")
        print_album(albums[i])
        i += 1
    end
end

def display_genre(albums)
    genres = ["Pop","Rap"]    
    puts("1. #{genres[0]}")
    puts("2. #{genres[1]}")
    userinput = gets.chomp.to_i
    case userinput
    when 1
        print_genre(albums,genres[0])
    when 2
        print_genre(albums,genres[1])
    end
end

def display_albums(albums)
    
    while true
        puts("1. Display all Albums")
        puts("2. Display Genre")
        input = gets.chomp.to_i
        case input
        when 1
            print_albums(albums)
            sleep(5)
            break
        when 2
            display_genre(albums)
            sleep(5)
            break
        end
    end
end

def play_track(track_name,album_name)
    puts("Playing track | #{track_name} | from album | #{album_name} |")
    sleep(5)
end

def display_tracks(album)
    puts("Album : #{album.album_name}")
    album.tracks.each_with_index do |n, index|
        puts("#{index}. #{n.track_name}")
    end
    puts
    puts("Select a track to play")
    userinput = gets().to_i
    if (0..album.tracks.length()) === userinput
        play_track(album.tracks[userinput].track_name,album.album_name)
    end
end

def play_album(albums)
    puts("Enter Album Id")
    userinput = gets().to_i
    if (0..albums.length()) === userinput
        display_tracks(albums[userinput])
    else
        puts("Id out of range")
    end 
end



def update_album(album)
    puts("1. Update Title |>#{album.album_name}")
    puts("2. Update Genre |>#{album.album_genre}")
    userinput = gets().to_i
    case userinput
    when 1
        puts("Enter New Album Name :")
        album.album_name = gets()
    when 2
        puts("Enter New Album Genre :")
        album.album_genre = gets()
    end
end

def update_albums(albums)
    puts("Enter Album Id")
    userinput = gets().to_i
    if (0..albums.length()) === userinput
        update_album(albums[userinput])
    else
        puts("Id out of range")        
    end
end

def menu()
    albums = -1
    while true
        puts("1. Read Albums")
        puts("2. Display Albums")
        puts("3. Select an Album to play")
        puts("4. Update an existing Album")
        puts("5. Exit the application")
        userinput = gets.chomp().to_i
        case userinput
        when 1
            albums = open_file()
            puts("File Read")
        when 2..4
        if (albums != -1)
         case userinput
         when 2
         display_albums(albums)
         when 3
         play_album(albums)
         when 4
         update_albums(albums)
         end

         else
         puts("No Album Loaded")
         end

        when 5
            break
        end
    end

end

def main
    menu()
end

main

