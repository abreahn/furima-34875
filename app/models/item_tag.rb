class ItemTag

    include ActiveModel::Model
    attr_accessor :item_id, :tag_name, :name, :description, :category_id, :condition_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price, :user_id, :image

    
    with_options presence: true do
      validates :tag_name
      validates :name
      validates :description
      validates :price
      validates :image
    end
  
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :delivery_area_id
      validates :delivery_charge_id
      validates :delivery_day_id
    end
  
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'は300〜9999999の範囲の半角数字で設定してください' }

    def save
      item = Item.create(name: name, description: description, category_id: category_id, condition_id: condition_id, delivery_charge_id: delivery_charge_id, delivery_area_id: delivery_area_id, delivery_day_id: delivery_day_id, price: price, user_id: user_id, image: image)
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save

      ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
    end
end