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
        song = self.new(parsedFile[1])
        song.artist_name=parsedFile[0]
        song
    end

    def artist_name=name
        artist = Artist.find_or_create_by_name name
        artist.add_song self
    end
end