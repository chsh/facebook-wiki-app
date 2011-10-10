class Content < ActiveRecord::Base
  has_many :pages, class_name: 'ContentPage', dependent: :delete_all
  serialize :content, Hash

  belongs_to :ownable, polymorphic: true

  before_create :fill_content_default

  def default_page
    self.pages.by_name self.content[:default_name]
  end
  def default_name
    self.content[:default_name]
  end

  private
  def fill_content_default
    (self[:content] ||= {})[:default_name] ||= 'wiki'
  end
end
