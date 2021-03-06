

#  『うちの子の記録』

<img width="1000" alt="スクリーンショット 2021-03-26 19 15 20" src="https://user-images.githubusercontent.com/78485957/112617042-ca324580-8e67-11eb-85ae-c2f86513db54.png">


## アプリケーション概要


  大切な猫ちゃんの日々の健康記録を簡単につけることができます。



## URL


  デプロイ後に追記します。


## テスト用アカウント


ゲストログインボタンを押すことで下記のアドレス・パスワードでログインできます。
- メールアドレス：test1@test
- パスワード：abc123



## 利用方法


- 猫プロフィール登録
  ヘッダーの「うちの子を追加」からプロフィール入力ページへ移動 → 各項目を入力し登録ボタンを押してください。

- 健康記録登録
  ヘッダーの「記録をつける」から記録入力ページへ移動 → 各項目を入力し、登録ボタンを押してください。

- プロフィール＆健康記録閲覧
  猫ちゃんの写真または名前をクリックし、詳細ページへ移動してください。（編集・削除もこちらでできます。）



## 目指した課題解決


   猫ちゃんの健康記録を残すことで、少しの体調変化にも気付ける様になりたいという飼い主さんの思いを実現します。
   また、日々忙しい飼い主さんでもシンプルな機能で簡単に記録をつけることが可能です。


## 洗い出した要件


 - 猫プロフィール機能
    <br>登録・編集・削除・詳細
 - 健康記録機能
    <br>登録・編集・削除・一覧
 - ユーザー管理機能(devise)
    <br>登録・ログイン・ログアウト


## 実装予定の機能


 - 年間体重グラフ



## データベース設計

![cat_record](https://user-images.githubusercontent.com/78485957/112715821-075d0d00-8f26-11eb-95da-5496eb352ff2.png)




## ローカルでの動作方法


git clone https://github.com/yuka52/cat_record