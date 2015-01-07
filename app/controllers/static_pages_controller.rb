class StaticPagesController < ApplicationController

  def help
  end

  def about
  end

  def home
  	if user_signed_in?
  	 @post = current_user.posts.build if user_signed_in?
  	 @feed_items = current_user.feed.paginate(page: params[:page])
  end
end 

end

 