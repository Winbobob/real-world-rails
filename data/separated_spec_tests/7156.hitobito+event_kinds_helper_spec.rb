# encoding: utf-8

#  Copyright (c) 2012-2014, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe EventKindsHelper do

  context 'qualification kinds' do
    let(:old) { qualification_kinds(:old) }
    let(:entry) { event_kinds(:glk) }
    let(:form) { StandardFormBuilder.new(:event_kind, event_kinds(:glk), view, {}) }
    let(:collection) { QualificationKind.without_deleted.list }

    before do
      allow(helper).to receive(:t).with(any_args()) { 'foo' }
      allow(helper).to receive(:entry) { entry }
    end

    it 'does not include deleted qualifications if not selected' 


    it 'includes deleted qualifications if selected' 


  end
end
