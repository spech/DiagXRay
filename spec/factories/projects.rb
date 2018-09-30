# spec/factories/projects.rb
FactoryBot.define do
  factory :project do
    name { "#{Faker::Number.number(2)}.#{Faker::Number.number(2)}.#{Faker::Number.number(2)}" }
    created_by { Faker::ProgrammingLanguage.creator }
  end
end
