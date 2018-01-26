require "rails_helper"

RSpec.describe PositionsController, type: :controller do
  describe "#index" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "responds successfully" do
        sign_in @user
        get :index
        aggregate_failures do
          expect(response).to be_success
          expect(response).to have_http_status "200"
        end
      end
    end

    context "as a guest" do
      it "responds successfully" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "#show" do
    context "as an authorized user" do
      before do
        @position = FactoryBot.create(:position)
        @user = FactoryBot.create(:user)
      end

      it "responds successfully" do
        sign_in @user
        get :show, params: { id: @position.id }
        expect(response).to be_success
      end
    end

    context "as an unauthorized user" do
      before do
        @user = FactoryBot.create(:user)
        @position = FactoryBot.create(:position)
      end

      it "responds successfully" do
        get :show, params: { id: @position.id }
        expect(response).to be_success
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "#create" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end

      context "with valid attributes" do
        it "adds a position" do
          position_params = FactoryBot.attributes_for(:position)
          sign_in @user
          expect {
            post :create, params: { position: position_params }
          }.to change(Position, :count).by(1)
        end
      end

      context "with invalid attributes" do
        it "does not add a position" do
          position_params = FactoryBot.attributes_for(:position, :invalid)
          sign_in @user
          expect {
            post :create, params: { position: position_params }
          }.to_not change(Position, :count)
        end
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        position_params = FactoryBot.attributes_for(:position)
        post :create, params: { position: position_params }
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        position_params = FactoryBot.attributes_for(:position)
        post :create, params: { position: position_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#update" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @position = FactoryBot.create(:position)
      end

      it "updates a position" do
        position_params = FactoryBot.attributes_for(:position,
          name: "New position name")
        sign_in @user
        patch :update, params: { id: @position.id, position: position_params }
        expect(@position.reload.name).to eq "New position name"
      end
    end

    context "as a guest" do
      before do
        @position = FactoryBot.create(:position)
      end

      it "returns a 302 response" do
        position_params = FactoryBot.attributes_for(:position)
        patch :update, params: { id: @position.id, position: position_params }
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        position_params = FactoryBot.attributes_for(:position)
        patch :update, params: { id: @position.id, position: position_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#destroy" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @position = FactoryBot.create(:position)
      end

      it "deletes a position" do
        sign_in @user
        expect {
          delete :destroy, params: { id: @position.id }
        }.to change(Position, :count).by(-1)
      end
    end

    context "as a guest" do
      before do
        @position = FactoryBot.create(:position)
      end

      it "returns a 302 response" do
        delete :destroy, params: { id: @position.id }
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        delete :destroy, params: { id: @position.id }
        expect(response).to redirect_to "/users/sign_in"
      end

      it "does not delete the position" do
        expect {
          delete :destroy, params: { id: @position.id }
        }.to_not change(Position, :count)
      end
    end
  end

end