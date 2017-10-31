require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders new users page' do
      get :new, params: { user: {} }
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    context 'with invalid credentials' do
      it 'renders new user page' do
        post :create, params: { user: { username: 'ashley', password: '123' } }
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end
    end

    context 'with valid credentials' do
      it 'redirects to user\'s goal page' do
        post :create, params: { user: { username: 'jeff', password: '1234567' } }
        expect(response).to redirect_to(user_url(current_user.id))
      end
    end
  end
end
