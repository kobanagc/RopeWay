# Application
RopeWay

# Outline
Matching App between a patron and people who financially depends on others 

# URL


# Test
### Basic authentication
- ID:kbno
- pass:8878 
### Account for test
- ID:sample@sample.com
- pass:sample

# How to use
1. Register user
2. View other user profiles
3. Like a profile of other people who you like 
4. Exchange messages if you like each other

# Requirements
- User management
- Like 
- Message
- Search
- Tag

# Database design
### users table
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| phone              | string  | null: false, unique: true | 
| self_pr            | text    |                           |
| sex                | integer | null: false               |
| age                | integer | null: false               |
| residence_id       | integer | null: false               |
| rope_patron_id     | integer | null: false               |
#### Association
- has_many :likes
- has_many :rooms, through: room_users
- has_many :room_users
- has_many :messages


### likes table
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| by_user_id | references | null: false, foreign_key: true |
| to_user_id | references | null: false, foreign_key: true |
#### Association
- belongs_to :user

### rooms table
| Column | Type | Options |
| ------ | ---- | ------- |
|        |      |         |
#### Association
- has_many :users, through: room_users
- has_many :room_users

### room_users table
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |
#### Association
- belongs_to :room
- belongs_to :user

### messages table
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |
#### Association
- belongs_to :room
- belongs_to :user

### Packages
- devise
- pry-rails
- mini_magick
- image_processing '~> 1.2'
- active_hash

### Version
- rails '~> 6.0.3'