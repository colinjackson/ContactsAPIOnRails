class ContactGrouping < ActiveRecord::Base
  validates :group_id, :contact_id, presence: true
  validates :contact_id, uniqueness: { scope: :group_id }

  belongs_to :group
  belongs_to :contact
end
