class CorrectionsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @correction = @post.corrections.new

    @post.segments.each do |segment|
      @correction.segment_corrections.build(segment_id: segment.id)
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @correction = current_user.corrections.new(correction_params.merge(post_id: @post.id))
    @correction.save
    redirect_to @post
  end

  private

  def correction_params
    params.require(:correction)
          .permit(
            :user_id,
            :post_id,
            segment_corrections_attributes: [:comment, :entry, :segment_id]
          )
  end
end
