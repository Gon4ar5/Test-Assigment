Fabricator(:user) do
  experiments(count: 1)
  token { Faker::Alphanumeric.alpha(number: 10).to_s }
end