module ApplicationHelper
  def page_info
    signed_request.page
  end
  def liked?
    page_info.liked?
  end
  def admin?
    page_info.admin?
  end
  def signed_request
    @signed_request
  end
end
