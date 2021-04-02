## Users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null:false               |
| email              | string | null:false, unique: true |
| encrypted_password | string | null:false               |
| last_name          | string | null:false               |
| first_name         | string | null:false               |
| last_name_kana     | string | null:false               |
| first_name_kana    | string | null:false               |
| birthday           | date   | null:false               |

### Association
- has_many :items
- has_many :purchases

## Items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| delivery_area_id   | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase
has_many :item_tag_relations
has_many :tags, through: :item_tag_relations

## Tags テーブル
| Column    | Type   | Options                   |
| --------- | ------ | ------------------------- |
| tag_name  | string | null: false, unique: true |

### Association
has_many :item_tag_relations
has_many :items, through: :item_tag_relations

## Item_tag_relations テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### Association
belongs_to :item
belongs_to :tag

## Purchases テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :shipping

## Shippings テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| delivery_area_id | integer    | null: false                    |
| city             | string     | null: false                    |
| addresses        | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association
belongs_to :purchase
