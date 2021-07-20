class Group < ApplicationRecord
  attachment :image
  validates :name, presence: true
  validates :introduction, presence: true

  has_many :groups_users
  has_many :users, through: :group_users
end
