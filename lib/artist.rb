class Artist
    attr_accessor :name
    @@all = []

    def initialize name
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song song
        song.artist=self
    end

    def songs
        Song.all.filter {|song| song.artist == self}
    end

    def self.find_or_create_by_name name
        if Artist.all.find {|artist| artist.name == name} != nil
            return Artist.all.find {|artist| artist.name == name}
        end

        return Artist.new(name)
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end
end