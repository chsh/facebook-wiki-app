class EightTabzConnectController < ApplicationController
  before_filter :authenticate_user!

  def preferences
    page = current_user.pages.where(app_id: params[:page_app_id]).first
    raise "No preferences for #{params[:page_app_id]}" unless page
    render text: 'Hello, Preferences!'
  end
end
