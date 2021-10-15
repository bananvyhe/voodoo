class TriadcounterWorker < ApplicationController
  include Sidekiq::Worker
	wrap_parameters format: [:json, :xml]
	require 'mechanize'
	require 'json'
	require 'httparty'  
	@rowsd = Array.new
	def perform
		def selection_scrapped(row, url)
			title  = row.css('.list_article_photo img').attr('src').to_s
			titlecrop = title.slice(0, title.rindex('/dims')).to_s
			news_link = row.css('.list_article_headline a').attr('href').to_s
			head = row.css('.list_article_headline a').inner_text.to_s
			date = row.css('.list_article_byline2').inner_text.to_s
			article = row.css('.list_article_lead a').inner_text.to_s
			@rowsd = {
		    :imglink => titlecrop,
		    :head => head,
		    :content => article,
		    :date => date,
		    :link => news_link
		  }	
	 
		end

		agent = Mechanize.new
 		url='https://www.koreatimes.co.kr/www/sublist_134.html'
 		page = agent.get(url)
 		show_more = agent.page 
		all = show_more.body.force_encoding('UTF-8')
 		puts  '-------------------->>>>>>'
 		# File.write('koreatimespage.txt', all) 
		puts  '-------------------->>>>>>'
		page.css('.list_article_area').each do |row|
			selection_scrapped(row, url)
		end
		headers = {
			"Content-Type" => "application/json"  
		}
		if Rails.env.production?
			HTTParty.post("https://voodoo.ru/news",headers: headers, body: @rowsd.to_json)
		end
		if Rails.env.development?
			HTTParty.post("http://localhost:3000/news",headers: headers, body: @rowsd.to_json)
		end		
	end

end
