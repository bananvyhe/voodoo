class TriadcounterWorker < ApplicationController
  include Sidekiq::Worker
	wrap_parameters format: [:json, :xml]
	require 'mechanize'
	require 'json'
	require 'httparty'  
	def perform
		agent = Mechanize.new
 		url='https://www.koreatimes.co.kr/www/sublist_134.html'
 		page = agent.get(url)
 		show_more = agent.page 
		all = show_more.body.force_encoding('UTF-8')
 		puts  '-------------------->>>>>>'
 		File.write('koreatimespage.txt', all) 
		puts  '-------------------->>>>>>'

	end

end
