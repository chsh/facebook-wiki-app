class CanvasController < ApplicationController
  before_filter :verify_post_method, only: :tab
  def tab
    if params[:app_id]
      app = App.find_by_app_id params[:app_id]
      page_app = PageApp.find_by_app_id_and_page_id(app.id, page.id)
      session["page_apps/#{page_app.id}"] = signed_request.page
      redirect_to page_app
    else
      session["pages/#{page.id}"] = signed_request.page
      redirect_to page
    end
  end
  private
  def page
    @page ||= Page.from_signed_request signed_request
  end
end
