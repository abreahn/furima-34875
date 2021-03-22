class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_area
  belongs_to :delivery_charge
  belongs_to :delivery_day

  with_options presence: true do
    validates :name
    validates :description
    validates :price
  end
  with_options numericality: { other_than: 1 } do
    validates :category
    validates :condition
    validates :delivery_area
    validates :delivery_charge
    validates :delivery_day
  end
end
