class PagesController < ApplicationController

  def home
    if user_signed_in?
      redirect_to todo_lists_path and return
    else
      render layout: 'home'
    end
  end
end
