module Post::Contract
  class Create < Reform::Form
    property :title
    property :entry
    property :category_id
    property :language_id
    property :level_id
    property :tag_list
    property :prompt_id
    property :translation

    validation name: :default do
      params do
        required(:title).filled
        required(:entry).filled
        required(:category_id).filled
        required(:language_id).filled
        required(:level_id).filled
      end
    end

    model :post
  end
end
