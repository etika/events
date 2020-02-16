require 'rails_helper'
require './spec/support/devise.rb'
RSpec.describe EventsController, type: :controller  do
  describe "GET /" do
    login_user
     context 'from login user' do
      it "should return 200:ok" do
      	get :index
      	expect(response).to have_http_status(:success)
      end
     end
  end
end