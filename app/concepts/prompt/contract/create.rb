module Prompt::Contract
  class Create < Reform::Form
    property :prompt
    property :language_id
    property :level_id
    property :user_id

    validation name: :default do
      params do
        required(:prompt).filled
        required(:language_id).filled
        required(:level_id).filled
        required(:user_id).filled
      end
    end

    model :prompt
  end
end
