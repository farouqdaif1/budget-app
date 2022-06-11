class Group < ApplicationRecord
  belongs_to :user
  # has_many :entities, dependent: :destroy
  has_and_belongs_to_many :entities, dependent: :destroy

  validates :name, presence: true

  has_one_attached :image
end
