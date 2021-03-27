FactoryBot.define do
  factory :purchase_shipping do
    postal_code { '111-1111' }
    delivery_area_id { 2 }
    city { '東京都' }
    addresses { '1-1' }
    building { 'アパート' }
    phone_number { '09012345678' }
  end
end
