class PicturesController < ApplicationController
  # GET /pictures
  # GET /pictures.json
  def index

    @story = Story.find(params[:story_id])

    @pictures = @story.pictures

    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])

    respond_to do |f|
      f.html # show.html.erb
      f.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @story = Story.find(params[:story_id])
    @picture = @story.pictures.build

    respond_to do |f|
      f.html # new.html.erb
      f.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    #@gallery = Gallery.find(params[:gallery_id])

    @picture = Picture.find(params[:id])
    # @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(params[:picture])

    if @picture.save
      respond_to do |f|
        f.html {
          render :json => [@picture.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@picture.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update

    @story = Story.find(params[:story_id])

    @picture = @story.pictures.find(params[:id])

    respond_to do |f|
      if @picture.update_attributes(picture_params)
        f.html { redirect_to gallery_path(@story) }
        f.json { head :no_content }
      else
        f.html { render action: "edit" }
        f.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    #@gallery = Gallery.find(params[:gallery_id])
    #@picture = @gallery.pictures.find(params[:id])
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |f|
      f.html { redirect_to root_path }
      f.js
    end
  end

  def make_default
    @picture = Picture.find(params[:id])
    @story = Story.find(params[:story_id])

    @story.cover = @picture.id
    @story.save

    respond_to do |f|
      f.js
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :story_id, :image)
  end
end
