class UrlsController < ApplicationController

  def index
    @urls = Url.all
    @url ||= Url.new
  end

  def create
    @url = Url.new url_params
    @url.shorten = Url.generate_lorem
    redirect_to root_path if @url.save
  end

  def goto
    redirect_to actual_path
  end

  private
    def actual_path
      @url = Url.find_by_shorten params[:shorten]
      @url.nil? ? root_path : @url.original
    end

    def url_params
      params.require(:url).permit(:original, :shorten)
    end
end
