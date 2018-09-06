# encoding: utf-8
#  Copyright (c) 2012-2018, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Export::Tabular::People::Households do

  let(:leader) { people(:top_leader) }
  let(:member) { people(:bottom_member) }

  def households(list = [])
    Export::Tabular::People::Households.new(list)
  end

  context 'header' do
    it 'includes name, address attributes and layer group columns' 


    it 'translates name, address attributes and layer group columns' 

  end

  it 'accepts non household people' 


  it 'accepts single person array' 


  it 'aggregates household people, uses first person''s address' 


end

