require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

guest1 = Guest.new("Ryan")
guest2 = Guest.new("Irving")

listing1 = Listing.new("apartment", "ny")
listing2 = Listing.new("house", "nj")


trip1 = Trip.new(listing1, guest1)
trip2 = Trip.new(listing2, guest2)
trip3 = Trip.new(listing1, guest2)

Pry.start
