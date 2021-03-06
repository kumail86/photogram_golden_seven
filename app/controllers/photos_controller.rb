class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @show_photo = Photo.find_by({:id => params[:id]})
  end

  def new_form

  end

  def create_row
    p = Photo.new
    p.source = params[:the_source]
    p.caption = params[:the_caption]
    p.save

    redirect_to("http://localhost:3000/photos")
  end

  def edit
    @edit_photo = Photo.find_by({:id => params[:id]})
  end

  def update_row
    p = Photo.find_by({:id => params[:id]})
    p.caption = params[:the_caption]
    p.source = params[:the_source]
    p.save
    @show_photo = p
    render('show.html.erb')
  end

  def delete
    p = Photo.find_by({:id => params[:id]})
    p.destroy
    redirect_to("http://localhost:3000/photos")
  end


end
