class CorrectionsController < ApplicationController
  def new
    @post = Post::Operation::Show.(params: { id: params[:post_id] })[:presented]
    render cell(Correction::Cell::New, OpenStruct.new(post: @post))
  end

  def create
    @post = Post::Operation::Show.(params: { id: params[:post_id] })[:presented]

    res = Correction::Operation::Create.(
      params: params[:correction].merge(
        user_id: current_user.id,
        post_id: @post.id
      )
    )

    redirect_to post_path @post.id
  end
end
