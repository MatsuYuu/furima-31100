## usersテーブル

|Column         |Type   |Options                  |
|---------------|-------|-------------------------|
|nickname       |string |null: false              |
|email          |string |null: false, unique: true|
|password       |string |null: false              |
|last_name      |string |null: false              |
|first_name     |string |null: false              |
|last_name_kana |string |null: false              |
|first_name_kana|string |null: false              |
|birth_date_id  |date   |null: false              |

### Association

- has_many :items
- has_many :buys

## itemsテーブル

|Column     |Type      |Options                        |
|-----------|----------|-------------------------------|
|name       |text      |null: false                    |
|explanation|text      |null: false                    |
|category_id|integer   |null: false                    |
|status_id  |integer   |null: false                    |
|burden_id  |integer   |null: false                    |
|area_id    |integer   |null: false                    |
|days_id    |integer   |null: false                    |
|price      |integer   |null: false                    |
|user       |references|null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one   :buy


## buysテーブル

|Column |Type      |Options                        |
|-------|----------|-------------------------------|
|user   |references|null: false, foreign_key: true |
|item   |references|null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_many   :addresses



## addressesテーブル

|Column         |Type      |Options                        |
|---------------|----------|-------------------------------|
|postal_code    |string    |null: false                    |
|prefectures_id |integer   |null: false                    |
|municipality   |string    |null: false                    |
|house_number   |string    |null: false                    |
|building_name  |string    |                               |
|phone_number   |string    |null: false                    |
|buy            |references|null: false, foreign_key: true |

### Association

- belongs_to :buy