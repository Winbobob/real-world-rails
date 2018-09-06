#-- copyright
# OpenProject is a project management system.
#
# Copyright (C) 2012-2013 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# See doc/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

describe RedCloth3 do
  describe '#to_html', 'with one full heading tree starting at h1' do
    before(:each) do
      @text = <<-RAW

      h1#. Title

      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas sed libero.

      h2#. Subtitle

      Nullam commodo metus accumsan nulla. Curabitur lobortis dui id dolor.

      h2#. Subtitle

      h3#. Subsubtitle

      h2#. Subtitle

      h1#. Another title

      h2#. Subtitle

      h2#. Subtitle

      RAW
    end

    it 'should numerate as specified' 

  end

  describe '#to_html', 'with one heading tree starting at h2' do
    before(:each) do
      @text = <<-RAW

      h1. Title

      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas sed libero.

      h2#. Subtitle

      Nullam commodo metus accumsan nulla. Curabitur lobortis dui id dolor.

      h2#. Subtitle

      h3#. Subsubtitle

      h2#. Subtitle

      h1. Another title

      h2. Subtitle

      h2. Subtitle

      RAW
    end

    it 'should numerate as specified' 

  end

  describe '#to_html', 'with two heading trees starting at h2' do
    before(:each) do
      @text = <<-RAW

        h1. Title

        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas sed libero.

        h2#. Subtitle

        Nullam commodo metus accumsan nulla. Curabitur lobortis dui id dolor.

        h2#. Subtitle

        h3#. Subsubtitle

        h2#. Subtitle

        h1. Another title

        h2#. Subtitle

        h2#. Subtitle

        RAW
    end

    it 'should numerate as specified' 

  end

  describe '#to_html', 'with one heading tree starting at h2 and right after it one starting at h1' do
    before(:each) do
      @text = <<-RAW

          h1. Title

          Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas sed libero.

          h2#. Subtitle

          Nullam commodo metus accumsan nulla. Curabitur lobortis dui id dolor.

          h2#. Subtitle

          h3#. Subsubtitle

          h2#. Subtitle

          h1#. Another title

          h2#. Subtitle

          h2#. Subtitle

          RAW
    end

    it 'should numerate as specified' 

  end
end

