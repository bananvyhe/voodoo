class TriadcounterWorker < ApplicationController
  include Sidekiq::Worker
	wrap_parameters format: [:json, :xml]
	require 'mechanize'
	require 'json'
	require 'httparty'  

	def perform
		def selection_scrapped(row, url)
			# print row
			title  = row.css('.list_article_photo img').attr('src').to_s
			titlecrop = title.slice(0, title.rindex('/dims'))
			news_link = row.css('.list_article_headline a').attr('href')
			# head_link = row.css('.list_article_headline a').attr('href')
			# lead = row.css('.list_article_lead').at('a').inner_text
			# trans = EasyTranslate.translate(lead, to: :ru)
			# date = row.css('.list_article_byline2').inner_text
			puts titlecrop
			puts news_link
			# puts head_link
			# puts lead
			# puts date
			# puts trans
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
	end

end
