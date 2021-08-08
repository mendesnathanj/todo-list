# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:first_name) { 'Meester' }
    let(:last_name) { 'Mustache' }
    let(:user) { FactoryBot.create(:user, first_name: first_name, last_name: last_name) }

    context 'when the user has no first name' do
      let(:first_name) { nil }

      it 'is invalid' do
        expect { user }.to raise_error(ActiveRecord::RecordInvalid, /First name can't be blank/)
      end
    end

    context 'when the user has no last name' do
      let(:last_name) { nil }
      it 'is invalid' do
        expect { user }.to raise_error(ActiveRecord::RecordInvalid, /Last name can't be blank/)
      end
    end
  end
end
