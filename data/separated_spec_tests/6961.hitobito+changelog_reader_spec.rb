# encoding: utf-8

#  Copyright (c) 2012-2016, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe ChangelogReader do

  subject { ChangelogReader.new }

  context 'parsing changelog lines' do
    let(:changelog_lines) do
      [
        'foo', # invalid line
        '## Version 1.1',
        'foo', # invalid line
        '* change',
        '* change two',
        '', # invalid line
        '## Version 1.X',
        '* far future change',
        '## Version 2.3',
        '* change',
        '## Version 1.1',
        '* another change',
      ].join("\n")
    end
    before do
      ChangelogReader.instance_variable_set(:@changelogs, [])
    end

    it 'creates hash with changelog entries' 

  end

  it 'parses header line' 


  it 'parses entry line' 


  it 'doesnt parse if invalide line' 


  it 'sorts changelogs by version' 


  it 'reads existing changelog file' 


  it 'does not read unexisting changelog file' 


  it 'sets changelog files path' 

end

