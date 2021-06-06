# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  before do
    user = FactoryBot.create(:user)
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET #index' do
    context 'when logged in' do
      let(:home_index) { get :index }

      it 'returns http success' do
        home_index
        expect(response).to have_http_status(:success)
      end
    end
  end
end
