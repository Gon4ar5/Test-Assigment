# frozen_string_literal: true

require 'rails_helper'

describe AbController, type: :controller do
  context 'with new user' do
    context 'with token' do
      let(:token) { Faker::Alphanumeric.alpha(number: 10).to_s }
      let(:headers) {{ "Device-Token" => token }}

      before do
        request.headers.merge! headers
      end

      it 'create new user' do
        user_count = User.count
        get :perform_action
        expect(User.count).to eq user_count + 1
        expect(User.last.token).to eq token
      end

      it 'returns user experiments' do
        get :perform_action
        body = JSON.parse(response.body)
        expect(body).to be_an_instance_of(Hash)
        expect(body.keys).to eq(['experiments'])
      end
    end

    context 'without token' do
      it 'return error' do
        expect { get :perform_action }.to raise_error(ApplicationController::NotAuthorized)
      end
    end
  end

  context 'with couple new users' do
    let(:user1) { Fabricate(:user) }
    let(:user2) { Fabricate(:user) }
    let(:user3) { Fabricate(:user) }
    let(:headers1) {{ "Device-Token" => user1.token }}
    let(:headers2) {{ "Device-Token" => user2.token }}
    let(:headers3) {{ "Device-Token" => user3.token }}

    it 'returns different experiments' do
      request.headers.merge! headers1
      get :perform_action
      body1 = response.body
      request.headers.merge! headers2
      get :perform_action
      body2 = response.body
      request.headers.merge! headers3
      get :perform_action
      body3 = response.body
      expect([body1,body2,body3].uniq.count).to be > 1
    end
  end

  context 'with old user' do
    let!(:user) { User.new(token: Faker::Alphanumeric.alpha(number: 10).to_s) }
    let!(:headers) {{ "Device-Token" => user.token }}

    before do
      request.headers.merge! headers
    end

    it 'does not create new user' do
      user_count = User.count
      get :perform_action
      expect(User.count).to eq user_count + 1
    end

    it 'returns user experiments' do
      get :perform_action
      body1 = JSON.parse(response.body)
      get :perform_action
      body2 = JSON.parse(response.body)
      expect(body1).to eq(body2)
    end
  end
end
