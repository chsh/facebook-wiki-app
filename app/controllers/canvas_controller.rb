class CanvasController < ApplicationController
  before_filter :verify_post_method, only: :tab
  def tab
    if app.meta?
      session["pages/#{page.id}"] = page_and_user_info
      redirect_to page
    else
      page_app = PageApp.using app_id: app.id, page_id: page.id
      session["page_apps/#{page_app.id}"] = page_and_user_info
      redirect_to page_app
    end
  end
  private
  def page
    @page ||= Page.from_signed_request signed_request
  end
  def page_and_user_info
    @page_and_user_info ||= signed_request.slice(:page, :user)
  end
end
