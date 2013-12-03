class StaticPagesController < ApplicationController


  before_filter :authorize, except: [:welcome, :index]

  def home
  end

  def index
    @title = "Index"
  end

  def help
    @title = "Help"
  end

  def about
    @title = "About"
  end

  def map
    @title = "Map"
  end

  def contact
    @title = "Contact"
  end

  def welcome
    @title = "Welcome"
  end

  def start
    @title = "Start"
  end

  def test_page
    @title = "Test Page"
  end

  def theme
    @title = "Theme"
  end

end
