class Profile < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_one_attached :image

  with_options presence: true do
    validates :sex_id
    validates :age
    validates :residence_id
    validates :rope_patron_id
  end

  with_options numericality: { only_integer: true } do
    validates :age
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  belongs_to :residence
  belongs_to :rope_patron

  with_options numericality: { other_than: 1 } do
    validates :sex_id
    validates :residence_id
    validates :rope_patron_id
  end
end
