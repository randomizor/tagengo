module Post::Cell
  class Post < Trailblazer::Cell
    include ::Cell::Erb
    property :title
    property :user
    property :entry
    property :level
    property :language
    property :category
    property :tag_list

    private

    def level_name
      level.name
    end

    def language_name
      language.name
    end

    def category_name
      category.name
    end

    def post_link
      link_to title, post_path(model.model), class: 'post-link'
    end
  end
end
