class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :delivery_area, :city, :addresses, :building, :phone_number, :purchase_id

  with_options presence: ture do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :delivery_area_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :addresses
    validates :phone_number, numericality: {only_integer: true, length: { in: ..11}}
    validates :purchase_id
  end
    
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, addresses: addresses, phone_number: phone_number, purchase_id: purchase_id)
  end
end