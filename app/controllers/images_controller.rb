class ImagesController < ApplicationController
  before_filter :init
  
  def index
    @images = @category.images.all
    
    respond_to do |format|
      format.html
      format.xml { render :xml => [@category, @images] }
    end
  end
  
  def show
    @image = @category.images.find(params[:id])
  end
  
  def new
    @categories = Category.all
    @image = Image.new
  end
  
  def create
    @image = Image.new(params[:image])
    @catgories = Category.all
    
    respond_to do |format|
      if @image.save
        flash[:notice] = "Image was added successfully"
        format.html { redirect_to [@category, @image] }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  private
  def init
    @category = Category.find(params[:category_id])
  end
  
end
