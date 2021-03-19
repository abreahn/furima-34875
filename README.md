## Users テーブル

| Column          | Type   | Options    |
| --------------- | ------ | ---------- |
| nickname        | string | null:false |
| email           | string | null:false |
| password        | string | null:false |
| last_name       | string | null:false |
| first_name      | string | null:false |
| last_name_kana  | string | null:false |
| first_name_kana | string | null:false |
| birthday        | date   | null:false |

### Association
- has_many :items
- has_many :purchases

## Items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| delivery_area   | string     | null: false                    |
| delivery_days   | string     | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase

## Purchase テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :shipping

## Shipping テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association
belongs_to :purchase
