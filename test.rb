require './input_functions'

# Complete the code below
# Use input_functions to read the data from the user

class Plane
	attr_accessor :id, :flight_number, :origin, :destination
		def initialize (id, flight_number, origin, destination)
				@id = id
				@flight_number = flight_number
				@origin = origin
				@destination = destination
		end
end
	
def read_plane()
	 
	  id = read_integer("Enter plane ID:")
	flight_number = read_string("Enter flight name:")
	origin = read_string("Enter origin airport")
	destination = read_string("Enter destination airport")
	 plane = Plane.new(id, flight_number, origin, destination)
	return plane
	
end

def read_planes()
	planes = Array.new()
	count = read_integer("Enter amount of planes: ")
	# Complete the missing code
	index = 0
	while(index < count)
    plane = read_plane()
    planes << plane
    index += 1
	end
return planes
end

def print_plane(plane)
	puts('ID is ' + plane.id.to_s)
	  puts ('Flight number is ' + plane.flight_number.to_s)
	  puts ('Plane origin is ' + plane.origin.to_s)
	  puts ('The destination is ' + plane.destination.to_s)
end

def print_planes(planes)		
	index = 0
	puts ": "
	while (index < planes.length())
		print_plane(planes[index])
		index += 1
	end
	return planes[index]
	
			
end

def main()
	planes = read_planes()
	print_planes(planes)
end

main()
		