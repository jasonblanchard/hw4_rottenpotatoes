require 'spec_helper'

describe MoviesController do

  describe "Showing movies with same director" do
    it "should call the model method that finds movies with same director" do

      movie = FactoryGirl.create(:movie, :id => 1, :director => "jason")

      post :movies_by_director, {:id => movie.id}
    end

    it "should select the Movie Directors template for rendering" do
      movie = FactoryGirl.create(:movie, :id => 1, :director => "jason")

      Movie.stub(:movies_by_director)
      post :movies_by_director, {:id => movie.id }
      response.should render_template('movies_by_director')
    end
  end
end
