class PostsController < ApplicationController
	before_action :authenticate_user!, only: [ :create, :update, :edit, :destroy]
	def index
		@post=Post.new
	end

	def create
		@post= Post.create(
                 title: params[:post][:title],
                 content: params[:post][:content],
                  user_id: current_user.id
			)
	end
    def edit
		@post=Post.find(params[:id])

		if @post.user_id != current_user.id
        redirect_to action: "index"
    
    end
	def update
		@post=Post.find(params[:id])
		@post.update(
			title: params[:post][:title],
          content: params[:post][:content]
           )
		redirect_to action: 'index'
	end

	
	def destroy
		@post= Post.find(params[:id])
		if @post.user_id != current_user.id
        redirect_to action: "index"
   else
		@post.destroy
	end

	end

end
end
