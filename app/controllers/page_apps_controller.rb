class PageAppsController < ApplicationController
  before_filter :lookup_app
  def show
    @content_page = page_app.content.default_page
    render layout: true
  end

  private
  def page_app
    @page_app ||= PageApp.find(params[:id])
  end
  def hint
    @hint ||= session["page_apps/#{page_app.id}"]
  end
  def lookup_app
    @app = page_app.app
  end
end
