class PagesController < ApplicationController


  def index
    if current_user
      render layout: 'user'
    end
  end
    
end
