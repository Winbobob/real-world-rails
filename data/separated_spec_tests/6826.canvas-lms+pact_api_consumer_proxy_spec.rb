#
# Copyright (C) 2011 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#
require_relative '../spec_helper'
require_relative '../contracts/service_consumers/api/proxy_app'

describe PactApiConsumerProxy do

  context 'Authorization header' do

    subject(:proxy) { PactApiConsumerProxy.new }

    before :each do
      # This happens when our Pact tests run -- we need to make it happen
      # here, too.
      ActiveRecord::Base.connection.tables.each do |t|
        ActiveRecord::Base.connection.reset_pk_sequence!(t)
      end

      @student1 = User.create!(name: 'Student1')
      @student2 = User.create!(name: 'Student2')

      student1_token = double(full_token: '1_TOKEN')
      student1_tokens = double(create!: student1_token)
      allow_any_instantiation_of(@student1).to receive(:access_tokens).and_return(student1_tokens)

      student2_token = double(full_token: '2_TOKEN')
      student2_tokens = double(create!: student2_token)
      allow_any_instantiation_of(@student2).to receive(:access_tokens).and_return(student2_tokens)
    end

    it 'sets header for the specified user' 


    it 'sets header for the first user if one is not specified' 


    it 'does not add Authorization header if it is not sent to proxy' 


    it 'removes the HTTP_AUTH_USER header' 


    it 'throws an error if the specified user does not exist' 


    it 'creates a pseudonym for the requested user' 

  end
end

