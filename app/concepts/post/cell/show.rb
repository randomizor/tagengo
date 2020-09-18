module Post::Cell
  class Show < Trailblazer::Cell
    include ::Cell::Erb
    property :title

    private

    def post_link
      link_to title, post_path(model.model), class: 'post-link'
    end
  end
end
