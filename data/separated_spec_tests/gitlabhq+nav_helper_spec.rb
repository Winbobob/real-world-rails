require 'spec_helper'

describe NavHelper do
  describe '#header_links' do
    before do
      allow(helper).to receive(:session) { {} }
    end

    context 'when the user is logged in' do
      let(:user) { build(:user) }

      before do
        allow(helper).to receive(:current_user).and_return(user)
        allow(helper).to receive(:can?) { true }
      end

      it 'has all the expected links by default' 


      it 'contains the impersonation link while impersonating' 


      context 'when the user cannot read cross project' do
        before do
          allow(helper).to receive(:can?).with(user, :read_cross_project) { false }
        end

        it 'does not contain cross project elements when the user cannot read cross project' 


        it 'shows the search box when the user cannot read cross project and he is visiting a project' 

      end
    end

    it 'returns only the sign in and search when the user is not logged in' 

  end
end

