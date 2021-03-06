class StoriesController < ApplicationController
  before_filter :authorize, except: [:index, :show]
  def index
    @stories = Story.where(draft: false)
    # render :index
    # check if story is nil 
    respond_to do |format|
      format.html
      format.json { render json: @stories }
    end
  end

  def new
    @story = Story.new
    respond_to do |format|
      format.html
      format.json { render json: @story }
    end
  end

  def create
    # @story = Story.new(story_params)
    story = current_user.stories.create(story_params)
    # redirect_to story_path(story)

    respond_to do |format|
      if story.save
        if params[:images]
           params[:images].each { |image| 
           story.pictures.create(image: image)}
        end
        # format.html { redirect_to stories_draft_path(story.id) }
        format.html { redirect_to edit_story_path(story.id) }
        format.json { render json: story }
      else
        flash[:error] = "At least one image must be uploaded!"
        format.html { render action: "new"}
        format.json { render json: @story.error}
      end
    end
  end

  def show
    @story = Story.find(params[:id])
    @pictures = @story.pictures
    respond_to do |format|
      format.html
      format.json { render json: @story }
    end
  end

  def edit
    @story = Story.find(params[:id])
    @pictures = @story.pictures
    respond_to do |format|
      format.html
      format.json { render json: @picture }
    end
    if current_user.stories.include? @story
      # render :edit
    else
      redirect_to profile_path
    end
  end

  def update
    story = Story.find(params[:id])
    if current_user.stories.include? story
      story.update_attributes(story_params)
      if params[:images]
        params[:images].each { |image|
        story.pictures.create(image: image)}
      # redirect_to story_path(story.id)
    end
      respond_to do |format|
      format.html { redirect_to story_path(story.id) }
      format.json { head :no_content }
    end
    else
      format.html { render action: "edit" }
      redirect_to profile_path
    end
  end

  def destroy
    story = Story.find(params[:id])
    if current_user.stories.include? story
      story.destroy
      respond_to do |format|
        format.html {redirect_to profile_path}
        format.json {head :no_content}
      end
    else
      session[:user_id] = nil
      redirect_to login_path
    end
  end

  def draft
    render :draft
  end

  private
    def story_params
      if params[:draft]
        return params.require(:story).permit(:name, :description, :pictures).merge(draft: true)
      else
        return params.require(:story).permit(:name, :description, :pictures).merge(draft: false)
      end
    end

end