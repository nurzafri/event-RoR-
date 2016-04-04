class WelcomeController < ApplicationController
  def index
  	@occasions = Occasion.all
  end
end
