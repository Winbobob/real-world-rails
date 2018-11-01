# encoding: utf-8

#  Copyright (c) 2012-2018, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe DownloadCleanerJob do

  subject { DownloadCleanerJob.new }

  it 'removes files and gets rescheduled' 


  it 'removes files older then one day' 


  private

  def generate_test_file(filename)
    AsyncDownloadFile.new(filename).write('testfile')
  end

  def download_filename(filename, time)
    "#{filename}_#{time}-1234"
  end

end

