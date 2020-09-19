class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    res   = Post::Operation::Index.()
    render cell(Post::Cell::Index, res[:presented])
  end

  def create
    user_level = current_user.user_learning_languages.find_by(language_id: params[:post][:language_id]).level_id
    res = Post::Operation::Create.(params: params[:post].merge(user_id: current_user.id, level_id: user_level))
    redirect_to post_path res[:presented].model
  end

  def show
    post = Post::Operation::Show.(params: params)[:presented]

    segments     = post.model.segments
    corrections  = post.model.corrections

    render cell(Post::Cell::Show, post,
                corrections: corrections,
                segments:    segments
            )
  end

  def new
    render cell(Post::Cell::New, OpenStruct.new(
        languages:  current_user.learning_languages,
        categories: Category.all,
        prompt:     Prompt.order("RANDOM()").first
      )
    )
  end

  def destroy

  end
end
