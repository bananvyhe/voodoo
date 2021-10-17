class NewsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create 
		puts params.require(:_json)
		# params.require[:export][:exp].each do |d|
	 #      imglink = d[:imglink]
	 #      head = d[:head]
	 #      content = d[:content]
	 #      date = d[:date]
	 #      link = d[:link]
	 #      exist = News.find_by(link: link) 
	 #      if exist == false
	 #      	TobdWorker.perform_async(imglink, head, content, date, link)
		# 		end
		# end 
	end 
	private
	  def news_params
    params.require(:news).permit(:imglink, :head, :content, :date, :link)
  end
end