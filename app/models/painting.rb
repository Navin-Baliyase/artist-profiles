class Painting < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  scope :visible, -> { where(public: true) }
end
