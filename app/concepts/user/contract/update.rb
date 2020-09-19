module User::Contract
  class Update < Reform::Form
    property :id
    property :about

    collection :user_native_languages,   form: UserNativeLanguage::Contract::Update, populate_if_empty: -> (_options){
      language = UserNativeLanguage.new
      language.user_id = id
      language
    }

    collection :user_learning_languages, form: UserLearningLanguage::Contract::Update, populate_if_empty: -> (_options){
      language = UserLearningLanguage.new
      language.user_id = id
      language
    }

    validation name: :default do
      params do
        required(:about).filled
      end
    end

    def prepopulate!
      (2 - self.user_native_languages.count).times   { self.user_native_languages   << model.user_native_languages.new }
      (2 - self.user_learning_languages.count).times { self.user_learning_languages << model.user_learning_languages.new }
    end

    model :user
  end
end
