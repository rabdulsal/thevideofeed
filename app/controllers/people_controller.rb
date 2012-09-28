class PeopleController < ApplicationController
  def show
    @person = Person.find_by_username(params[:username])
    @videos = @person.videos.order("favorites.created_at desc").page(params[:page]).per_page(4)

    respond_to do |format|
      format.js { render 'videos/index' }
      format.html
    end
  end
end
