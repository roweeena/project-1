class User < ApplicationRecord
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  has_many :items
  
  # "names" the Review join table for accessing through the reviewer association
  has_many :sent_reviews, foreign_key: :reviewer_id, class_name: "Review", dependent: :destroy
  has_many :received_reviews, foreign_key: :reviewee_id, class_name: "Review", dependent: :destroy


end
