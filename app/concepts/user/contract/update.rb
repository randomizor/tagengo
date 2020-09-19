module User::Contract
  class Update < Reform::Form
    property :about

    collection :native_languages,   form: UserLanguage::Contract::Update
    collection :learning_languages, form: UserLanguage::Contract::Update

    validation name: :default do
      params do
        required(:about).filled
      end
    end

    def prepopulate!(options)
      (2 - self.native_languages.count).times   { self.native_languages   << model.native_languages.build }
      (2 - self.learning_languages.count).times { self.learning_languages << model.learning_languages.build }
    end

    model :user
  end
end
