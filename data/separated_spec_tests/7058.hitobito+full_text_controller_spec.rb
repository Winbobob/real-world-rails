# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe FullTextController, type: :controller do

  before { sign_in(people(:top_leader)) }

  [SearchStrategies::Sphinx, SearchStrategies::Sql].each do |strategy|

    context strategy.name.demodulize.downcase do
      before do
        [[:list_people, Person.where(id: people(:bottom_member).id)],
         [:query_people, Person.where(id: people(:bottom_member).id)],
         [:query_groups, Group.where(id: groups(:bottom_layer_one).id)],
         [:query_events, Event.where(id: events(:top_course).id)]].each do |stub, value|
          allow_any_instance_of(strategy).to receive(stub).and_return(value)
        end

        allow(Hitobito::Application).to receive(:sphinx_present?)
          .and_return(strategy == SearchStrategies::Sphinx)
      end

      describe 'GET index' do

        before do
          sign_in(people(:top_leader))
        end

        it 'uses correct search strategy' 


        it 'finds person' 


        context 'without any params' do
          it 'returns nothing' 

        end

      end

      describe 'GET query' do

        it 'uses correct search strategy' 


        it 'finds person' 


        it 'finds groups' 


        it 'finds events' 


      end
    end

  end

end

