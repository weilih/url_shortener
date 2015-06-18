class UrlsController < ApplicationController

  def index
    @urls = Url.order('created_at DESC')
    @url ||= Url.new
  end

  def create
    @url = Url.new url_params

    @url.shorten = Url.generate_lorem

    if @url.valid_url? && @url.save
      flash.notice = "SUCCESS"
    else
      flash.alert = 'INVALID URL'
    end
    redirect_to root_path
  end

  def goto
    if actual_path
      @url.increase_counter
      redirect_to actual_path
    else
      redirect_to root_path, alert:'NOT IN RECORD'
    end
  end

  private
    def actual_path
      @url = Url.find_by_shorten params[:shorten]
      @url.nil? ? false : @url.original
    end

    def url_params
      params.require(:url).permit(:original, :shorten)
    end
end
