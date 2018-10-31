# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::FindEach do
  subject(:cop) { described_class.new }

  shared_examples 'register_offense' do |scope|
    it "registers an offense when using #{scope}.each" 


    it "does not register an offense when using #{scope}.order(...).each" 


    it "does not register an offense when using #{scope}.limit(...).each" 


    it "does not register an offense when using #{scope}.select(...).each" 

  end

  it_behaves_like('register_offense', 'all')
  it_behaves_like('register_offense', 'eager_load(:association_name)')
  it_behaves_like('register_offense', 'includes(:association_name)')
  it_behaves_like('register_offense', 'joins(:association_name)')
  it_behaves_like('register_offense', 'left_joins(:association_name)')
  it_behaves_like('register_offense', 'left_outer_joins(:association_name)')
  it_behaves_like('register_offense', 'preload(:association_name)')
  it_behaves_like('register_offense', 'references(:association_name)')
  it_behaves_like('register_offense', 'unscoped')
  it_behaves_like('register_offense', 'where(name: name)')
  it_behaves_like('register_offense', 'where.not(name: name)')

  it 'does not register an offense when called on a constant' 


  it 'does not register an offense when using find_by' 


  it 'auto-corrects each to find_each' 


  it 'registers an offense with non-send ancestors' 


  it 'does not register an offense when using order(...) earlier' 

end

