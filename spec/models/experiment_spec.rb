# frozen_string_literal: true

require "rails_helper"

RSpec.describe Experiment, type: :model do
  it "creates an experiments with name and value" do
    user_count = User.count
    Fabricate(:user)

    expect(Experiment.count).to eq(user_count+1)
    expect(Experiment.first.name).to be_an_instance_of(String)
    expect(Experiment.first.value).to be_an_instance_of(String)
  end
end
