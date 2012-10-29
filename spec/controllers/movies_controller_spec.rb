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

    it "should redirect to home page if the movie does not have a director listed" do

      movie = FactoryGirl.create(:movie, :id => 1)
      get movie_path(movie.id)
      response.should render_template('show')

    end
  end
end
