module UserLearningLanguage::Contract
  class Update < Reform::Form
    property :language_id
    property :user_id
    property :level_id

    validation name: :default do
      params do
        required(:user_id).filled
        required(:language_id).filled
        required(:level_id).filled
      end
    end

    model :user_learning_language
  end
end
