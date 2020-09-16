class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def create
    user_level = current_user.user_languages.where(language_id: params[:post][:language_id]).first.level_id

    @post = current_user.posts.new(post_params.merge(level_id: user_level))
    @post.save
    puts @post.errors.inspect
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  def update

  end

  def edit

  end

  def new
    @languages = current_user.languages_learning
    @levels = Level.all
    @categories = Category.all
    @prompt = Prompt.order("RANDOM()").first
    @post = current_user.posts.new
  end

  def destroy

  end

  private

  def post_params
    params.require(:post)
      .permit(
        :title,
        :entry,
        :translation,
        :user_id,
        :language_id,
        :level_id,
        :prompt_id,
        :category_id,
        :tag_list
      )
  end
end
