class PostsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :set_post, only: [:show, :update, :destroy]
  after_action :set_csrf_cookie

  def index
    @posts = Post.all
    render json: @posts, status: :ok
  end

  def show
    render json: @post, status: :ok
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: {post: @post}, status: :created
    else
      render json: @post.errors, status: :conflict
    end
  end

  def update
    if @post.update(post_params)
      render json: {post: @post}, status: :ok
    else
      ender json: @post.errors, status: :conflict
    end
  end

  def destroy
    if @post.destroy
      render json: "Deleted Successfully", status: :no_content
    else
      render json: @post.errors, status: :not_found
    end
  end

  private

  def post_params
    params.permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_csrf_cookie
    cookies["my_csrf_token"] = form_authenticity_token
  end
end
