class Content < ActiveRecord::Base
  def render(liked = false)
    markdown = RDiscount.new(self.content.to_s)
    markdown.to_html
  end
end
