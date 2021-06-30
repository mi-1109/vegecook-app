# VegeCook
**VegeCookは、ベジタリアン向けの料理レシピを投稿＆シェアするWebアプリケーションです！**<br />

<img width="1020" src="https://user-images.githubusercontent.com/78330037/120973427-e4629b00-c7a9-11eb-9a56-57e5f57579aa.png">

URL: https://vege-cook.net

```
【会員ユーザーアカウント】
   メールアドレス： veggie-life-2@example.com
   パスワード： testtest

【管理者アカウント】
   メールアドレス： vegecook-admin@example.com
   パスワード： testtest

 ※別途「ゲストログイン機能」（ワンクリックでログインが可能な機能）も実装していますので、ぜひそちらもご利用ください。
```

<br />
お忙しい方にもご覧いただきやすいよう、動作デモ（４分間）を編集しました。ぜひご覧ください。

[<img src="https://user-images.githubusercontent.com/78330037/121203540-24607580-c8b1-11eb-9fd7-dcc10c483cbd.png" width="400" target="_blank" rel="noopener noreferrer">](https://youtu.be/1dDTJvwODIg)
<br />
※YouTubeが開きます<br />
※やや駆け足の編集ですので、速すぎる場合はYouTube上で再生スピードを0.75倍等にしてご覧ください

<br />

## サイト概要
**VegeCook** は、健康・ダイエット・環境問題など、様々な問題意識から、ベジタリアンや菜食中心の食生活に関心のある人が、手軽に安心してレシピを検索・共有できるサービスです。

- レシピを検索、投稿、ランキング表示できる
- コメントや"いいね"をしたり、気になるレシピの保存（ブックマーク）、閲覧履歴の確認ができる
- 無料会員・有料会員によって利用可能な機能が分かれる

実装機能の詳細は、[機能一覧](#機能一覧)をご確認ください。

### ◆サイトテーマ
**Be the Veggie, Green Your Life** <br />
「健康」への第一歩を応援するレシピ・サイト

### ◆テーマを選んだ理由
「ベジタリアン・レシピの提供を通じて、自身や家族、そして地球の健康を考える人の第一歩を応援する」<br />
  これが、**VegeCook** に込めた想いです。

近年、自身や家族の健康やダイエットの観点から、菜食中心の食事に関心を持つ人、<br />
環境問題や動物福祉の問題に対し、自分にできることはないかと考え、ベジタリアンになる人など、<br />
様々な理由から、ベジタリアンや、肉や魚を採りすぎない食事を意識する人が増えています。

私も、その一人でした。

ところが、日本のレシピサイトにはベジタリアンのレシピがとても少なく、様々なサイトを何十分もかけて検索し、栄養的に問題がないか、肉や魚・乳製品が使われていないか、自分で判断しなければならず、食生活を変えることは容易ではありませんでした。

そこで**VegeCook**は、様々な理由から、菜食中心のレシピを求める人の検索のハードルを下げると同時に、個々人が持つレシピの知見を投稿・共有し、和を広げていく料理レシピのコミュニティ・サイトとなることで、ベジタリアンやベジタリアンになりたいと願う人々、日々の食生活の一部だけでも菜食にチャレンジしたい人を応援します。

### ◆ターゲットユーザー
- 20代〜40代の女性
- 健康やダイエットの観点から菜食中心のレシピに関心のある人
- 植物性食品を多く取り入れたレシピに関心のある人
- ベジタリアンに挑戦してみたいが、レシピ探しに時間をかけられない人
- すでにベジタリアンで、レシピを共有したい人
- すでにベジタリアンで、新しいレシピを探している人

<br />

## 工夫・意識したポイント
**1. 徹底的なユーザー目線** <br />
お客様の課題を解決するためのサービス作りであることを常に意識し、単に「見せる」ための作品ではなく、レシピ探しに困っている人が「使い続けたい」と思えるサービスとなるよう、直感的に使用できる機能やレイアウトを考え抜き、作成しました。例として、2つの機能をご紹介します：

  - **投稿フォームにおける入力欄の追加・削除機能** <br />
     投稿を書き上げる中で、行の削除や追加が必要となるユーザーは多いのではないか？と考え、JavaScriptで実装しました。<br />
  　　![Videotogif 投稿](https://user-images.githubusercontent.com/78330037/121209936-3a246980-c8b6-11eb-8a88-631bed209ac9.gif)

  - **下書き保存機能** <br />
     内容は書き終えたが写真は後日撮って公開したい、といった状況は容易に発生し得るため、ユーザーにとっての利便性を考慮し下書き保存機能を実装しました。<br />
     ![Videotogif](https://user-images.githubusercontent.com/78330037/121211262-4e1c9b00-c8b7-11eb-9fe4-f3d655261605.gif)

**2. レスポンスの向上** <br />
当初VegeCookはトップページの画像の読み込みに最長30秒を要しており、ユーザーにとってストレスフルな状態でした。<br />
そこで、レスポンスを向上できないか、初心者なりに一から調べて改善に取り組み、オブジェクトストレージ（S3)とAPI（imgix)を利用することで、結果的に**1.7秒で表示**できるようになりました。<br />

このように、ユーザーの視点で考え、実装したい・すべき機能を諦めずに実装し切ることに注力した結果、レスポンスの向上をはじめとして一つずつ課題を解決することができました。

なお、imgixは日本語のドキュメントや技術記事がほとんど無く、バイリンガルであることを活かし、公式ドキュメントを頼りに実装していきました。実装過程は[Qiita](https://qiita.com/mi-1109/items/df493afb513c71a89b8a)にまとめていますので、ぜひご覧ください。

**3. 擬似的なチーム開発を意識** <br />
VegeCookは個人開発ではありましたが、業務では常にチーム開発となることから、GitHubでの一連の工程（イシュー発行 → 作業ブランチ作成 → 開発 → プッシュ → プルリク発行 → レビュー → developブランチへのマージ等）を意識的に再現して取り組みました。また、Git以外にも、『リーダブルコード』を参考に他者がレビューしやすいコードやコメントの記述を心がけました。

<br />

## 設計書
### ◆ER図
<img src="https://user-images.githubusercontent.com/78330037/120970820-e545fd80-c7a6-11eb-94e4-84c387403678.png" width="800">

### ◆UI Flow
**会員側** <br />
<img src="https://user-images.githubusercontent.com/78330037/120989611-b174d300-c7ba-11eb-8404-876155938448.png" width="700">

**管理者側** <br />
<img src="https://user-images.githubusercontent.com/78330037/120983013-44f6d580-c7b4-11eb-88e6-fbe1ab361351.png" width="700">

### ◆インフラ構成図
<img src="https://user-images.githubusercontent.com/78330037/121101404-bd9e7600-c836-11eb-8f73-cd47651f360a.png" width="700">

## 機能一覧
### ◆顧客側の機能
| 機能 | 非ログイン時利用可否 | 無料会員利用可否 | 有料会員利用可否 |
| ------------- | :-------------: |:-------------: | :-------------: |
| 無料会員登録  | ○ | × | × |
| 有料プラン登録 | × | ○ | × |
| ログイン | ○ | ○ | ○ |
| ログアウト | × | ○ | ○ |
| 退会 | × | ○ | ○ |
| レシピ投稿 | × | ○ | ○ |
| レシピ編集 | × | ○ | ○ |
| レシピ削除 | × | ○ | ○ |
| レシピ下書き | × | ○ | ○ |
| レシピ閲覧履歴 | × | ○ | ○ |
| レシピブックマーク（Ajax) | × | ○（5件まで） | ○（無制限） |
| レシピ検索 | ○ | ○ | ○ |
| 新着レシピ表示 | ○ | ○ | ○ |
| ランキング表示 | × | × | ○ |
| レシピいいね（Ajax) | × | ○ | ○ |
| コメント投稿 （Ajax)| × | ○ | ○ |
| コメント削除 （Ajax)| × | ○ | ○ |
| 会員詳細表示 | ○ | ○ | ○ |
| 会員情報編集 | × | ○ | ○ |
| フォロー（Ajax) | × | ○（5名まで） | ○（無制限） |
| チャット送信（Ajax) | × | ○ | ○ |
| 問い合わせフォーム送信 | × | ○ | ○ |

※有料プランは、①レシピ人気順表示、②無制限のフォロー、③無制限のブックマーク機能が利用できます。

### ◆管理者側の機能
| 機能 | 非ログイン時利用可否 |
| ------------- | :-------------: |
| ログイン | ○ |
| ログアウト | × |
|レシピ一覧表示 | × |
|レシピ詳細表示 | × |
|レシピ削除 | × |
|会員一覧表示 | × |
|会員詳細表示 | × |
|会員退会 | × |
|問い合わせ一覧表示（フォーム） | × |
|問い合わせ詳細表示（フォーム） | × |
|問い合わせ対応ステータス管理  | × |
|問い合わせ一覧表示（チャット） | × |
|問い合わせ詳細表示（チャット） | × |
|チャット送信 | × |

### ◆その他導入技術等
- 自動メール：問い合わせ確認メール配信
- バッチ処理：閲覧履歴の定時削除
- レスポンシブ（Bootstrap)
- 自動デプロイ（GitHub Actions)
- オブジェクトストレージ（S3)
- API（imgix）
- 例外発生時の通知機能（CloudWatch)

#### 使用ライブラリ
- devise（ログイン認証）
- refile, mini_magick, CarrierWave（画像投稿）
- imgix-rails（画像最適化）
- fog_aws（S3への画像アップロード）
- ransack （検索）
- RuboCop（静的コード解析）
- RSpec, FactoryBot, Faker（単体テスト）
- Capybara(統合テスト）
- kaminari（ページネーション）
- enum_help（enumのI18n化）
- whenever（バッチ処理）
- bullet（N+1問題）
- gretel（ぱんくずリスト）
- dotenv-rails（環境変数）
- squasher（マイグレーションファイル集約）
- pry-byebug（デバッグ）

### ◆今後追加したい機能等
- 通知機能
- お気に入りのレシピをスケジュール上に登録する機能（有料会員向け）
- 季節等に応じたレシピのおすすめ機能
- 肉類の投稿を除外する機能
- 網羅的なテストの記述
- GitHub Actionsでテストを自動化
- セキュリティ対策

<br />

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails, Bootstrap
- JSライブラリ：jQuery
- IDE：Cloud9

<br/>

## 使用素材
**【画像素材】**　<br />
- O-DAN (<https://o-dan.net/ja/>)

**【イラスト】** <br />
- illust AC (<https://www.ac-illust.com/>)
- Designed by coolvector / Freepik (<https://www.freepik.com>)
- FLAT ICON DESIGN (<http://flat-icon-design.com/>)

**【アイコン・ロゴ】** <br />
- Adobe Spark (<https://www.adobe.com/jp/products/spark.html>)
- エーオーシステム (<https://ao-system.net/alphaicon/>)
- ICOON MONO (<https://icooon-mono.com/>)

## さいごに
本アプリケーションの実装過程で学んだことについて、[Qiita](https://qiita.com/mi-1109)や[Twitter](https://twitter.com/mi_prog)でも発信しております。<br />
ぜひご覧いただければ幸いです。

Qiitaに投稿した本アプリの関連記事：
- [【図解】初心者が知っておきたいサーバ周りの仕組みの話](https://qiita.com/mi-1109/items/a8e5cfa0637ba2925b59)（2021年6月15日時点：694LGTM/797Stock）
- [30秒かかった画像表示を1.7秒に改善した話（imgix + S3 + CarrierWave）](https://qiita.com/mi-1109/items/df493afb513c71a89b8a)
- [【Rails】fields_forを使って同一フォームで別のモデルオブジェクトを編集する](https://qiita.com/mi-1109/items/82bde86493072e2dd2a4)
- [【Rails】下書き機能を実装してみる](https://qiita.com/mi-1109/items/4d81992fbae6f2067a82)
- [【Rails】閲覧履歴の降順表示＋定時削除を実装する](https://qiita.com/mi-1109/items/0ab14d40dd9e8fdb41c3)
- [【Rails】enumで対応ステータスを更新する](https://qiita.com/mi-1109/items/65f8c87b9e9c3f4e2442)
- [【Rails x SQL】検索結果を人気順で表示する（左外部結合と副問い合わせ）](https://qiita.com/mi-1109/items/f59f053c9c9438359879)
