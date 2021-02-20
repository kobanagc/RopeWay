class Like < ApplicationRecord
  belongs_to :user
  belongs_to :profile

  with_options presence: true do
    validates :user_id
    validates :profile_id
  end
end
