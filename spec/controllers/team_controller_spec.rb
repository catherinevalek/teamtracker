require "rails_helper"

RSpec.describe TeamsController, type: :controller do
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
        @team = FactoryBot.create(:team)
        @user = FactoryBot.create(:user)
      end

      it "responds successfully" do
        sign_in @user
        get :show, params: { id: @team.id }
        expect(response).to be_success
      end
    end

    context "as an unauthorized user" do
      before do
        @user = FactoryBot.create(:user)
        @team = FactoryBot.create(:team)
      end

      it "responds successfully" do
        get :show, params: { id: @team.id }
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
        it "adds a team" do
          team_params = FactoryBot.attributes_for(:team)
          sign_in @user
          expect {
            post :create, params: { team: team_params }
          }.to change(Team, :count).by(1)
        end
      end

      context "with invalid attributes" do
        it "does not add a team" do
          team_params = FactoryBot.attributes_for(:team, :invalid)
          sign_in @user
          expect {
            post :create, params: { team: team_params }
          }.to_not change(Team, :count)
        end
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        team_params = FactoryBot.attributes_for(:team)
        post :create, params: { team: team_params }
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        team_params = FactoryBot.attributes_for(:team)
        post :create, params: { team: team_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#update" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @team = FactoryBot.create(:team)
      end

      it "updates a team" do
        sign_in @user
        patch :update, params: { id: @team.id, team: {:nickname=>"Texans"} }
        expect(@team.reload.nickname).to eq "Texans"
      end
    end

    context "as a guest" do
      before do
        @team = FactoryBot.create(:team)
      end

      it "returns a 302 response" do
        team_params = FactoryBot.attributes_for(:team)
        patch :update, params: { id: @team.id, team: team_params }
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        team_params = FactoryBot.attributes_for(:team)
        patch :update, params: { id: @team.id, team: team_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#destroy" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @team = FactoryBot.create(:team)
      end

      it "deletes a team" do
        sign_in @user
        expect {
          delete :destroy, params: { id: @team.id }
        }.to change(Team, :count).by(-1)
      end
    end

    context "as a guest" do
      before do
        @team = FactoryBot.create(:team)
      end

      it "returns a 302 response" do
        delete :destroy, params: { id: @team.id }
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        delete :destroy, params: { id: @team.id }
        expect(response).to redirect_to "/users/sign_in"
      end

      it "does not delete the team" do
        expect {
          delete :destroy, params: { id: @team.id }
        }.to_not change(Team, :count)
      end
    end
  end

end