class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :posts
  has_many :prompts
  has_many :corrections
  has_many :user_languages

  has_many :native_languages,   -> { where(level_id: Level.where(name: 'Native').collect(&:id)) }, class_name: 'UserLanguage'
  has_many :learning_languages, -> { where(level_id: [Level.where.not(name: 'Native').collect(&:id)]) },  class_name: 'UserLanguage'

  has_many :languages_learning, through: :learning_languages, source: :language
  has_many :languages_native,   through: :native_languages,   source: :language

  accepts_nested_attributes_for :native_languages,    reject_if: proc { |attributes| attributes['language_id'].blank? }
  accepts_nested_attributes_for :learning_languages,  reject_if: proc { |attributes| attributes['language_id'].blank? }
end
