class ProfileController < ApplicationController
	def show
    @user = user.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end
end
