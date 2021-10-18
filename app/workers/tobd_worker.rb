class TobdWorker < ApplicationController
  include Sidekiq::Worker
  require 'json'
  require 'uri'
  require 'openssl'
  require 'httparty' 
  def perform (imglink, head, content, datepost, link, tokenrapid)

     @headersb = {
        "Content-Type" => "application/json",
        "Authorization" => tokenrapid 
      }

    def tranklukator(zap) 
      puts "tranklufication..."
      bodyb = {
        "folderId"=>"b1g86cba4bfmnhhsnobp",
        "texts"=> zap,
        "targetLanguageCode"=>"ru"
      }
      resp = HTTParty.post("https://translate.api.cloud.yandex.net/translate/v2/translate", headers: @headersb, body: bodyb.to_json)
      render = JSON.parse resp.to_s 
      out = render["translations"]
      tex = out[0]
      headfin = tex.slice("text")['text']
      # if (pos == 1)
      #   puts "загоовок"  
      #   puts headfin
      # elsif (pos == 2)
      #   puts "контент"  
      #   puts headfin
      # end
    end

    #separate translated phrase from responce
    headfin = tranklukator head
    contentfin = tranklukator content
    sleep(1)

  	@news = News.new({:imglink => imglink, :head => headfin,:content => contentfin,:datepost => datepost,:link => link})
  	@news.save
 
	end
end