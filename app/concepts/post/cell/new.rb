module Post::Cell
  class New < Trailblazer::Cell
    include ActionView::Helpers::FormOptionsHelper
    include ::Cell::Erb
    property :prompt
    property :languages
    property :categories

    def form
      Post::Contract::Create.new(Post.new)
    end

    private

    def prompt_id
      prompt&.id
    end

    def prompt_text
      prompt&.prompt || 'Entry'
    end

    def language_options
      languages.map{|l| [l.name, l.id]}
    end

    def category_options
      categories.map{|c| [c.name, c.id]}
    end
  end
end
