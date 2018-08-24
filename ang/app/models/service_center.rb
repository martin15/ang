class ServiceCenter < ApplicationRecord
  belongs_to  :brand

  validates :name, presence: true
  validates :detail, presence: true
end
