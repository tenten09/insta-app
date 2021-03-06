class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      render :show, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      render json: post
    else
      render json: post.errors
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      render json: post
    end
  end

  private
  def post_params
    params.permit(:title, :body)
  end
end
