class PageAppsController < ApplicationController
  def show
    @app = page_app.app
    render text: page_app.content.render, layout: true
  end

  private
  def page_app
    @page ||= PageApp.find(params[:id])
  end
end
