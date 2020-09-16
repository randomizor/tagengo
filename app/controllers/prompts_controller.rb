class PromptsController < ApplicationController
  before_action :authenticate_user!

  def index
    @prompts = Prompt.all
  end

  def create
    @prompt = current_user.prompts.new(prompt_params)
    @prompt.save
    redirect_to @prompt
  end

  def show
    @prompt = Prompt.find(params[:id])
  end

  def update

  end

  def edit

  end

  def new
    @languages = current_user.languages_native
    @levels = Level.all
    @prompt = current_user.prompts.new
  end

  def destroy

  end

  private

  def prompt_params
    params.require(:prompt)
          .permit(:prompt, :user_id, :language_id, :level_id)
  end
end
