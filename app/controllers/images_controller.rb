class ImagesController < ApplicationController
  def index
    @images = Image.all
  end
  
  def show
    @image = Image.find(params[:id])
  end
  
  def new
    @image = Image.new
  end
  
  def create
    @image = Image.new(params[:image])
    
    respond_to do |format|
      if @image.save
        flash[:notice] = "Image was added successfully"
        format.html { redirect_to @image }
      else
        format.html { render :action => "new" }
      end
    end
  end
end
