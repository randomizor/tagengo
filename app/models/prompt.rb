class Prompt < ApplicationRecord
  belongs_to :user
  belongs_to :language
  belongs_to :level
end
