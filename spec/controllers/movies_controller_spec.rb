require 'spec_helper'

describe MoviesController do

  describe "Showing all movies" do
    it "should show all movies on the index page" do
      Movie.stub(:index)
      get :index
      response.should render_template("index")
    end
  end

  describe "Showing one movie's info" do
    it "should show details for one movie" do 
      movie = FactoryGirl.create(:movie, :id => 1, :title => "Star Wars")

      get :show, {:id => movie.id }

      response.should render_template("show")
    end
  end

  describe "Creating a new movie" do
    it "should save a new movie" do
      movie = FactoryGirl.create(:movie, :title => "Star Wars")

      post :create, { :params => movie }

      response.should redirect_to(movies_path)
    end
  end

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

      movie = FactoryGirl.create(:movie, :id => 1, :director => nil)
      
      Movie.stub(:movies_by_director)
      post :movies_by_director, {:id => movie.id }
      response.should redirect_to(home_path)

    end
  end
end
