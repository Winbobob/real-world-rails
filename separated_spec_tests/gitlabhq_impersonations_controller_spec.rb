require 'spec_helper'

describe Admin::ImpersonationsController do
  let(:impersonator) { create(:admin) }
  let(:user) { create(:user) }

  describe "DELETE destroy" do
    context "when not signed in" do
      it "redirects to the sign in page" 

    end

    context "when signed in" do
      before do
        sign_in(user)
      end

      context "when not impersonating" do
        it "responds with status 404" 


        it "doesn't sign us in" 

      end

      context "when impersonating" do
        before do
          session[:impersonator_id] = impersonator.id
        end

        context "when the impersonator is not admin (anymore)" do
          before do
            impersonator.admin = false
            impersonator.save
          end

          it "responds with status 404" 


          it "doesn't sign us in as the impersonator" 

        end

        context "when the impersonator is admin" do
          context "when the impersonator is blocked" do
            before do
              impersonator.block!
            end

            it "responds with status 404" 


            it "doesn't sign us in as the impersonator" 

          end

          context "when the impersonator is not blocked" do
            shared_examples_for "successfully stops impersonating" do
              it "redirects to the impersonated user's page" 


              it "signs us in as the impersonator" 

            end

            # base case
            it_behaves_like "successfully stops impersonating"

            context "and the user has a temporary oauth e-mail address" do
              before do
                allow(user).to receive(:temp_oauth_email?).and_return(true)
                allow(controller).to receive(:current_user).and_return(user)
              end

              it_behaves_like "successfully stops impersonating"
            end
          end
        end
      end
    end
  end
end

