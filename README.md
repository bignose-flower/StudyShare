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
スピーディに質問のやりとりができるような仕組みを実装（例）メール通知、回答にajaxを採用等...

# BackBorn

高校生時代の時に学校科目専用の質問サイトがあればと思っていたことが作成のきっかけ。
また、質問があればすぐに答えが欲しいのが人の性質だと思い、スピーディなレスポンスを実装した。
作者自身も汎用質問サイトを利用していたが、回答が来るのは一日以上かかることが多い。
その間、質問に対してモヤモヤの感情を抱いたまま過ごすことはあまり好まないはずだ。



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

### 質問をする
<a href="https://gyazo.com/239bac16d7dd27b9eb8e8a32cef82f7d"><img src="https://i.gyazo.com/239bac16d7dd27b9eb8e8a32cef82f7d.gif" alt="Image from Gyazo" width="1000"/></a>

### 答える
<a href="https://gyazo.com/eb08f04750b689c36e629eb452dfb035"><img src="https://i.gyazo.com/eb08f04750b689c36e629eb452dfb035.gif" alt="Image from Gyazo" width="1000"/></a>

### カテゴリーから検索
<a href="https://gyazo.com/6bdd83f1f57e62d2077b639c7ae88288"><img src="https://i.gyazo.com/6bdd83f1f57e62d2077b639c7ae88288.gif" alt="Image from Gyazo" width="1000"/></a>

# update
- お気に入りの質問内容や今後の学習に活かせる質問を一つにまとめる「ノート」機能を作成
- カテゴリー検索を孫階層にまで至って検索可能
- 質問内容入力時にテキストのプレビューができるようにする。ハイライトなどの文字を装飾できる機能を実装する。

# Author

* Takuya

# License

StudyShare is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).
