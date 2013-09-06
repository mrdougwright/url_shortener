class UrlsController < ApplicationController
  def new
    @short_url = Url.new
  end

  def create
    @short_url = Url.new(person_params)
    @short_url.shorten(person_params)
    if @short_url.save
      flash[:short_id] = @short_url.id
      redirect_to new_url_url
    else
      render :action => "new"
    end
  end

  def show
    @short_url = Url.last
    redirect_to @short_url.url
  end

  private
  def person_params
    params.require(:url).permit(:url,:s_url)
  end
end
