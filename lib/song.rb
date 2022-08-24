class Song
  attr_accessor :name, :artist, :genre, :count, :genres, :artists

  @@count = 0
  @@genres = []
  @@artists = []
  @@genre_count = {}
  @@artist_count = {}

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
    @@count += 1
    @@genres << genre
    @@artists << artist
  end

  def self.count
    @@count
  end

  def self.genres
    @@genres = @@genres.uniq
    @@genres
  end

  def self.artists
    @@artists = @@artists.uniq
    @@artists
  end

  def self.genre_count
    puts "\nWithin 'self.genre_count' method: "
    # This loops through each element of the string array
    # 'x' will evaluate to the genre string itself to later become the key for the
    # genre_count hash
    @@genres.each do |x|
      if @@genre_count[x]
        @@genre_count[x] += 1
      else
        @@genre_count[x] = 1
      end
    end
    # You can need to iterate over the @@genres array
    # populate a hash with the key/value pairs.
    # You will need to check to see if the hash already contains a key of a particular genre.
    # If so, increment the value of that key by one, otherwise, create a new key/value pair.
    @@genre_count
  end

  # NOTE: This is the same as 'self.genre_count' but instead is using the built-in method, 'tally'
  # https://ruby-doc.org/core-2.7.0/Enumerable.html#method-i-tally
  def self.artist_count
    @@artist_count = @@artists.tally
    @@artist_count
  end

end

song1 = Song.new("Pueblo", "Pavement", ["Rawk", "Indie", "Cool Jazz"])
puts "song1: ", song1
puts "\nsong1.name: ", song1.name
puts "\nsong1.artist: ", song1.artist
puts "\nsong1.genre: ", song1.genre
puts "\nSong.genre_count: ", Song.genre_count
