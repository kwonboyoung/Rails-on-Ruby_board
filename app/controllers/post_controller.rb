class PostController < ApplicationController
  before_action(:find_post, only: [:show, :update, :modify, :destroy]) 
  def index
     @posts = Post.all
  end

  def new
  end

  def create
    @title = params[:title]
    @content = params[:content]
    
    Post.create(
      title: @title,
      content: @content,
      user_id: session[:user_id]
    )
    redirect_to '/'
  end

  def show
    
  # @comments = Comment.where(post_id: params[:id])
  # @comments = @post.comments # Comment.all
    
  end

  def modify
    
  end

  def update
    # 1번 글에 대해서 나는 수정을 할거야
    # 1번 글을 찾는다.

    # 해당 글을 업데이트한다.
    @post.update(
      title: params[:title],
      content: params[:content]
    )
    
    redirect_to "/post/show/#{@post.id}"
  end

  def destroy
    
    @post.destroy
    
    redirect_to "/"
  end

  def create_comment
    Comment.create(
      content: params[:content],
      post_id: params[:id]
    )
    redirect_to :back
  
  end
  
  # 반복되는 작업 추상화
  private
  def find_post
    @post = Post.find(params[:id])
  end
end
