class PageTemplate < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :template
end
