require "pry"
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

  def add_song(song)
    song.artist = self
  end

  def songs
    Song.all.select {|song|song.artist == self}
  end

  def self.find_or_create_by_name(artist_name)
    if self.all.empty?
      new_artist = self.new(artist_name)
      return new_artist
    else
      self.all.each do |artist|
        # binding.pry
        if artist.name == artist_name
          return artist
        end
      end
    end
  end

  def print_songs
    songs.each {|song| puts song.name}
  end

end
