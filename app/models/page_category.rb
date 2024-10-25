class PageCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :pages, dependent: :destroy
end
