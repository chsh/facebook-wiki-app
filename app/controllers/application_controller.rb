class ApplicationController < ActionController::Base
  protect_from_forgery
#  before_filter :parse_signed_request
  include ApplicationHelper

  protected
  def app?
    app ? true : false
  end
  def app
    return nil unless params[:app_id]
    @app ||= App.find_by_app_id(params[:app_id])
  end
  def fb_page?
    return false unless signed_request
    fb_page ? true : false
  end
  def fb_page
    @fb_page ||= signed_request.page
  end
  def canvas?
    return false unless signed_request
    !fb_page?
  end
  def user
    @user
  end
  protected
  def verify_post_method
    raise "Method not allowed" unless request.post?
  end
  def signed_request
    return nil unless request.post? && params[:signed_request]
    @signed_request ||= build_signed_request
  end
  private
  def build_signed_request
    sr = Facebook.parse_signed_request params[:signed_request], app
    @user = User.from_signed_request sr
    sr
  end
end
