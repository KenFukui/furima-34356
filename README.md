# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_read          | string | null: false               |
| first_read         | string | null: false               |
| encrypted_password | string | null: false               |
| birthday           | date   |                           | 


### Association

- has_many :items
- has_many :buy_items

# テーブル設計

## itemsテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| name          | string     | null: false       |
| description   | text       | null: false       |
| category_id   | integer    | null: false       |
| condition_id  | integer    | null: false       |
| fee_id        | integer    | null: false       |
| prefecture_id | integer    | null: false       |
| days_id       | integer    | null: false       |
| price         | integer    | null: false       |
| user          | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :buy_item

# テーブル設計

## buy_itemsテーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

- belongs_to :item
- has_one :address
- belongs_to :user

# テーブル設計

## addressesテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal-code   | string     | null: false       |
| city          | string     | null: false       |
| prefecture_id | integer    | null: false       |
| building      | string     | null: false       |
| address       | string     | null: false       |
| number        | string     | null: false       |
| buy_item      | references | foreign_key: true |


### Association

- belongs_to :buy_item
