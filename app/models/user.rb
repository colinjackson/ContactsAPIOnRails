class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  # Contacts
  has_many :contacts, dependent: :destroy
  has_many :contact_shares, dependent: :destroy
  has_many :shared_contacts, through: :contact_shares, source: :contact

  # Groups
  has_many :group_follows
  has_many :groups, through: :group_follows, source: :group
end
