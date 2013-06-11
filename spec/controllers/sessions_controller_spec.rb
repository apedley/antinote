require 'spec_helper'

describe SessionsController do
  describe "GET 'new'" do
    context 'when there is already a user' do
      it "returns http success" do
        user = create(:user)
        get :new
        expect(response).to be_success
      end
    end
    context 'when there is no user' do
      it 'redirects to setup' do
        get :new
        expect(response).to redirect_to(home_setup_path)
      end
    end
  end

end
