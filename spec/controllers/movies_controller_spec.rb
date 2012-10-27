require 'spec_helper'

describe MoviesController do

  describe "Showing movies with same director" do
    it "should call the model method that finds movies with same director" do

      movie = FactoryGirl.create(:movie, :id => 1, :director => "jason")

      post :movies_by_director, {:id => movie.id}
    end
  end
end
