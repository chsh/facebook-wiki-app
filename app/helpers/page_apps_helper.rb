module PageAppsHelper
  def with_wiki_links(html)
    html.gsub(/\[\[(.+?)\]\]/) do |match|
      key = $1
      if owner.is_a?(PageApp)
        link_to key, page_app_content_page_path(page_app_id: owner.id, id: key)
      else
        link_to key, page_content_page_path(page_id: owner.id, id: key)
      end
    end
  end
  def owner
    @owner ||= @content_page.content.ownable
  end
end
