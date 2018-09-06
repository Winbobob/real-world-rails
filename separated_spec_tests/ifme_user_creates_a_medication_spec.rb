describe 'UserCreatesAMedication', js: true do
  let(:user) { create(:user_oauth) }
  let(:medication) { user.medications.last }
  let(:name) { 'A medication name' }

  before do 
    login_as user
    visit new_medication_path
  end

  context 'invalid form input' do
    it 'does not create a new Medication' 

  end

  context 'valid form input' do
    before do
      CalendarUploader.stub_chain(:new, :upload_event)
      fill_in 'Name', with: name
      fill_in 'medication_comments', with: 'A comment'
      fill_in 'Strength', with: 100
      fill_in 'Total', with: 30
      fill_in 'Dosage', with: 2
      page.execute_script('$("#medication_refill").val("05/25/2016")')
    end

    it 'creates a new medication' 


    context 'with reminders checked' do
      it 'activates reminders' 

    end

    context 'with Google Calendar reminders checked' do
      it 'activates reminders' 

    end

    context 'when uploader raises an error' do
      before do
        CalendarUploader.stub_chain(:new, :upload_event).and_raise(StandardError)
      end

      it 'redirects to sign in' 

    end
  end
end

