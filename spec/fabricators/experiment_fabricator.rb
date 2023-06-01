# frozen_string_literal: true

Fabricator(:experiment) do
  name { Faker::Name.name }
  value { Faker::Name.name }
end
