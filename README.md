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

| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| nickname   | string | null: false               |
| email      | string | null: false, unique: true |
| password   | string | null: false               |
| full_name  | string | null: false               |
| birthday   | string | null: false               | 


### Association

- has_many :items
- has_many :buy_items

# テーブル設計

## itemsテーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| name       | string     | null: false       |
| description| text       | null: false       |
| category   | text       | null: false       |
| condition  | text       | null: false       |
| fee        | string     | null: false       |
| area       | string     | null: false       |
| days       | string     | null: false       |
| price      | string     | null: false       |
| user       | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buy_item

# テーブル設計

## buy_itemsテーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| address | references | foreign_key: true |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :address

# テーブル設計

## addressテーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------  |
| postal-code| string | null: false |
| prefecture | string | null: false |
| city       | string | null: false |
| address    | string | null: false |
| number     | string | null: false |


### Association

- has_many :buy_items
