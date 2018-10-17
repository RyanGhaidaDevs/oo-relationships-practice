class Listing
    attr_accessor :city
    attr_reader :type 
    @@all = []

    def initialize(type, city)
        @city = city
        @type = type 
        @@all << self 
    end 

    def self.all
        @@all
    end

    def guests
        Trip.all.select do |trip|
            trip.listing == self
        end.map do |trip|
            trip.guest
        end 
    end 

    # returns an array of all trips at a listing
    def trips 
        Trip.all.select do |trip|
            trip.listing == self
        end
    end 

    #  returns the number of trips that have been taken to that listing
    def trip_count 
        trips.length
    end 

    # takes an argument of a city name (as a string) 
    # and returns all the listings for that city
    def self.find_all_by_city(city)
        @@all.select do |listing_instance|
            listing_instance.city == city
        end  

    end 

    # finds the listing that has had the most trips
    def self.most_popular
        counter = 0 

        @@all.each do |listing|
            if counter == 0 
                puts "inside if"
                counter = listing.trip_count
            elsif counter != 0 && listing.trip_count > counter 
                puts "inside elsif"
                counter = listing.trip_count 
            end 

        end 
         #counter == 2  we also know that listing.trip_count of
         #most popular listing == 2 

         @@all.each do |listing|
            if listing.trip_count == counter
               return listing
            end 
         end 
    end

    
end 