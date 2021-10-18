class TobdWorker < ApplicationController
  include Sidekiq::Worker
  require 'json'
  require 'uri'
  require 'openssl'
  require 'httparty' 
  def perform (imglink, head, content, datepost, link, tokenrapid)

    #headers for httparty
    headersb = {
      "Content-Type" => "application/json",
      "Authorization" => tokenrapid 
    }

    #body for httparty
    bodyb = {
      "folderId"=>"b1g86cba4bfmnhhsnobp",
      "texts"=> head,
      "targetLanguageCode"=>"ru"
    }
    #separate translated phrase from responce
    resp = HTTParty.post("https://translate.api.cloud.yandex.net/translate/v2/translate", headers: headersb, body: bodyb.to_json)
    render = JSON.parse resp.to_s 
    out = render["translations"]
    tex = out[0]
    headfin = tex.slice("text")['text']
    
    #make  for full news link
    linkfin = "https://www.koreatimes.co.kr" + link.to_s

    puts headfin
    puts linkfin 
  	# @news = News.new({:imglink => imglink, :head => head,:content => content,:datepost => datepost,:link => link})
  	# @news.save
 
	end
end