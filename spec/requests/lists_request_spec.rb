# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Lists', type: :request do
  include Rails.application.routes.url_helpers

  let(:response_body) { JSON.parse(response.body) }

  describe 'GET' do
    describe '/users/:user_id/lists' do
      context 'when the user has no lists' do
        let!(:user) { FactoryBot.create(:user) }

        before { get user_lists_path(user.id) }

        it 'returns an empty array' do
          expect(response).to have_http_status(200)
          expect(response_body['data']).to eq([])
        end
      end

      context 'when the user has lists' do
        let!(:user_1) { FactoryBot.create(:user) }
        let!(:list_1) { FactoryBot.create(:list) }
        let(:list_1_json) { JSON.parse(list_1.to_json) }
        let!(:list_2) { FactoryBot.create(:list, title: 'Work') }

        before { user_1.lists = [list_1] }
        before { get user_lists_path(user_1.id) }

        it "returns all of that user's lists" do
          expect(response).to have_http_status(200)
          expect(response_body['data'].length).to eq(1)
          expect(response_body['data']).to contain_exactly(list_1_json)
        end
      end

      context 'when the user does not exist' do
        before { get user_lists_path(1) }

        it 'returns an appropriate error message' do
          expect(response).to have_http_status(404)
          expect(response_body['message']).to eq("Couldn't find User with 'id'=1")
        end
      end
    end
  end

  describe 'PATCH' do
    describe '/lists/:id' do
      let!(:list) { FactoryBot.create(:list) }
      let(:new_params) { { list: { title: 'Grocery Shopping'} } }

      context 'when the request is valid' do
        before { patch list_path(list.id, params: new_params) }

        it 'returns the updated list' do
          expect(response).to have_http_status(200)
          expect(response_body['data']['title']).to eq('Grocery Shopping')
        end
      end

      context 'when the list is invalid' do
        let!(:list) { FactoryBot.create(:list) }
        let(:new_params) { { list: { title: nil } } }

        before { patch list_path(list.id, params: new_params) }

        it 'returns an appropriate error message' do
          expect(response).to have_http_status(422)
          expect(response_body['message']).to contain_exactly("Title can't be blank")
        end
      end

      context 'when the list does not exist' do
        let(:new_params) { { list: { title: 'Grocery Shopping'} } }

        before { patch list_path(1, params: new_params) }

        it 'returns an appropriate error message' do
          expect(response).to have_http_status(404)
          expect(response_body['message']).to eq("Couldn't find List with 'id'=1")
        end
      end
    end
  end
end
