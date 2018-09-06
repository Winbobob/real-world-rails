# encoding: utf-8

#  Copyright (c) 2012-2014, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe 'Dropdown::GroupAdd' do

  include FormatHelper
  include I18nHelper
  include LayoutHelper
  include UtilityHelper

  let(:group) { groups(:top_layer) }
  let(:dropdown) { Dropdown::GroupAdd.new(self, group)}

  subject { dropdown.to_s }

  def can?(*args)
    true
  end

  it 'renders dropdown' 

end

