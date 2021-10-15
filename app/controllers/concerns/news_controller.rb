class NewsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create 
		puts params
		# 	params.require(:_json).each do |d|
		#      url = d[:url]
		#      wall = d[:wall]
		#      like = d[:v_like]
		#      views = d[:v_views]
		#      posted_at = d[:posted_at]
		#      medias_row = d[:medias_row]
		#      thumb_map_img_as_div = d[:thumb_map_img_as_div]
		#      title = d[:title]
		#      groupsvk = Groupsvk.find_or_create_by(namegroup: url) 
		#      TobdWorker.perform_async(url, wall, like, views, posted_at, thumb_map_img_as_div, title, medias_row)
		#    end
	end 
end