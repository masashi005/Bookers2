class HomesController < ApplicationController
  def about
    render :layout => 'home_layout'
  end

  def top
    render :layout => 'home_layout'
  end
end