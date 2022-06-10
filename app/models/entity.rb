class Entity < ApplicationRecord
  belongs_to :user
  has_many :groups, dependent: :destroy
  validates :name, presence: true
  validates :amount, presence: true
end
