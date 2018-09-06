#
# Copyright (C) 2015 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')

describe SIS::CSV::DiffGenerator do
  before :once do
    account_model
    @batch = @account.sis_batches.create
  end

  subject { described_class.new(@account, @batch) }

  def csv(name, data)
    @files ||= []
    tf = Tempfile.new("spec")
    @files << tf
    tf.write(data)
    tf.flush
    { file: "#{name}.csv", fullpath: tf.path }
  end

  describe '#generate_csvs' do
    it 'should skip diffing if previous is empty' 


    it 'should skip diffing if previous has more than one file of type' 


    it 'should skip diffing if current has more than one file of type' 


    it 'should generate multiple diffs for different file types' 

  end
end


