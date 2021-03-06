### アプリケーション名

## Re : illustart (リ：イラスタート)

[![Image from Gyazo](https://i.gyazo.com/4f61c6fc9bf647e4749549f3ad281acd.gif)](https://gyazo.com/4f61c6fc9bf647e4749549f3ad281acd)



## URL

- https://illust-restart.herokuapp.com
<br />

## アプリケーション概要
- 練習はしているが、絵で１円も稼げない。
- なかなか結果が出せていない。
- 一度描くのを挫折してしまったがもう一度描いてみようと思った。

そういった人たち(過去の自分)に向けて、もう一度絵を一緒に描きませんか？</br>
そしてどうせ描くならイラストを報酬という形で結果を残しませんか？</br>
上記をコンセプトにしたWebアプリになります。
</br>
</br>

初めてのオリジナルWebアプリケーションになります。</br>
自分の趣味がイラストなので、過去の失敗や挫折の経験から
イラストで結果を出すには？を考えて本アプリを作成しました。<br/>
イラストの投稿、練習、実績を積んで、次のステップである有料依頼サイトである「ココナラ、Skeb」への登録する際に</br>
自信や実績をもって登録してもらいたいというのが目的のイラスト練習・コミュニティアプリです。
　　


## 制作背景
 
 過去の自分をペルソナと考え、以下の課題とそれに対する課題解決案を<br/>
 解消できないかを考えて、必須機能の制作を行いました。

### ペルソナが抱える課題
- 練習してもうまくなっているかがわからない。
- せっかく練習したんだから多少でも報酬を得るなど結果を出したい。
- 有料のイラスト・依頼サイト（ココナラ・Skeb・Pixiv）をみてみると、<br/>
  神絵師やプロ絵師だらけで自分のレベルではまだまだ無理だ。<br/>
  もっと練習して自分で納得できてから登録しよう。（こういうのは大体最後までやらない）
　
### それに対する課題解決案

####  ・誰でも気軽に絵が投稿できる絵の練習用サイト<br/>
　→総いいね数(実績)によってサイトを強制卒業することで投稿する絵の平均レベルをあげすぎない仕組みにする。
####  ・コメント・アドバイスなどによるコミュニティ内でのお互いの成長要素<br/>   
　→コメント、アドバイスフラグの有無によってアドバイスが欲しいユーザのみ、アドバイス募集の表示がでるようにする。  
 　　※絵は人によって描き方が全く違う為、アドバイスが必ず有効とは限らない為。
####  ・依頼や練習用のランダムお題表示・追加要素<br/>
　→絵を描こうと思っても、何を描くか思いつかない。そういう時にランダムでお題が表示されるので、練習用に使用できる。  
　→絵の依頼は描いて欲しい概要と参考資料を渡されることが多い為、依頼の練習としても使用可能<br/> 
####  ・有料イラスト依頼サイト、ココナラ・Skeb等に登録するまでの実績、自信をつける要素<br/>
　→総いいね数(実績)による卒業、ランダムお題をこなすことで依頼の練習。<br/>
 　　イラスト投稿、Twitterへのシェアの数をこなすことで絵の成長につながり<br/>
 　　卒業後は、ある程度の実績と自信をもって、次のステップである有料イラスト依頼サイト「ココナラ・Skeb等」の<br/>
 　　登録へ進むことができる。


## 機能一覧
- ユーザ管理機能 (ログイン・ログアウト・マイページ・マイページ編集)

- イラスト投稿管理機能 (一覧表示、新規投稿、編集、詳細表示、削除)

- コメント機能 (コメント機能、アドバイスの有無、コメント一覧)

- いいね関連機能 (イラスト毎のいいね機能、ユーザ毎の総いいね数(実績)、
               ユーザの総いいね数(実績)による強制卒業機能）

- 練習用ランダムお題機能 (お題のランダム表示、お題の追加)

- その他、検索機能、Twiiterのシェア、ページネーション、CSSアニメーション等

## 利用方法
上部メニューの「新規登録」を押下後、新規登録画面にて以下の必須項目のみを登録すればログインが可能になります。
- ニックネーム   
- Eメール
- パスワード
- パスワード(確認)

## テスト用アカウント
上部メニューの「ログイン」から以下のIDとパスワードでテストユーザーでログインが可能です。

- Eメールアドレス
　　　 test001@com
- パスワード
　　　　　　pass01    

## 各機能の実装目的
### ユーザ毎の総いいね数（実績）機能
- いいね数による絵の客観的評価(実績)とモチベーション
- 総いいね数(実績)が一定数を超えると強制卒業(以降、投稿はできないようにする。)<br/>
→上手い人だらけになって絵の投稿のハードルをあげないようにする。<br/>
→実績をもって卒業することで次のステップである有料依頼サイトへの登録の自信・実績につなげる。

[![Image from Gyazo](https://i.gyazo.com/f7ff76e268fecfdcc5f80ef42d37919d.gif)](https://gyazo.com/f7ff76e268fecfdcc5f80ef42d37919d)

### ランダムお題表示・追加機能
- 絵を描こうと思っても、描きたいものが思いつかない時の１つの案として使用可能。
- 総の依頼は大体こういうのを描いて欲しいという概要と、参考資料がセットでくるので  
  イラストの依頼に対する練習として使用できる。
- お題の追加は誰でも可能なのでアイコン作成の依頼などにも使用可能 (無償なので描くかどうかはその人次第です)

[![Image from Gyazo](https://i.gyazo.com/d44c6e3022e0f1f775a7318ed8e62192.gif)](https://gyazo.com/d44c6e3022e0f1f775a7318ed8e62192)


## 実装予定の機能

- 最高1000円以下で実際にアイコン作成やバナー作成などのイラストの依頼ができる機能  
→1000円とはいえ、実際に依頼をこなすと実績と依頼をこなした自信がつく 

- ajaxによる非同期通信のいいね機能（実装完了）

- ajaxによる非同期通信のモーダルウィンドウ機能

- ログアウト状態でもいいね機能を可能にしたい

## 苦労した点 
- いいね機能のajaxによる非同期通信での実装

　元々は、通常の同期処理で実装を行なっていたが、テスト設計時に練習用お題ページの一覧からいいねを押そうとすると<br/> 
　リロードされて別のお題になってしまい、いいねが機能しているかわからない状態になってしまった。

　そのため、急遽追加実装の予定だったajaxによる非同期通信の実装を優先して開始<br/>
　参考ページをみながら理屈を理解して実装を行なったつもりだが、ターミナルではjs形式でリクエスト、レスポンスともに<br/>
　返ってきているのにリロードしないと情報が反映されない問題が発生した。  

　色々検索や質問などを行ったり、原因を調査したところ自分が参考にしたページが少し古い記事だったため<br/>
　WebPacker関連でエラーがでておりJQueryの正しいインストール方法を調べ、<br/>
　再度仕組みを理解して環境構築・実装を行い、無事非同期通信での実装を完了することができ<br/>
　上記問題を解決することができた。


## ER図
[![Image from Gyazo](https://i.gyazo.com/e59bf468118ae3c0a23c04fc001284b3.png)](https://gyazo.com/e59bf468118ae3c0a23c04fc001284b3)


## 開発環境
- フロントエンド：HTML5/CSS(Bootstrap)/JavaScript/JQuery/Ajax
- バックエンド：Ruby on Rails(6.0.0)/Ruby(2.6.5)/JavaScript
- テスト：RSpec
- Linter：Rubocop
- データベース：MySQL(5.6.50)/Sequel Pro
- インフラ：Heroku
- タスク管理：GitHub/Trello
