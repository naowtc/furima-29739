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
- has_many :purchases

## items テーブル

| column           | type       | option                        |
|------------------|------------|-------------------------------|
| user             | references | null:false foreign_key: true  |
| name             | string     | null:false                    |
| description      | text       | null:false                    |
| price            | integer    | null:false                    |
| images_id        | integer    | null:false                    |
| category_id      | integer    | null:false                    |
| condition_id     | integer    | null:false                    |
| postage_payer_id | integer    | null:false                    |
| prefecture_id    | integer    | null:false                    |
| shipment_time_id | integer    | null:false                    |

### Association
- has_one :purchases
- has_one :images
- belong_to :users


## images テーブル

| column | type       | option                        |
|--------|------------|-------------------------------|
| image  | string     | null:false                    |
| item   | references | null:false foreign_key: true |

### Association
- belong_to :items



## addresses テーブル

| column           | type       | option                        |
|------------------|------------|-------------------------------|
| user             | references | null:false foreign_key: true  |
| name             | string     | null:false                    |
| description      | text       | null:false                    |
| price            | integer    | null:false                    |
| images_id        | integer    | null:false                    |
| category_id      | integer    | null:false                    |
| condition_id     | integer    | null:false                    |
| postage_payer_id | integer    | null:false                    |
| prefecture_id    | integer    | null:false                    |
| shipment_time_id | integer    | null:false                    |

### Association
- has_one :purchases



## purchases テーブル

| column | type       | option                        |
|--------|------------|-------------------------------|
| item   | references | null:false foreign_key: true  |
| user   | references | null:false foreign_key: true  |

### Association
- belong_to :items
- belong_to :addresses
- belong_to :users
