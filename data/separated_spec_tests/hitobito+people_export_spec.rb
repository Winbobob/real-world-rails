# encoding: utf-8

#  Copyright (c) 2012-2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe 'Dropdown::PeopleExport' do

  include FormatHelper
  include LayoutHelper
  include UtilityHelper

  let(:user) { people(:top_leader) }
  let(:dropdown) do
    Dropdown::PeopleExport.new(self,
                               user,
                               { controller: 'people', group_id: groups(:top_group).id },
                               households: true, labels: true)
  end

  subject { dropdown.to_s }

  def can?(*args)
    true
  end

  it 'renders dropdown' 


  context 'for global labels' do
    before :each do
      Fabricate(:label_format, name: 'SampleFormat')
    end

    it 'includes global formats if Person#show_global_label_formats is true' 


    it 'excludes global formats if Person#show_global_label_formats is false' 

  end
end

