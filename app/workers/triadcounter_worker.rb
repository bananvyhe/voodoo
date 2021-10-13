class TriadcounterWorker < ApplicationController
  include Sidekiq::Worker

	def perform
	 puts 'hello'
	 puts '=================='
	end

end
