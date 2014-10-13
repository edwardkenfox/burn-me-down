require 'spec_helper'

RSpec.describe ChartsController, type: :controller do
  let(:team) { create(:team) }
  let(:user) { create(:user) }
  let!(:team_user) { create(:team_user, team: team, user: user) }
  let!(:chart) { create(:chart, team: team) }

  let(:other_team_chart) { create(:chart, team: create(:team)) }

  let(:valid_attributes) { { name: "Valid Chart", team_id: 1 } }
  let(:invalid_attributes) { { name: "", team_id: nil } }

  before { sign_in user }

  describe "GET #index" do
    before { get :index }

    it "assigns all charts as @charts" do
      expect(assigns(:charts)).to eq [chart]
    end

    it "does not assign other teams chart as @charts" do
      expect(assigns(:charts)).not_to include other_team_chart
    end
  end

  describe "GET #show" do
    it "assigns the requested chart as @chart" do
      get :show, id: chart
      expect(assigns(:chart)).to eq chart
    end

    it "denies access to other teams chart as @chart" do
      expect{
        get :show, id: other_team_chart
      }.to raise_error Pundit::NotAuthorizedError
    end
  end

  describe "GET #new" do
    it "assigns a new chart as @chart" do
      get :new
      expect(assigns(:chart)).to be_a_new Chart
    end
  end

  describe "GET #edit" do
    it "assigns the requested chart as @chart" do
      get :edit, id: chart
      expect(assigns(:chart)).to eq chart
    end

    it "denies access to other teams chart as @chart" do
      expect{
        get :edit, id: other_team_chart
      }.to raise_error Pundit::NotAuthorizedError
    end
  end

  describe "POST #create" do
    describe "with valid params" do
      it "creates a new Chart" do
        expect {
          post :create, chart: valid_attributes
        }.to change(Chart, :count).by 1
      end

      it "redirects to the created chart" do
        post :create, chart: valid_attributes
        expect(response).to redirect_to Chart.last
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved chart as @chart" do
        post :create, chart: invalid_attributes
        expect(assigns(:chart)).to be_a_new Chart
      end

      it "re-renders the 'new' template" do
        post :create, chart: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    describe "with valid params" do
      let(:new_attributes) { { name: "Updated Attributes"} }

      it "updates the requested chart" do
        put :update, id: chart, chart: new_attributes
        chart.reload
        expect(Chart.find(chart).name).to eq new_attributes[:name]
      end

      it "assigns the requested chart as @chart" do
        put :update, id: chart, chart: valid_attributes
        expect(assigns(:chart)).to eq chart
      end

      it "redirects to the chart" do
        put :update, id: chart, chart: valid_attributes
        expect(response).to redirect_to chart
      end
    end

    describe "with invalid params" do
      it "assigns the chart as @chart" do
        put :update, id: chart, chart: invalid_attributes
        expect(assigns(:chart)).to eq chart
      end

      it "re-renders the 'edit' template" do
        put :update, id: chart, chart: invalid_attributes
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested chart" do
      expect {
        delete :destroy, id: chart.to_param
      }.to change(Chart, :count).by(-1)
    end

    it "redirects to the charts list" do
      delete :destroy, id: chart.to_param
      expect(response).to redirect_to charts_url
    end
  end

end
