require 'pry'

class Artist
  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  include Paramable::InstanceMethods
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def initialize #instance method, so self refers to the instance of the class on which you are operating but.all is a class method 
    self.class.all << self
    @songs = []
  end

  def self.all
    @@artists
  end
  

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end
  

end
