class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  validates_presence_of :name

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "email" ]
  end

  def password_required?
    new_record?
  end
end
