class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :delivery_area_id, :city, :addresses, :building, :phone_number, :purchase_id, :image, :number, :exp_month, :exp_year, :cvc, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :delivery_area_id, numericality: {other_than: 1, message: "select"}
    validates :city
    validates :addresses
    validates :phone_number, format: {with: /\A\d{1,11}\z/, message: "input only number within 11 digits"}
    validates :token
  end
    
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, addresses: addresses, phone_number: phone_number, purchase_id: purchase.id)
  end
end