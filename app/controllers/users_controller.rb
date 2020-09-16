class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_count = @user.posts.count
    @prompts_count = @user.prompts.count

    prompts = @user.prompts.select(:id).map(&:id)
    @posts_using_prompts_counts = Post.where(prompt_id: prompts).count

    @latest_posts = @user.posts.order(created_at: :desc).limit(5)
  end

  def edit
    @user = User.find(params[:id])
    (2 - @user.native_languages.count).times { @user.native_languages.build }
    (2 - @user.learning_languages.count).times { @user.learning_languages.build }
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  private

  def user_params
    params.require(:user)
          .permit(
            :about,
            native_languages_attributes: language_params,
            learning_languages_attributes: language_params
          )
  end

  def language_params
    [:id, :user_id, :language_id, :level_id]
  end
end
