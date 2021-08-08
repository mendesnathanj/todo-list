# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  describe 'validations' do
    let(:title) { 'Grocery Shopping' }
    let(:list) { FactoryBot.create(:list, title: title) }

    context 'when the list has no title' do
      let(:title) { nil }

      it 'is invalid' do
        expect { list }.to raise_error(ActiveRecord::RecordInvalid, /Title can't be blank/)
      end
    end
  end
end
