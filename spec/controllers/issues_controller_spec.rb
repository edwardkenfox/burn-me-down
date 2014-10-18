require 'spec_helper'

RSpec.describe IssuesController, type: :controller do
  let(:team) { create(:team) }
  let(:user) { create(:user) }
  let!(:team_user) { create(:team_user, team: team, user: user) }
  let!(:chart) { create(:chart, team: team) }
  let!(:issue) { create(:issue, chart: chart) }

  let(:other_team_chart) { create(:chart, team: create(:team)) }

  let(:valid_attributes) { { url: "http://www.example.com", open: 1 } }
  let(:invalid_attributes) { { url: "", open: 1 } }

  before { sign_in user }

  describe "GET index" do
    it "assigns all issues as @issues" do
      get :index, chart_id: chart.id
      expect(assigns(:issues)).to eq [issue]
    end
  end

  describe "GET show" do
    it "assigns the requested issue as @issue" do
      get :show, { id: issue, chart_id: chart.id }
      expect(assigns(:issue)).to eq issue
    end
  end

  describe "GET new" do
    it "assigns a new issue as @issue" do
      get :new, chart_id: chart.id
      expect(assigns(:issue)).to be_a_new Issue
    end
  end

  describe "GET edit" do
    it "assigns the requested issue as @issue" do
      get :edit, { id: issue, chart_id: chart.id }
      expect(assigns(:issue)).to eq issue
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Issue" do
        expect {
          post :create, chart_id: chart.id, issue: valid_attributes
        }.to change(Issue, :count).by 1
      end

      it "redirects to the created issue" do
        post :create, chart_id: chart.id, issue: valid_attributes
        expect(response).to redirect_to chart_issue_path(chart, Issue.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved issue as @issue" do
        post :create, chart_id: chart.id, issue: invalid_attributes
        expect(assigns(:issue)).to be_a_new(Issue)
      end

      it "re-renders the 'new' template" do
        post :create, chart_id: chart.id, issue: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { { url: "http://updated.example.com" } }

      it "updates the requested issue" do
        put :update, id: issue, chart_id: chart.id, issue: new_attributes
        issue.reload
        expect(Issue.find(issue).url).to eq new_attributes[:url]
      end

      it "assigns the requested issue as @issue" do
        put :update, id: issue, chart_id: chart.id, issue: valid_attributes
        expect(assigns(:issue)).to eq issue
      end

      it "redirects to the issue" do
        put :update, id: issue, chart_id: chart.id, issue: valid_attributes
        expect(response).to redirect_to chart_issue_path(chart, issue)
      end
    end

    describe "with invalid params" do
      it "assigns the issue as @issue" do
        put :update, id: issue, chart_id: chart.id, issue: invalid_attributes
        expect(assigns(:issue)).to eq issue
      end

      it "re-renders the 'edit' template" do
        put :update, id: issue, chart_id: chart.id, issue: invalid_attributes
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested issue" do
      expect {
        delete :destroy, { id: issue, chart_id: chart.id }
      }.to change(Issue, :count).by(-1)
    end

    it "redirects to the issues list" do
      delete :destroy, { id: issue, chart_id: chart.id }
      expect(response).to redirect_to chart_issues_path(chart, issue)
    end
  end

end
