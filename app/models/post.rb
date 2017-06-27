class Post < ApplicationRecord
  validates :title, :author, presence: true
  validates :sub_ids, length: { minimum: 1 }

  has_many :post_subs, dependent: :destroy, inverse_of: :post

  belongs_to :author,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: "User"

  has_many :subs,
  through: :post_subs,
  source: :sub

  has_many :comments


end
