require 'rails_helper'

describe 'FullnameGenerator' do

  let!(:name1) { "John Smith" }
  let!(:name2) { "John" }
  let!(:name3) { "  John"}
  let!(:name4) { "John "}
  let!(:name5) { "  " }
  let!(:name6) { nil }
  let!(:corrected) { "John John" }
  let!(:default_name) { "Firstname Lastname" }


  def generate name
    FullnameGenerator.new(name).generate
  end

  it 'does not change a name that is already full' 


  it 'does change a name that is not full' 


  it 'handles useless spaces in front' 


  it 'handles useless spaces in back' 


  it 'handles empty names' 


  it 'handles nil names' 

end

