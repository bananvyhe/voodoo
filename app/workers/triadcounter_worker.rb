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

			#setup for goodle rapidapi
			# @url = URI("https://google-translate1.p.rapidapi.com/language/translate/v2")
			# @http = Net::HTTP.new(@url.host, @url.port)
			# @http.use_ssl = true
			# @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			# request = Net::HTTP::Post.new(@url)
			# request["content-type"] = 'application/json'
			# request["accept-encoding"] = 'application/gzip'
			# request["x-rapidapi-host"] = 'google-translate1.p.rapidapi.com'
			# request["x-rapidapi-key"] = ' '
			# request.body = "q=English%20is%20hard%2C%20but%20detectably%20so"
			# response = @http.request(request)
			# puts response.read_body
			# sleep(1)
			data = {
		    :imglink => titlecrop,
		    :head => head,
		    :content => article,
		    :date => date,
		    :link => news_link
		  	}	
		  @rowsd = [*@rowsd, data]
		end

		agent = Mechanize.new
 		urlz='https://www.koreatimes.co.kr/www/sublist_134.html'
 		page = agent.get(urlz)
 		show_more = agent.page 
		all = show_more.body.force_encoding('UTF-8')
 	
 		# File.write('koreatimespage.txt', all) 
		
		page.css('.list_article_area').each do |row|
			selection_scrapped(row, urlz)
		end
		headers = {
			"Content-Type" => "application/json"  
		}
		if Rails.env.production?
			HTTParty.post("https://farmspot.ru/news",headers: headers, body: @rowsd.to_json)
		end
		if Rails.env.development?
			HTTParty.post("http://localhost:3000/news",headers: headers, body: @rowsd.to_json)
		end		
	end

end
