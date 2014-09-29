class Group < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  # Users
  has_many :group_follows
  has_many :users, through: :group_follows, source: :user

  # Contacts
  has_many :contact_groupings
  has_many :contacts, through: :contact_groupings, source: :contact
end
