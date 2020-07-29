# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# Name

StudyShare

# URL

<a href="studyshareapp.herokuapp.com">StudyShare</a>

# Features

中学生、高校生を対象にした専用学習質問サイト。
学校の学習カリキュラム別にカテゴリーを作成したので、ピンポイントの分野で質問ができる。
また、メール通知をONにすると、他者から質問が届いた時、他者から答えが送信された時にメール通知が送られる。
スピーディに質問のやりとりができるので、モヤモヤをすぐに解消できる。

# Requirement

*rails 6.0.0
*ruby 3.5.4
*jquery-rails 4.4.0

# Installation
```command line
$ git clone https://github.com/bignose-flower/StudyShare.git
$ cd StudyShare
$ bundle install
$ yarn install
$ rails db:create
$ rails db:migrate
$ rails s
```
👉 http://localhost:3000

# DataBase
<img width="675" alt="スクリーンショット 2020-07-29 17 03 16" src="https://user-images.githubusercontent.com/66852865/88773687-6878e900-d1bd-11ea-9e29-68634848e7c1.png">

## Users

| column                | type    | options    |
| --------------------- | ------- | ---------- |
| id                    | integer |            |
| email                 | string  | null:false |
| passworfd             | string  | null:false |
| password_confirmation | string  | null:false |
| name                  | string  | null:false |
| image                 | text    |            |
| job                   | text    | null:false |
| Birth_date            | date    | null:false |

### asscoiations
- has_many :questions
- has_many :answers

## Questions

| column     | type       | options          |
| ---------- | ---------- | ---------------- |
| id         | integer    |                  |
| title      | string     | null:false       |
| question   | text       | null:false       |
| subject_id | references | foreign_key:true |
| user_id    | references | foreign_key:true |
| Is_solved  | boolean    |                  |

### associations
- belongs_to :user
- belongs_to :subject
- has_many :answers

## Answers

| column      | type       | options           |
| ----------- | ---------- | ----------------- |
| id          | integer    |                   |
| answer      | string     | null:false        |
| user_id     | references | foreign_key: true |
| question_id | references | foreign_key:true  |

### associations
- belongs_to :user
- belongs_to :question

## Subjects

| column   | type    | options    |
| -------- | ------- | ---------- |
| id       | integer |            |
| category | string  |            |
| ancestry | string  | index:true |

### associations
- has_many :questions
- has_ancestry


# Usage



# Author

* Takuya

# License

StudyShare is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).
