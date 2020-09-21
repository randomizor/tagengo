class Prompt < ApplicationRecord
  belongs_to :user
  belongs_to :language
  belongs_to :level

  def self.list(_filters)
    all
  end
end
