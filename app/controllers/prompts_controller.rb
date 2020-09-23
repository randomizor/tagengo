class PromptsController < ApplicationController
  before_action :authenticate_user!

  def index
    res   = Prompt::Operation::Index.()
    render cell(Prompt::Cell::Index, res[:presented])
  end

  def create
    res = Prompt::Operation::Create.(
      params: params[:prompt].merge(user_id: current_user.id)
    )

    redirect_to prompts_path
  end

  def show
    @prompt = Prompt.find(params[:id])
  end

  def new
    render cell(Prompt::Cell::New, OpenStruct.new(
        languages:  Language.all,
        levels:     Level.all
      )
    )
  end
end
