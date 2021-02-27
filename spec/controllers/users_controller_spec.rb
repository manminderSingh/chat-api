require 'rails_helper'

describe UsersController, type: :controller do

  # # include ApiHelper
  # describe 'GET #index' do
  #   it 'get call to index' do
  #     get :index
  #     expect(response).to be_successful
  #   end

  #   # context 'with an unauthenticated user' do
  #   #   it 'returns unauthorized' do
  #   #     get :index
  #   #     expect(response).to 
  #   #   end
  #   # end
  
  #   context 'with an authenticated user' do
  #     let(:user) { create(:user) }
  
  #     it 'renders json listing resource with id' do
  #       # expected_result = { id: 123, title: 'Resource 123' }
  #       authenticated_header(request, user)
  #       get :search_by_id, params: { "id" : "123" }
  #       expect(response).to be_successful
  #       expect(JSON.parse(response.body)).to eq expected_result
  #     end
  #   end

  # end
end
