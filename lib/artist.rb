class Artist
   attr_accessor :name

   @@all = []
   def initialize(name)
      @name = name

      @@all << self
   end

   def self.all
      @@all
   end   

   def songs
      Song.all.select {|song| song.artist == self }
   end

   def add_song(song)
      song.artist = self
   end

   def self.find_or_create_by_name(artist_name)
      @@all.map do |data|
         if data.name == artist_name
            return @@all.find{|artist| artist.name == artist_name }
         end
      end   
      self.new(artist_name)
   end

   def print_songs
     puts self.songs.map {|song| song.name }
   end
end