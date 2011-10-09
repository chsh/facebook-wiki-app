class PageApp < ActiveRecord::Base
  belongs_to :page
  belongs_to :app
  has_one :content, as: :ownable

  before_create :enable_content

  def self.from(params)
    page_id = page_id_from_params params
    app_id = app_id_from_params params
    self.transaction do
      self.find_by_app_id_and_page_id(app_id, page_id) ||
          self.create(app_id: app_id, page_id: page_id)
    end
  end
  private
  def enable_content
    self.content ||= Content.new
  end
  def self.app_id_from_params(params)
    return params[:app_id] if params[:app_id]
    return params[:app].id if params[:app]
  end
  def self.page_id_from_params(params)
    return params[:page_id] if params[:page_id]
    return params[:page].id if params[:page]
  end
end
