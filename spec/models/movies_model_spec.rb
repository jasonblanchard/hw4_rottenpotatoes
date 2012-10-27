require 'spec_helper'
FactoryGirl.find_definitions

describe Movie do
  it "can be instantiated" do
    Movie.new.should be_an_instance_of(Movie)
  end

  it "can be saved successfully" do
    Movie.create.should be_persisted
  end

  it "can find movies with the same director" do

    movie1 = FactoryGirl.create(:movie, :director => "jason")
    movie2 = FactoryGirl.create(:movie, :director => "jason")

    movie1.movies_by_same_director.length.should == 2

    movie1.movies_by_same_director.each do |movie|
      movie.should be_an_instance_of(Movie)
    end

  end
end
