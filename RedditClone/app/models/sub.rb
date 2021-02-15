class Sub < ApplicationRecord
  validates :title, :description, :user_id, presence: true
  validates :title, uniqueness: true

  belongs_to :moderator
    foreign_key: :user_id
    class_name: :User

  
end
