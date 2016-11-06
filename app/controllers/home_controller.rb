class HomeController < ApplicationController
  layout "index_page", only: [:index]

  def index
  end

  def learn_about
  end

  def volunteer
  end

  def donation
  end
end
