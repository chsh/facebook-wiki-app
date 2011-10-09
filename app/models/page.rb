class Page < ActiveRecord::Base
  has_many :page_apps
  has_many :apps, through: :page_apps

  has_one :content, as: :ownable

  before_create :enable_content

  def self.from_signed_request(signed_request)
    instance = Page.find_by_app_id signed_request.page.id
    if instance.blank?
      instance = Page.create(app_id: signed_request.page.id)
    end
    instance
  end

  private
  def enable_content
    self.content ||= Content.new
  end
end
