class PageTemplate < ApplicationRecord
  has_paper_trail ignore: :updated_at

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :template

  def self.ransackable_attributes(auth_object = nil)
    [ "name" ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["versions"]
  end
end
