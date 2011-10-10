class PageAppsController < ApplicationController
  def show
    @app = page_app.app
    render text: page_app.content.render(hint), layout: true
  end

  private
  def page_app
    @page ||= PageApp.find(params[:id])
  end
  def hint
    @hint ||= session["page_apps/#{page_app.id}"]
  end
end
