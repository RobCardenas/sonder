class StoriesController < ApplicationController
  before_filter :authorize, except: [:index, :show]
  def index
    @stories = Story.all
    render :index
  end

  def new
    @story = Story.new
    render :new
  end

  def create
    story = current_user.stories.create(story_params)
    redirect_to story_path(story)
  end

  def show
    @story = Story.find(params[:id])
    render :show
  end

  def edit
    @story = Story.find(params[:id])
    if current_user.stories.include? @story
      render :edit
    else
      redirect_to profile_path
    end
  end

  def update
    story = Story.find(params[:id])
    if current_user.stories.include? story
      story.update_attributes(story_params)
      redirect_to story_path(story)
    else
      redirect_to profile_path
    end
  end

  def destroy
    story = Story.find(params[:id])
    if current_user.stories.include? story
      story.destroy
      redirect_to profile_path
    else
      session[:user_id] = nil
      redirect_to login_path
    end
  end

  private
    def story_params
      params.require(:story).permit(:name, :description)
    end
end
