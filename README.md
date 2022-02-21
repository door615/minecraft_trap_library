# Minecraft Trap Library

これはMinecraftのトラップをまとめたサイトです。このサイトはデザイン面はほぼ完成しているのですが、機能面に未完成な部分があります。(記事、タグの削除機能、画像アップロード機能など)。まだ未完成なので記事などもあまり作っていません。

# トラップとは？

このページを見ている方でMinecraftを知らない方向けの説明です。

トラップとは、特定のアイテムを効率よく集めるために作る建築物のことです。

Minecraftはいろいろなアイテムを作って建築をするゲームなのですが、その性質上たくさんほしいアイテムがでできます。それらを普通に集めているととんでもなく時間がかかるので、トラップを作って素材を集めるわけです。トラップにも種類があり、鉄トラップ、火薬トラップといった、様々な種類のトラップがあります。

# このサイトを作ったきっかけ

Minecraftのトラップは非常にややこしいのですが、これは主に以下の理由で成り立っています。

・トラップを作るのにゲームの非常に細かい仕様を利用している  
・Minecraftにはjava版と統合版という、異なる言語で書かれた二つのバージョンがあり、それぞれのバージョンで作れるトラップが違う  
・バージョンのアップデートで仕様が変わることがあり、トラップが使えなくなる事態が起こる  
・統合版は様々なゲームの機種に対応している。java版と統合版の仕様が違うことから機種間の違いもありそうに思えるが、統合版の機種間の差はない  
・トラップの作り方によってとれるアイテムの効率が異なる。また、作り方によって作るのが簡単だったり難しかったりする

これらの違いを整理してトラップを作りたい人が最も作るべきトラップを探せるようにしたサイトが無かったので、作りました。

# 使用技術

Ruby ver3.0.2p107  
Ruby on Rails ver6.1.4.4  
PostgreSQL ver12.8  
WSL1  
VScode  
Git ver2.25.1  
Github  
heroku  

# このサイトの主な機能

記事の投稿、編集機能(削除はまだ作っていません)  
タグの投稿機能(編集、削除はまだ作っていません)  
管理人かどうかをパスワードで認証する機能  
セッションを用いたログイン状態を維持する機能  
検索機能、タグ検索機能(タグ検索は複数タグによるAND検索ができます)  
carrierwave、AmazonS3を用いた画像アップロード機能(carrierwaveは完成しているが、AmazonS3は未完成)  


# サイトのURL

HerokuのURLはこちら(ソースコードと内容が異なる場合があります)    https://calm-inlet-60018.herokuapp.com/  
アクセスには時間がかかると思います。ご不便をおかけします。

このサイトは投稿機能、編集機能などがありますが、現在は管理人専用にしているため、サイト内にリンクがありません。一応URLを載せておきますが、管理人用のパスワードを設定しているので使えません。申し訳ありません。  
https://calm-inlet-60018.herokuapp.com/posts/new






