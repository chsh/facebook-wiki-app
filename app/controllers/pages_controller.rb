class PagesController < ApplicationController
  def show
    render text: page.content.render, layout: true
  end

  private
  def page
    @page ||= Page.find(params[:id])
  end
end
