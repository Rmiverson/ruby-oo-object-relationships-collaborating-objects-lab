class Song
   attr_accessor :name, :artist

   @@all = []
   def initialize(name)
      @name = name
      @artist

      @@all << self
   end

   def self.all
      @@all
   end

   def self.remove_ext(str)
      #returns a string
      ans = str.split(/\.[^.]+\z/)
      ans[0]
   end

   def self.process_filename(str)
      #returns an array of two strings
      ans = remove_ext(str).split(/\W\s/)
      ans[0] = ans[0].strip!
      ans
   end

   def self.create(name)
      @song = Song.new(name)
      @@all << @song
      @song
   end

   def self.new_by_filename(filename)
      song_data = process_filename(filename)

      new_song = self.create(song_data[1].strip!)
      new_song.artist = Artist.new(song_data[0])
      @@all << new_song

      new_song
   end

   def artist_name=(artist_name)
      Artist.find_or_create_by_name(artist_name).add_song(self) 
   end
end