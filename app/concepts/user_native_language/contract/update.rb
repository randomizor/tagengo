module UserNativeLanguage::Contract
  class Update < Reform::Form
    property :language_id
    property :user_id

    validation name: :default do
      params do
        required(:user_id).filled
        required(:language_id).filled
      end
    end

    model :user_native_language
  end
end
