
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  
  def self.create()
    song=self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song=self.new
    song.name=name
    return song
  end
  def self.create_by_name(name)
    song=self.new
    song.name=name
    song.save
    return song
  end
  
  def self.find_by_name(name)
    self.all.find{|song|song.name==name}
  end
  
  def self.find_or_create_by_name(name)
    return self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by {|letter|letter.name}
  end
  
  def self.new_from_filename(file)
    file=file.split(" - ")
    song=self.new
    song.artist_name=file[0]
    song.name=file[1].gsub(".mp3","")
    return song
  end
  
  def self.create_from_filename(file)
    file=file.split(" - ")
    song=self.new
    song.artist_name=file[0]
    song.name=file[1].gsub(".mp3","")
    song.save
    song
    
  end
    
  def self.destroy_all
    @@all.clear()
  
  end
  

end