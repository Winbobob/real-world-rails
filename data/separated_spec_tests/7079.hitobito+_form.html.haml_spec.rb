# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'
describe 'groups/_form.html.haml' do
  let(:group) { groups(:top_layer) }
  before { allow(view).to receive_messages(model_class: Group, path_args: group) }
  before { allow(view).to receive_messages(entry: GroupDecorator.new(group)) }

  it 'does render contactable and extension partials' 

end

