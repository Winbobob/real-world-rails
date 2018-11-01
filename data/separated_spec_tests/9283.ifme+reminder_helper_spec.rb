describe ReminderHelper do
  name1 = 'name1'
  name2 = 'name2'
  reminder_names = [
    name1, name2
  ]

  let(:user) { create(:user_oauth) }

  describe '#active_reminders?' do
    it 'returns false when data has no active_reminder method' 


    it 'returns false when data has no active reminder' 


    it 'returns true when data is good' 

  end

  describe '#join_names' do
    it 'correctly joins reminder names with proper connector' 

  end

  describe '#format_reminders' do
    it 'returns correct html div' 

  end

  describe '#print_reminders' do
    it 'returns empty string when data has no reminders' 


    it 'returns correct html when data has a daily reminder' 


    it 'returns correct html when data has a refill reminder' 


    it 'returns correct html when data has a daily reminder and refill reminder' 


    it 'returns correct html when data has a Google calendar reminder' 


    it 'returns correct html when data has all reminders' 

  end
end

