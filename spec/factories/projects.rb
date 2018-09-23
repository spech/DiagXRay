# spec/factories/todos.rb
FactoryBot.define do
  factory :project do
    name { Faker::ProgrammingLanguage.unique.name }
    created_by { Faker::ProgrammingLanguage.creator }
  end
end
