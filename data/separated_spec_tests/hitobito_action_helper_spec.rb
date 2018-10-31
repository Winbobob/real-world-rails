# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'


describe ActionHelper do

  include LayoutHelper
  include I18nHelper
  include UtilityHelper
  include ActionHelper
  include FormatHelper
  include CrudTestHelper

  before(:all) do
    reset_db
    setup_db
    create_test_data
  end

  after(:all) { reset_db }


  describe '#button_action_destroy' do
    let(:entry) { people(:top_leader) }

    context 'without options' do
      subject do
        button_action_destroy
      end

      it 'should contain person path' 


      it 'should have method delete' 


      it 'should have standard prompt' 

    end

    context 'with options' do
      it 'should override data-confirm' 


      it 'should override data-method' 


      it 'should override path' 

    end
  end
end

