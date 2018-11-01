require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  render_views

  let(:participant) { create :participant, admin: true }

  let(:valid_attributes) {
    FactoryBot.attributes_for(:article, participant_id: participant.id)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:article, :invalid)
  }

  3.times do |i|
    let!("article_#{i + 1}") { create :article, participant: participant }
  end

  context 'admin' do
    before do
      sign_in participant
    end

    describe 'GET #index' do
      before { get :index }
      it { expect(assigns(:articles).sort).to eq [article_1, article_2, article_3].sort }
      it { expect(response).to render_template :index }
    end

    describe 'GET #show' do
      before { get :show, params: { id: article_1.id } }
      it { expect(assigns(:article)).to eq article_1 }
      it { expect(response).to render_template :show }
    end

    describe "GET #new" do
      before { get :new }
      it { expect(assigns(:article)).to be_a_new(Article) }
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Article" 


        it "assigns a newly created article as @article" 


        it "creates a placeholder section" 


        it "redirects to the created article" 

      end

      context "with invalid params" do
        it "assigns a newly created but unsaved article as @article" 


        it "re-renders the 'new' template" 

      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          { article: 'A new body of article text' }
        }

        it "updates the requested article" 


        it "assigns the requested article as @article" 


        it "redirects to the article" 

      end

      context "with invalid params" do
        it "assigns the article as @article" 


        it "re-renders the 'edit' template" 

      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested article" 


      it "redirects to the articles list" 

    end
  end

end

