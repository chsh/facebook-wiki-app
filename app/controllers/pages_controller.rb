class PagesController < ApplicationController
  before_filter :lookup_app
  def show
    render text: page.content.render(hint), layout: true
  end

  private
  def page
    @page ||= Page.find(params[:id])
  end
  def hint
    @hint ||= session["pages/#{page.id}"]
  end
  def lookup_app
    @app = page.app
  end
end
