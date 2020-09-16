# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#TODO: Move this to a YAML file or something
languages = [
  {
    name: 'English',
    code: 'en'
  },
  {
    name: 'Japanese',
    code: 'jp'
  }
]

levels = [
  {
    name: 'Beginner'
  },
  {
    name: 'Elementary'
  },
  {
    name: 'Intermediate'
  },
  {
    name: 'Advanced'
  },
  {
    name: 'Proficient'
  },
  {
    name: 'Native'
  }
]

categories = [
  {
    name: 'Prompt'
  },
  {
    name: 'Journal'
  },
  {
    name: 'Diary'
  },
  {
    name: 'Translation'
  }
]

languages.each do |language|
  Language.where(name: language[:name], code: language[:code]).first_or_create
end

levels.each do |level|
  Level.where(name: level[:name]).first_or_create
end

categories.each do |category|
  Category.where(name: category[:name]).first_or_create
end
