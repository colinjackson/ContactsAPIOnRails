class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :email, uniqueness: { scope: :user_id }

  belongs_to :owner,
  class_name: 'User',
  foreign_key: :user_id,
  primary_key: :id

  has_many :contact_shares, dependent: :destroy
  has_many :shared_users, through: :contact_shares, source: :user

  # Group
  has_many :contact_groupings
  has_many :groups, through: :contact_groupings, source: :group

  # Comment
  has_many :comments, as: :commentable
end
