class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :posts
  has_many :prompts
  has_many :corrections
  has_many :user_native_languages
  has_many :user_learning_languages

  has_many :learning_languages, through: :user_learning_languages, source: :language
  has_many :native_languages,   through: :user_native_languages,   source: :language

  has_many :languages_learning, through: :learning_languages, source: :language
  has_many :languages_native,   through: :native_languages,   source: :language
end
