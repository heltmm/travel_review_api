class Review < ApplicationRecord
  belongs_to :destination

  validates :author, presence: true
  validates :content, presence: true
  validates :rating, presence: true
  validates :destination_id, presence: true
end
