class App < ActiveRecord::Base

  has_many :page_apps
  has_many :pages, through: :page_apps

  serialize :private_attrs, Hash
  serialize :public_attrs, Hash

  before_save :fill_attrs_if_empty

  def public_attrs
    self[:public_attrs] ||= {}
  end
  def private_attrs
    self[:private_attrs] ||= {}
  end
  private
  def fill_attrs_if_empty
    private_attrs
    public_attrs
  end
end
