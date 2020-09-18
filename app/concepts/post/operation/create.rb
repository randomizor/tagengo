module Post::Operation
  class Create < Trailblazer::Operation
    step :setup_model
    step Contract::Build(constant: Post::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
    step :setup_presenter
    step :create_segments

    def setup_model(ctx, **)
      ctx[:model] = Post.new
    end

    def create_segments(ctx, presented:, **)
      ps = PragmaticSegmenter::Segmenter.new(
        text:     presented.entry,
        language: presented.language.code
      )

      ps.segment.each do |segment|
        Segment::Operation::Create.(params: { post_id: presented.id, segment: segment })
      end
    end

    def setup_presenter(ctx, **)
      ctx[:presented] = Post::Presenter::Show.new(ctx[:model])
    end
  end
end
