#テーブル設計

##usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :cats


##catsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| birthday            | date       | null: false                    |
| favorite            | integer    |                                |
| gender_id           | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :healths


##healthsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| food_id   | integer    | null: false                    |
| tulle_id  | integer    | null: false                    |
| play_id   | integer    | null: false                    |
| poop_id   | integer    | null: false                    |
| pee_id    | integer    | null: false                    |
| comment   | string     | null: false                    |
| cat       | references | null: false, foreign_key: true |

### Association

- belongs_to :cat

