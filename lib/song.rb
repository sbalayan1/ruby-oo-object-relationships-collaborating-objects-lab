require 'pry'
class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize name
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename file
        parsedFile = file.split(' - ')
        song = Song.new(parsedFile[1])
        artist = Artist.find_or_create_by_name parsedFile[0]
        artist.add_song song
        # binding.pry
    end
end