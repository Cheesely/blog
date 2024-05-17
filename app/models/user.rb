class User < ApplicationRecord
  has_secure_password :password, validations:true
  has_many :articles
  has_many :comments
  validates :name, presence: true, uniqueness: true
end
