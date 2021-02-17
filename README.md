# アプリ名
RopeWay
# 概要
ヒモとパトロンのマッチングアプリ
# URL

# テスト用アカウント

# 利用方法
1. ユーザー登録
2. 他ユーザーのプロフィールを閲覧
3. 気になったユーザーにいいねをつける
4. お互いがいいねをつけたらトークルームが作成できる
5. トークルーム内でさらにお互いのことを知る

# 目指した課題解決
既存のマッチングアプリではなかなか言い出しづらい、「将来の関係性」についてのミスマッチを改善するために作成。
「趣味友」「飲み友」「恋人」など様々な関係がある中でも「ヒモとパトロン」という関係に特化したマッチングサービス。

# 要件
- ユーザー管理
- プロフィール
- いいね
- トークルーム
- 検索
- タグ

# 実装した機能

# 実装予定の機能

# データベース設計

### users テーブル
| Column             | Type    | Options                   |
| ------------------ | --------| ------------------------- |
| name               | string  | null: false,              |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false,              |
| phone              | string  | null: false, unique: true | 
#### Association
- has_one :profile
- has_many :likes
- has_many :messages

### profiles テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user(FK)           | references | null: false, foreign_key: true |
| self_pr            | text       | null: false,                   |
| sex                | integer    | null: false, foreign_key: true |
| age                | integer    | null: false,                   |
| residence_id       | integer    | null: false,                   |
| rope_patron_id     | integer    | null: false,                   |
#### Association
- belongs_to :user
- has_many :likes

### likes テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user(FK)     | references | null: false, foreign_key: true |
| profile(FK)  | references | null: false, foreign_key: true |
#### Association
- belongs_to :user
- belongs_to :profile
- has_many :messages

### messages テーブル
 <!-- chatappのmessagesテーブルを参照  -->
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| content           | text       | null: false,                   |
| user(FK)          | references | null: false, foreign_key: true |
| like(FK)          | references | null: false, foreign_key: true |
#### Association
- belongs_to :like
- belongs_to :user

# ローカルでの動作方法
