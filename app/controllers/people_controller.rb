class PeopleController < ApplicationController
  def show
    @person = Person.find_by_username(params[:username])
    @videos = @person.videos.order("posts.created_at desc").page(params[:page]).per_page(5)
    render 'videos/index'
  end
end
