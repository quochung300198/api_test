class CommentsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :set_comment, only: [:show, :update, :destroy]
  after_action :set_csrf_cookie

  def index
    @comments = Comment.where(post_id: params[:post_id])
    render json: @comments, status: :ok
  end

  def show
    render json: @comment, status: :ok
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: {comment: @comment}, status: :created
    else
      render json: @comment.errors, status: :conflict
    end
  end

  def update
    if @comment.update(comment_params)
      render json: {comment: @comment}, status: :ok
    else
      ender json: @comment.errors, status: :conflict
    end
  end

  def destroy
    if @comment.destroy
      render json: "Deleted Successfully", status: :no_content
    else
      render json: @comment.errors, status: :not_found
    end
  end

  private

  def comment_params
    params.permit(:name, :body)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_csrf_cookie
    cookies["my_csrf_token"] = form_authenticity_token
  end
end
