module ContentPagesHelper
  def edit_path
    if owner.is_a?(PageApp)
      edit_page_app_content_page_path(page_app_id: owner, id: @content_page.name)
    else # @page should be exist.
      edit_page_content_page_path(page_id: owner, id: @content_page.name)
    end
  end
  def show_path
    if owner.is_a?(PageApp)
      page_app_content_page_path(page_app_id: owner, id: @content_page.name)
    else # @page should be exist.
      page_content_page_path(page_id: owner, id: @content_page.name)
    end
  end
  def with_wiki_links(html)
    html.gsub(/\[\[(.+?)\]\]/) do |match|
      if owner.is_a?(PageApp)
        page_app_content_page_path(page_app_id: owner.id, id: key)
      else
        page_content_page_path(page_id: owner.id, id: key)
      end
    end
  end
  def owner
    @owner ||= @conent_page.content.ownable
  end
end
