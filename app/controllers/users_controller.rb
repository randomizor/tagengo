class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit]

  def show
    @latest_posts = Post::Operation::Index.(
      params: {
        limit: 5,
        user_id: current_user.id
      }
    )[:presented]

    render cell(User::Cell::Show, @user, latest_posts: @latest_posts)
  end

  def edit
    render cell(User::Cell::Edit,
      current_user,
      languages: Language.all,
      levels: Level.all
    )
  end

  def update
    res = User::Operation::Update.(params: user_params.merge(id: current_user.id))
    redirect_to user_path res[:presented].model
  end

  private

  def get_user
    @user = User::Operation::Show.(
      params: {
        id: params[:id] || current_user.id
      }
    )[:presented]
  end

  def user_params
    params.require(:user).permit!
  end
end
