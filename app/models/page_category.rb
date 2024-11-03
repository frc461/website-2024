class PageCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: %i[slugged history]
  has_many :pages, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name

  def should_generate_new_friendly_id?
    name_changed?
  end
end
