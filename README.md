# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| nickname           | string | null: false               |
| profile            | text   |                           |
| email              | string | null: false ,unique: true |
| encrypted_password | string | null: false               |
| twitter_url        | string |                           |
| pixiv_url          | string |                           |
| another_url        | string |                           |
  
### Association

- has_many :posts
- has_many :comments
- has_many :likes
- has_many :tranings

## posts テーブル

| Column               | Type       | Options                        |
| ---------------------| ---------- | -------------------------------|
| title                | string     | null: false                    |
| description          | text       |                                |
| advice_flag          | boolean    | null: false                    |
| traning_flag         | boolean    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- has_many    :likes
- has_many    :comments
- has_many    :tranings
- belongs_to  :user

## comments テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| text         | text       | null: false                    |
| good_point   | text       | null: false                    |
| advice       | text       |                                |
| user         | references | null: false, foreign_key: true |
| post         | references | null: false, foreign_key: true |

### Association

- belongs_to  :user
- belongs_to  :post

## likes テーブル

| Column                | Type       | Options                        |
| ----------------------| ---------- | -------------------------------|
| user                  | references | null: false, foreign_key: true |
| post                  | references | null: false, foreign_key: true | 

### Association

- belongs_to  :user
- belongs_to  :post

## tranings テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| theme_text   | text       | null: false                    |
| user         | references | foreign_key: true              |
| post         | references | foreign_key: true              |

### Association

- belongs_to  :user
- belongs_to  :post
