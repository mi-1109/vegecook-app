# VegeCook
**ベジタリアン向けの料理レシピを提供するWebアプリケーションです！**

ゲストログイン機能をご用意してますので、お気軽にご覧ください。
[※デプロイ後、ここにリンクを貼る]()

<br />

## サイト概要
**VegeCook** は、ベジタリアンや、これからベジタリアンを実践したい人が、手軽に安心してレシピを検索・共有できるサービスです。

- ベジタリアン・レシピを検索、投稿、ランキング表示できる
- コメントや"いいね"をしたり、気になるレシピの管理ができる
- 無料会員・有料会員によって利用可能な機能が分かれる

実装機能の詳細は、[機能一覧](#機能一覧)をご確認ください。

<br />

### サイトテーマ
**Be the Veggie, Save the Lives**
命を救う選択。ベジタリアンになろう。

<br />

### テーマを選んだ理由と、開発背景
「ベジタリアンという選択肢を通して、畜産物の消費を減らし、動物福祉と環境問題にコミットする人を増やす」
  これが、**VegeCook** に込めた想いです。

>- 日本は、畜産動物福祉で世界最低のGランク評価（WAP：世界動物保護協会）
>- 家畜生産がもしなくなれば、世界の温室効果ガス排気量は現在より28％も減少する

この事実を知った時、私は一人の消費者として「**ベジタリアンという選択**」を取ろうと決めました。

ところが日本のレシピサイトには、ベジタリアンのレシピがとても少なく、様々なサイトを何十分もかけて検索し、肉や魚、乳製品が使われていないか判断しなければなりませんでした。

そこで**VegeCook**は、ベジタリアン・ビギナーのレシピ検索のハードルを下げると同時に、個々のベジタリアンが持つレシピの知見を投稿・共有し、和を広げていく料理レシピのコミュニティ・サイトとなることで、ベジタリアンやベジタリアンになりたいと願う人々を応援します。そして、その一人ひとりの選択と努力が、畜産動物福祉や環境問題の改善につながることと、信じています。

<br />

### ターゲットユーザ（ペルソナ）
<img src="https://user-images.githubusercontent.com/78330037/116507067-85338000-a8f9-11eb-9a30-d1a4934623b3.png" width="550">

### 主な利用シーン
- ベジタリアン・レシピが思いつかないとき
- 新しいベジタリアン・レシピに挑戦したいとき
- 人気のベジタリアン・レシピを知りたいとき
- 短時間で、おいしいベジタリアン・レシピにたどり着きたいとき
- 家にある食材を使ってしまいたいとき

<br />

## 設計書
### 【画像設計】
**UI Flow (会員側)**
<img src="https://user-images.githubusercontent.com/78330037/116507864-1bb47100-a8fb-11eb-9aa9-0f43cbd932e7.png" width="500">

**UI Flow (管理者側)**
<img src="https://user-images.githubusercontent.com/78330037/116507996-60400c80-a8fb-11eb-97b5-80e99630afdf.png" width="500">

**ワイヤーフレーム** 
※PF作成後、最終チェックが終わったらPDFを結合してリンクを掲載

<br />

### 【DB設計】
**ER図**（※修正後画像で掲載）

[**テーブル定義書**](https://drive.google.com/file/d/1jfmJia98KTZ9EKACeCz41yY50tSmweod/view?usp=sharing)（スプレッドシートが開きます）

[**詳細設計**](https://docs.google.com/spreadsheets/d/1Qk4gG_0X_lHGBivPKsDiyWc_TjExEtFxR0zArI4L6uo/edit?usp=sharing)（スプレッドシートが開きます）

<br />

## 機能一覧
[チャレンジ要素一覧](https://docs.google.com/spreadsheets/d/15LsSsn6OQFDi0CZb68MRvgI3Udyr9nYOGtesS61AhAY/edit#gid=0)（スプレッドシートが開きます）
[機能一覧](https://docs.google.com/spreadsheets/d/1YTMjxS3oql9i0VyiOwwIBJ_1_Evw3lFVCbghlCkY53k/edit?usp=sharing)（スプレッドシートが開きます）

<br />

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails, Bootstrap
- JSライブラリ：jQuery
- IDE：Cloud9
<br />

## 使用素材
**【画像素材】**
<https://o-dan.net/ja/>

**【イラスト】**
<https://www.ac-illust.com/>

**【アイコン・ロゴ】**
<https://www.adobe.com/jp/products/spark.html>
<https://ao-system.net/alphaicon/>
