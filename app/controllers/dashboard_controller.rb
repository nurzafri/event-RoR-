class DashboardController < ApplicationController
  def index
  	@todo_lists = current_user.todo_lists
  end
end
