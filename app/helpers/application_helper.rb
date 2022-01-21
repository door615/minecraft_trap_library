module ApplicationHelper

    #ページのタイトルを作るメソッドです。
    def full_title(page_title = '')
        base_title = "Minecraftトラップライブラリー"
        if page_title.empty?
          "#{base_title} | マイクラのトラップをまとめました"
        else
          "#{page_title} | #{base_title}"
        end
    end

      #ページのディスクリプションを作るメソッドです。
    def full_description(page_description = '')
      base_description = "数多あるマイクラのトラップをまとめました！
      java版用、統合版用、簡単に作れるものから最高効率のものまであらゆるトラップが
      揃っています。豊富なタグで分類しているのであなたの求めるトラップが見つかります！"

      if page_description.empty?

        base_description

      #provideされた文字列にトラップが含まれている場合、以下の文章になります
      elsif paga_description.match(/.*?トラップ.*?/)

          "#{page_description}の一覧ページです。あなたが作りたい
          #{page_description}はどれですか？"

      else
          
        "#{page_description}のトラップ一覧ページです。あなたが作りたい
        #{page_description}のトラップはどれですか？"

      end
    end
end
