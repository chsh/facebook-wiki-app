class PageAppsController < ApplicationController
  before_filter :lookup_app
  def show
    @content_page = page_app.content.default_page
    if @content_page
      render layout: true
    else
      redirect_to page_app_content_page_path(page_app_id: page_app.id,
                                             id: page_app.content.default_name)
    end
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
