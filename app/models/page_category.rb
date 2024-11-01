class PageCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :pages, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
end
