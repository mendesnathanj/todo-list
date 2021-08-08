# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe 'validations' do
    let(:description) { 'Need to buy milk.' }
    let(:completed) { false }
    let(:list) { FactoryBot.create(:list) }
    let(:todo) { FactoryBot.create(:todo, description: description, completed: completed, list: list) }

    context 'when the todo has no description' do
      let(:description) { nil }
      it 'is not valid' do
        expect { todo }.to raise_error(ActiveRecord::RecordInvalid, /Description can't be blank/)
      end
    end
  end
end
