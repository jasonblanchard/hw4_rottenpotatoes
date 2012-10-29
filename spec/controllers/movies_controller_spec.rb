require 'spec_helper'

describe MoviesController do

  describe "Showing all movies" do
    it "should show all movies on the index page" do
      Movie.stub(:index)
      get :index
      response.should render_template("index")
    end

    it "should sort all movies by title" do
      
      movie = FactoryGirl.create(:movie, :id => 1, :title => "Star Wars")

      get :index, {:sort => 'title'}

      response.should redirect_to("/?ratings%5BG%5D=G&ratings%5BNC-17%5D=NC-17&ratings%5BPG%5D=PG&ratings%5BPG-13%5D=PG-13&ratings%5BR%5D=R&sort=title")
    end

    it "should sort all movies by release date" do
      get :index, {:sort => 'release_date'}

      response.should redirect_to("/?ratings%5BG%5D=G&ratings%5BNC-17%5D=NC-17&ratings%5BPG%5D=PG&ratings%5BPG-13%5D=PG-13&ratings%5BR%5D=R&sort=release_date")
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

  describe "Updating an existing movie" do
    it "should show the edit page" do
      movie = FactoryGirl.create(:movie, :id => '1')
    
      get :edit, { :id => movie.id }

      response.should render_template("edit")

    end

    it "should update properties of existing movie" do
      movie = FactoryGirl.create(:movie, :title => "Star Wars", :director => "Lucas", :id => 1)

      movie.stub(:update)
      
      put :update, {:id => movie.id }

      response.should redirect_to(movie_path)
    end
  end

  describe "Destroy existing movie" do
    it "should destroy a movie in the database" do
      movie = FactoryGirl.create(:movie, :id=> 1)

      movie.stub(:destroy)

      delete :destroy, {:id => movie.id }
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
