# 词条生成工具脚本

require 'thor'

class Item < Thor
  include Thor::Actions
  desc "new ITEM", "生成新词条，词条使用拉丁转写，根据要求生成对应的词条文件"
  def new(word)
    time = Time.now
    create_file "_posts/#{time.strftime("%Y-%m-%d")}-#{word}.markdown", <<~MARKDOWN
    ---
    layout: post
    date: #{time}
    title: 
    latin: #{word}
    ---
    
    MARKDOWN
    puts "在 _posts 文件间下已经生成词条 #{word} 的文件"
  end
end

Item.start
