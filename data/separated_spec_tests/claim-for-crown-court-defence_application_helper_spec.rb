require "rails_helper"

describe ApplicationHelper do

  context '#present' do
    let(:claim) { create(:claim) }

    it 'returns a <Classname>Presenter instance' 


    it 'yields a <Classname>Presenter Class' 


  end

  context '#present_collection' do
    let(:claims) { create_list(:claim, 2) }

    it 'should return a collection of <Classname>Presenter instances' 


    it 'should yield a collection of <Classname>Presenter Class instances' 


  end

  context '#number_with_precision_or_default' do

    it 'should return empty string if given integer zero and no precision' 


    it 'should return empty string if given integer zero and precision' 


    it 'should return empty string if given BigDecimal zero' 


    it 'should return empty string if given Float zero' 


    it 'should return 3.33 if given 3.3333 with precsion 2' 


    it 'should return 24.5 if given 24.5 with no precision' 


    it 'should return 4 if given 3.645 with precsion 0' 


    context 'with default specified' do
      it 'should return default value if given Float zero with precision 2' 


      it 'should NOT return default value if given a non-zero value' 

    end

    context '#user_requires_scheme_column?' do
      let(:admin)     { create(:external_user, :agfs_lgfs_admin) }
      let(:advocate)  { create(:external_user, :advocate) }
      let(:litigator) { create(:external_user, :litigator) }

      it 'should return true for those users that could have AGFS and LGFS claims' 


      it 'should return false for users that only handle AGFS claims' 


      it 'should return true for users that only handle LGFS claims' 


    end

  end

end

