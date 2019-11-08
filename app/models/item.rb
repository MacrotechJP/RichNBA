class Item < ApplicationRecord

  has_many :users, through: :group_users
  has_many :item_users

end
