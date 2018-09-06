RSpec.describe 'Site labels configuration' do
  context 'as an administrator' do
    let(:user) { FactoryGirl.create(:admin) }

    before do
      login_as(user, scope: :user)
    end

    describe 'application name' do
      it 'updates the application name in the brand bar' 


      it 'updates the application name in the <head> <title>' 

    end

    describe 'institution name' do
      before do
        Site.update(
          application_name: 'Test',
          institution_name_full: 'fullname'
        )
      end
      it 'updates the institution name in the agreement text' 

    end

    describe 'institution name full' do
      before do
        Site.update(
          application_name: 'Test',
          institution_name: 'name'
        )
      end
      it 'updates the full institution name in the agreement text' 

    end
  end
end

