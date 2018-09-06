require "spec_helper"

describe 'Switching Languages' do
  before(:all) do
    load_foundation_cache
  end
  
  before(:each) do
    @user_fr = User.gen(language_id: Language.find_by_iso_639_1('fr').id)
  end
  
  it 'should use the default language' 

  
  it 'should set the default language' 


  it 'should use the users language' 

  
  it 'should set the users language' 

end

