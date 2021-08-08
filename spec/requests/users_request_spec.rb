# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include Rails.application.routes.url_helpers

  let(:response_body) { JSON.parse(response.body) }

  describe 'GET' do
    describe '/users' do
      context 'when there are no users' do
        before { get users_path }

        it 'returns an empty array' do
          expect(response).to have_http_status(200)
          expect(response_body['data']).to eq([])
        end
      end

      context 'when there are users' do
        let!(:user_1) { FactoryBot.create(:user) }
        let(:user_1_json) { JSON.parse(user_1.to_json) }
        let!(:user_2) { FactoryBot.create(:user) }
        let(:user_2_json) { JSON.parse(user_2.to_json) }

        before { get users_path }

        it 'returns all users' do
          expect(response).to have_http_status(200)
          expect(response_body['data'].length).to eq(User.count)
          expect(response_body['data']).to contain_exactly(user_1_json, user_2_json)
        end
      end
    end

    describe '/users/:id' do
      context 'when the user does not exist' do
        before { get user_path(1) }

        it 'returns an appropriate error message' do
          expect(response).to have_http_status(404)
          expect(response_body['message']).to eq("Couldn't find User with 'id'=1")
        end
      end

      context 'when the user does exist' do
        let!(:user) { FactoryBot.create(:user) }
        let(:user_json) { JSON.parse(user.to_json) }

        before { get user_path(user.id) }

        it 'returns the user' do
          expect(response).to have_http_status(200)
          expect(response_body['data']).to eq(user_json)
        end
      end
    end
  end
end
