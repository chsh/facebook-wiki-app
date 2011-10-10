class ContentPage < ActiveRecord::Base
  belongs_to :content

  MARKDOWN = 0

  def render(hint)
    case self.format
    when MARKDOWN
      markdown = RDiscount.new(self.text)
      markdown.to_html
    else raise "Unexpected formatter. code:#{self.format}"
    end
  end
  def self.by_name(name)
    where(name: name).first
  end
  def owner
    self.content.ownable
  end
  def wiki_path(key)
    if owner.is_a?(PageApp)
      page_app_content_page_path(page_app_id: owner, id: key)
    else
      page_content_page_path(page_id: owner, id: key)
    end
  end
end
