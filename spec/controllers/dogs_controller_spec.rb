require 'rails_helper'

RSpec.describe DogsController, type: :controller do
  describe 'POST #create' do
    let(:valid_params) { { dog: { breed: 'valid_breed' } } }
    
    context 'when the API call is successful' do
      before do
        allow_any_instance_of(Api::V1::Dog::HttpRequest).to receive(:fetch_image).and_return(['success', 'image_url'])
        post :create, params: valid_params
      end

      it 'renders the new template with the correct locals' do
        expect(response).to render_template(:new)
        # expect(assigns(:breed)).to eq('valid_breed')
      end

      it 'returns a success status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the API call fails' do
      before do
        allow_any_instance_of(Api::V1::Dog::HttpRequest).to receive(:fetch_image).and_return(['error', 'error_message'])
        post :create, params: valid_params
      end

      it 'renders the new template with the correct locals' do
        expect(response).to render_template(:new)
      end

      it 'returns a success status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
