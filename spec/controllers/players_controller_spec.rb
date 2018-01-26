require "rails_helper"

RSpec.describe PlayersController, type: :controller do
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
        @player = FactoryBot.create(:player)
        @user = FactoryBot.create(:user)
      end

      it "responds successfully" do
        sign_in @user
        get :show, params: { id: @player.id }
        expect(response).to be_success
      end
    end

    context "as an unauthorized user" do
      before do
        @user = FactoryBot.create(:user)
        @player = FactoryBot.create(:player)
      end

      it "responds successfully" do
        get :show, params: { id: @player.id }
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
        it "adds a player" do
          player_params = FactoryBot.build(:player).attributes
          # build_attributes(:player)
          sign_in @user
          # binding.pry
          expect {
            post :create, params: { player: player_params }
          }.to change(Player, :count).by(1)
        end
      end

      context "with invalid attributes" do
        it "does not add a player" do
          player_params = FactoryBot.attributes_for(:player, :invalid)
          sign_in @user
          expect {
            post :create, params: { player: player_params }
          }.to_not change(Player, :count)
        end
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        player_params = FactoryBot.attributes_for(:player)
        post :create, params: { player: player_params }
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        player_params = FactoryBot.attributes_for(:player)
        post :create, params: { player: player_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#update" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @player = FactoryBot.create(:player)
      end

      it "updates a player" do
        player_params = FactoryBot.attributes_for(:player,
          name: "New player first name")
        sign_in @user
        patch :update, params: { id: @player.id, player: {:first_name =>"New player first name"} }
        expect(@player.reload.first_name).to eq "New player first name"
      end
    end

    context "as a guest" do
      before do
        @player = FactoryBot.create(:player)
      end

      it "returns a 302 response" do
        player_params = FactoryBot.attributes_for(:player)
        patch :update, params: { id: @player.id, player: player_params }
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        player_params = FactoryBot.attributes_for(:player)
        patch :update, params: { id: @player.id, player: player_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#destroy" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @player = FactoryBot.create(:player)
      end

      it "deletes a player" do
        sign_in @user
        expect {
          delete :destroy, params: { id: @player.id }
        }.to change(Player, :count).by(-1)
      end
    end

    context "as a guest" do
      before do
        @player = FactoryBot.create(:player)
      end

      it "returns a 302 response" do
        delete :destroy, params: { id: @player.id }
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        delete :destroy, params: { id: @player.id }
        expect(response).to redirect_to "/users/sign_in"
      end

      it "does not delete the player" do
        expect {
          delete :destroy, params: { id: @player.id }
        }.to_not change(Player, :count)
      end
    end
  end

end