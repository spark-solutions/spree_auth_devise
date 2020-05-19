RSpec.describe Spree::Api::V2::Storefront::PasswordsController, type: :controller do
  let(:user) { create(:user) }
  let(:password) { 'new_password' }
  let(:token) { 'some_token' }

  # before { @request.env['devise.mapping'] = Devise.mappings[:spree_user] }

  describe 'POST create' do
    before { post :create, params: params }

    context 'when the user email has not been specified' do
      let(:params) { { user: { email: '' } } }
      it 'responds with not found status' do
        expect(response.code).to eq('404')
      end
    end

    context 'when the user email not found' do
      let(:params) { { user: { email: 'dummy_email@example.com' } } }
      it 'responds with not found status' do
        expect(response.code).to eq('404')
      end
    end

    context 'when the user email has been specified' do
      let(:params) { { user: { email: user.email } } }
      it_behaves_like 'returns 200 HTTP status'
    end
  end

  describe 'PATCH update' do
    before {
      binding.pry
      patch :update, params: params
    }

    # context 'when updating password with blank password' do
    #   it 'responds with error' do
    #     api_put :update, params: { user: { password: '', password_confirmation: '', reset_password_token: token } }
    #     expect(response.code).to eq('422')
    #   end
    # end

    context 'when updating password with specified password' do
      let(:params) { { user: { password: password, password_confirmation: password, reset_password_token: token } } }
      it_behaves_like 'returns 200 HTTP status'
    end
  end
end
