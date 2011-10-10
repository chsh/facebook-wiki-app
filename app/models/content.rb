class Content < ActiveRecord::Base
  has_many :pages, class_name: 'ContentPage', dependent: :delete_all
  serialize :content, Hash

  belongs_to :ownable, polymorphic: true

  before_save :fill_content_default

  def default_page
    self.pages.by_name self.content[:default_name]
  end

  def content
    self[:content] ||= {default_name: 'wiki'}
  end

  private
  def fill_content_default
    # call for initialization.
    self.content
  end
end
