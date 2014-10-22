class PostsController < ApplicationController
  def create
    @sound_bites= SoundBite.find(params[:sb_id])
    @post = @sound_bites.posts.create(params[:post])
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to @sound_bites, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
end
