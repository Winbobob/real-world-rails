describe 'AddingStrategy' do
  let!(:user) { FactoryBot.create(:user_oauth) }
  before do
    login_as user
    change_page ->{ visit new_strategy_path }, '[name="strategy[name]"]'
  end

  it 'creates a new Strategy' 


  context 'and turns on reminders' do
    it 'creates a new strategy with reminders' 

  end
end

