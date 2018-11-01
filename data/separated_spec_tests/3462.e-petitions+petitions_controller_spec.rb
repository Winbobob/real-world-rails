require 'rails_helper'

RSpec.describe Archived::PetitionsController, type: :controller do
  let!(:parliament) { FactoryBot.create(:parliament, :archived) }

  describe "GET #index" do
    context "when no state param is provided" do
      it "is successful" 


      it "exposes a search scoped to the all facet" 

    end

    context "when a state param is provided" do
      context "but it is not a public facet from the locale file" do
        it "redirects to itself with state=all" 


        it "preserves other params when it redirects" 

      end

      context "and it is a public facet from the locale file" do
        it "is successful" 


        it "exposes a search scoped to the state param" 

      end
    end
  end

  describe "GET #show" do
    context "when the petition is visible" do
      let!(:petition) { FactoryBot.create(:archived_petition) }

      it "assigns the given petition" 

    end

    context "when the petition is hidden" do
      let!(:petition) { FactoryBot.create(:archived_petition, :hidden) }

      it "raises a ActiveRecord::RecordNotFound error" 

    end

    context "when the petition is stopped" do
      let!(:petition) { FactoryBot.create(:archived_petition, :stopped) }

      it "raises a ActiveRecord::RecordNotFound error" 

    end

    context "when the petition is archived but the parliament is not" do
      let!(:parliament) { FactoryBot.create(:parliament) }
      let!(:petition) { FactoryBot.create(:archived_petition, parliament: parliament) }

      it "redirects to the current petition" 

    end
  end
end

