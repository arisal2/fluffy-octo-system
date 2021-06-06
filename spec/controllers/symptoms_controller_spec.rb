# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SymptomsController, type: :controller do
  before do
    user = FactoryBot.create(:user)
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET #index' do
    context 'when logged in' do
      let(:symptom_index) { get :index }

      it 'returns http success' do
        symptom_index
        expect(response).to have_http_status(:success)
      end
    end
  end
end
