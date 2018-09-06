# encoding: utf-8

#  Copyright (c) 2018, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Export::ExportBaseJob do

  class MyJob < described_class
    self.parameters = PARAMETERS
  end

  let(:subject) { MyJob.new }

  it 'sets locale when reading job from database' 


end

