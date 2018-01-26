require "rails_helper"


RSpec.describe "team management", :type => :request do

  it "creates a team and redirects to the team's page" do
    get "/teams/new"
    expect(response).to render_template(:new)

    post "/teams", :params => { :team => { city: "Dallas", nickname: "Cowboys", colors: "Navy Blue, Metallic Silver, White, Royal Blue", email: "dallas@cowboys.com", logo: URI.parse("https://s3.us-east-2.amazonaws.com/dbc-space-app/teams/logos/000/000/001/original/dallas.png").open }}


    expect(response).to redirect_to(assigns(:team))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include("team was successfully created.")
  end

  it "does not render a different template" do
    get "/teams/new"
    expect(response).to_not render_template(:show)
  end
end


describe "Public access to teams", type: :request do
        before do
        @user = FactoryBot.create(:team)
  it "denies access to teams#new" do
    get new_team_path
    expect(response).to redirect_to new_user_session_url
  end

  it "denies access to teams#create" do
    team_attributes = FactoryBot.attributes_for(:team)

    expect {
      post "/teams", { team: team_attributes }
    }.to_not change(Team, :count)

    expect(response).to redirect_to login_url
  end
  end
end




