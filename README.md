# テーブル設計

## users テーブル

| column          	| type   	| option     	|
|-----------------	|--------	|------------	|
| nickname        	| string 	| null:false 	|
| email           	| string 	| null:false 	|
| password        	| string 	| null:false 	|
| last_name       	| string 	| null:false 	|
| first_name      	| string 	| null:false 	|
| last_name_kana  	| string 	| null:false 	|
| first_name_kana 	| string 	| null:false 	|
| birth_date      	| date   	| null:false 	|

### Association
- has_many :items
- has_many :orders

## items テーブル

| column           | type       | option                        |
|------------------|------------|-------------------------------|
| user             | references | null:false foreign_key: true  |
| name             | string     | null:false                    |
| description      | text       | null:false                    |
| price            | integer    | null:false                    |
| category_id      | integer    | null:false                    |
| condition_id     | integer    | null:false                    |
| postage_payer_id | integer    | null:false                    |
| prefecture_id    | integer    | null:false                    |
| shipment_time_id | integer    | null:false                    |

### Association
- has_one :order
- belongs_to :user


## ship_addresses テーブル

| column         | type       | option                        |
|----------------|------------|-------------------------------|
| post_code      | string     | null:false                    |
| prefectures_id | integer    | null:false foreign_key: true  |
| city           | string     | null:false                    |
| house_number   | string     | null:false                    |
| building_name  | string     |                               |
| phone_number   | string     | null:false                    |
| order          | references | null:false foreign_key: true  |

### Association
- belongs_to :order



## orders テーブル

| column | type       | option                        |
|--------|------------|-------------------------------|
| item   | references | null:false foreign_key: true  |
| user   | references | null:false foreign_key: true  |

### Association
- belongs_to :item
- has_one :ship_address
- belongs_to :user

