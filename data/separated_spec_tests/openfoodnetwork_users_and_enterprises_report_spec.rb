require 'spec_helper'

module OpenFoodNetwork
  describe OrderAndDistributorReport do
    include AuthenticationWorkflow

    describe "users_and_enterprises" do
      let!(:owners_and_enterprises) { double(:owners_and_enterprises) }
      let!(:managers_and_enterprises) { double(:managers_and_enterprises) }
      let!(:subject) { OpenFoodNetwork::UsersAndEnterprisesReport.new {} }

      before do
        subject.stub(:owners_and_enterprises) { owners_and_enterprises }
        subject.stub(:managers_and_enterprises) { managers_and_enterprises }
      end

      it "should concatenate owner and manager queries" 

    end

    describe "sorting results" do
      let!(:subject) { OpenFoodNetwork::UsersAndEnterprisesReport.new {} }

      it "sorts by creation date" 


      it "then sorts by name" 


      it "then sorts by relationship type (reveresed)" 


      it "then sorts by user_email" 

    end

    describe "filtering results" do
      let!(:enterprise1) { create(:enterprise, owner: create_enterprise_user ) }
      let!(:enterprise2) { create(:enterprise, owner: create_enterprise_user ) }

      describe "for owners and enterprises" do
        describe "by enterprise id" do
          let!(:params) { { enterprise_id_in: [enterprise1.id.to_s] } }
          let!(:subject) { OpenFoodNetwork::UsersAndEnterprisesReport.new params }

          it "excludes enterprises that are not explicitly requested" 

        end

        describe "by user id" do
          let!(:params) { { user_id_in: [enterprise1.owner.id.to_s] } }
          let!(:subject) { OpenFoodNetwork::UsersAndEnterprisesReport.new params }

          it "excludes enterprises that are not explicitly requested" 

        end
      end

      describe "for managers and enterprises" do
        describe "by enterprise id" do
          let!(:params) { { enterprise_id_in: [enterprise1.id.to_s] } }
          let!(:subject) { OpenFoodNetwork::UsersAndEnterprisesReport.new params }

          it "excludes enterprises that are not explicitly requested" 

        end

        describe "by user id" do
          let!(:manager1) { create_enterprise_user }
          let!(:manager2) { create_enterprise_user }
          let!(:params) { { user_id_in: [manager1.id.to_s] } }
          let!(:subject) { OpenFoodNetwork::UsersAndEnterprisesReport.new params }

          before do
            enterprise1.enterprise_roles.build(user: manager1).save
            enterprise2.enterprise_roles.build(user: manager2).save
          end

          it "excludes enterprises whose managers are not explicitly requested" 

        end
      end
    end
  end
end

