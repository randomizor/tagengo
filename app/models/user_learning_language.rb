class UserLearningLanguage < ApplicationRecord
  belongs_to :language
  belongs_to :user
  belongs_to :level
end
