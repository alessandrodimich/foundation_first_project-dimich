class StaticPagesController < ApplicationController


  before_filter :authorize, except: [:welcome, :index, :about]

  def home

  end

  def index

  end

  def help

  end

  def about

  end

  def map

  end

  def contact

  end

  def welcome

  end

  def start

  end

  def test_page

  end


end
