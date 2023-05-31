# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates an user with token" do
    user_count = User.count
    Fabricate(:user)

    expect(User.count).to eq(user_count + 1)
    expect(User.first.token).to be_an_instance_of(String)
  end
end
