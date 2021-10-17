class TobdWorker < ApplicationController
  include Sidekiq::Worker
  wrap_parameters format: [:json, :xml]
  require 'uri'
  # require 'net/http'
  require 'openssl'
  def perform (imglink, head, content, datepost, link)
    token = "bearer " + %x{yc iam create-token}
    headersb = {
      "Content-Type" => "application/json",
      "Authorization" => token 
    }
    bodyb = {
      "folderId"=>"b1g86cba4bfmnhhsnobp",
      "texts"=> [head, content],
      "targetLanguageCode"=>"ru"
    }
    resp = HTTParty.post("https://translate.api.cloud.yandex.net/translate/v2/translate", headers: headersb, body: bodyb.to_json)
    # puts resp 	 
 
  	@news = News.new({:imglink => imglink, :head => head,:content => content,:datepost => datepost,:link => link})
  	@news.save
 
	end
end