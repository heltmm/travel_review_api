class Destination < ApplicationRecord
  has_many :reviews

  validates :country, presence: true
  validates :city, presence: true
  validates :name, presence: true

end
