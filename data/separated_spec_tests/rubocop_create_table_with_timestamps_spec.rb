# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::CreateTableWithTimestamps do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense when calling `#create_table` without block' 


  it 'registers an offense when not including timestamps in empty block' 


  it 'registers an offense when not including timestamps in one line block' 


  it 'registers an offense when not including timestamps in multiline block' 


  it 'registers an offense when not including timestamps' \
     'with `to_proc` syntax' do
    expect_offense <<-RUBY
      create_table :users, &:extension_columns
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Add timestamps when creating a new table.
    RUBY
  end

  it 'does not register an offense when including timestamps in block' 


  it 'does not register an offense when including timestamps' \
     'with `to_proc` syntax' do
    expect_no_offenses <<-RUBY
      create_table :users, &:timestamps
    RUBY
  end

  it 'does not register an offense when including timestamps' \
     'with options and `to_proc` syntax' do
    expect_no_offenses <<-RUBY
      create_table :users, id: :string, limit: 42, &:timestamps
    RUBY
  end

  it 'does not register an offense when including created_at in block' 


  it 'does not register an offense when including updated_at in block' 

end

