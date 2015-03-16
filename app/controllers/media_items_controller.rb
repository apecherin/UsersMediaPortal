class MediaItemsController < ApplicationController
  before_filter :authenticate_user!, except: :index
  before_action :set_media_item, only: [:show, :edit, :update, :destroy]

  def index
    @media_items = MediaItem.all
  end

  def show
  end

  def new
    @media_item = MediaItem.new
  end

  def edit
  end

  def create
    @media_item = current_user.media_item.new(media_item_params)

    respond_to do |format|
      if @media_item.save
        format.html { redirect_to @media_item, notice: 'Media Item was successfully created.' }
        format.json { render :show, status: :created, location: @media_item }
      else
        format.html { render :new }
        format.json { render json: @media_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @media_item.update(media_item_params)
        format.html { redirect_to @media_item, notice: 'Media Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @media_item }
      else
        format.html { render :edit }
        format.json { render json: @media_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @media_item.destroy
    respond_to do |format|
      format.html { redirect_to media_items_url, notice: 'Media Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_media_item
    @media_item = MediaItem.find(params[:id])
  end

  def media_item_params
    params.require(:media_item).permit(:name, :url, :image)
  end
end
