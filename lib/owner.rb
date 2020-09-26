require "pry"

class Owner
  
  attr_reader :name, :species
  # attr_accessor :pets
  
    @@all = []
    @@pets = self
 
  def initialize (name)
  @name = name
  @species = "human"
  @@all << self
  end
 
  def pets
   @@pets
  end
  
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
 
  def say_species
    return "I am a #{@species}."
  end
  
  
  def buy_cat(name)
	  newcat = Cat.new(name, self) 
	  self.cats << newcat
  end
  

  def buy_dog(name)
	  newdog = Dog.new(name, self) 
	  self.dogs << newdog
  end
  
  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end
  
   def sell_pets
    self.cats.each do |cat|
      self.cats.delete(cat)
      cat.owner = nil
      cat.mood = "nervous"
    end 
    self.dogs.each do |dog|
      self.dogs.delete(dog)
      dog.owner = nil 
      dog.mood = "nervous"
    end 
  end 

  
   def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end


  def self.all
  @@all
  end
 
  def self.count
    @@all.size
  end
 
  def self.reset_all
    @@all.clear
  end
  
end

