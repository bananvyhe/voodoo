class NewsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def index
		@news = News.all 
		render json: @news
	end
	def create 
		# puts params.require(:_json)
		params.require(:_json).each do |d|
      imglink = d[:imglink]
      head = d[:head]
      content = d[:content]
      datepost = d[:datepost]
      link = d[:link]
      unless News.find_by(link: link)  
      	TobdWorker.perform_async(imglink, head, content, datepost, link)
      	puts 'send'
      	sleep(1)
			end
		end 
	end 

	private
	  def news_params
    params.require(:news).permit(:imglink, :head, :content, :datepost, :link)
  end
end