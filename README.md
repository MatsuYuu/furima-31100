## usersテーブル

|Column  |Type  |Options                  |
|--------|------|-------------------------|
|nickname|string|null: false              |
|email   |string|unique: true,:null: false|
|password|string|null: false              |


### Association

- has_many :items
- has_many :users

## itemsテーブル

|Column     |Type      |Options                        |
|-----------|----------|-------------------------------|
|image      |----      |null: false                    |
|name       |text      |null: false                    |
|explanation|text      |null: false                    |
|category   |text      |null: false                    |
|status     |text      |null: false                    |
|burden     |text      |null: false                    |
|area       |text      |null: false                    |
|days       |datetime  |null: false                    |
|price      |integer   |null: false                    |
|user_id    |references|null: false, foreign_key: true |



### Association

- belongs_to :user
- has_one   :buy


## buysテーブル

|Column |Type      |Options                        |
|-------|----------|-------------------------------|
|user_id|references|null: false, foreign_key: true |
|when   |time      |null: false                    |
|item   |text      |null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_many   :addresses



## addressesテーブル

|Column      |Type  |Options    |
|------------|------|-----------|
|postal_cod  |string|null: false|
|prefectures |string|null: false|
|municipality|string|null: false|
|house_number|string|null: false|
|phone_number|string|null: false|

### Association

- belongs_to :buy