module ApplicationHelper
  def fb_page
    signed_request.page
  end
  def liked?
    fb_page.liked?
  end
  def admin?
    fb_page.admin?
  end
  def signed_request
    @signed_request
  end
end
