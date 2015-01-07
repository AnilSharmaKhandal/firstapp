class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :logged_in_user, only: [:create, :destroy]
  #before_action :correct_user,   only: :destroy 
  
  def create 
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "post created!"
      redirect_to root_url
    else
       @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @post=Post.destroy(params[:id])
    if @post.delete       
      redirect_to request.referrer || root_url     
    end
end


  private

    def post_params
      params.require(:post).permit(:content)
    end

     #def current_user
     # @post = current_user.posts.find_by(id: params[:id])
    #  redirect_to root_url if @post.nil?
   # end
end