FactoryBot.define do
  factory :item_tag do
    tag_name          { 'tag名'}
    name              { '商品名' }
    description       { '商品説明' }
    category_id          { 2 }
    condition_id         { 2 }
    delivery_charge_id   { 2 }
    delivery_area_id     { 2 }
    delivery_day_id      { 2 }
    price { 1000 }

  end
end
