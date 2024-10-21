class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :page_assets, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    [ 'html_cache', 'title' ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ 'page_assets' ]
  end
end
