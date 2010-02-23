class ImagesController < ApplicationController
  before_filter :init
  
  def index
    @images = @category.images.all :order => 'id DESC'
    
    respond_to do |format|
      format.html { redirect_to @category}
      format.xml { render :xml => [@category, @images] }
    end
  end
  
  def show
    @image = @category.images.find(params[:id])
  end
  
  def new
    @categories = Category.all
    @image = @category.images.new
  end
  
  def create
    @image = @category.images.new(params[:image])
    @categories = Category.all
    
    respond_to do |format|
      if @image.save
        flash[:notice] = "Image was added successfully"
        format.html { redirect_to [@category, @image] }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def edit
    @image = @category.images.find(params[:id])
    @categories = Category.all
  end
  
  def update
    @image = @category.images.find(params[:id])
    respond_to do |format|
      if @image.update_attributes(params[:image])
        flash[:notice] = "Image Updated"
        format.html { redirect_to [@category, @image] }
        format.xml { head :ok}
      else
        format.html { render :action => 'edit' }
        format.xml { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  private
  def init
    @category = Category.find(params[:category_id])
  end
  
end
