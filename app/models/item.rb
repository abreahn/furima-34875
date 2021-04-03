class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_area
  belongs_to :delivery_charge
  belongs_to :delivery_day
end
