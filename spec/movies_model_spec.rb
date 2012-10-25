require 'spec_helper'

describe Movie do
  it "can be instantiated" do
    Movie.new.should be_an_instance_of(Movie)
  end

  it "can be saved successfully" do
    Movie.create.should be_persisted
  end
end
