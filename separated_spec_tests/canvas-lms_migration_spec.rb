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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe "Migration package importers" do

  context "Detecting content package type" do

    def get_settings(name)
      if !name.ends_with?('xml')
        name += '.zip'
      end
      path = File.dirname(__FILE__) + "/../../fixtures/migration/package_identifier/#{name}"
      {:export_archive_path=>path}
    end

    supported = {
            "Old Canvas Cartridge" => ['old_canvas', CC::Importer::Canvas::Converter],
            "Canvas Cartridge" => ['canvas', CC::Importer::Canvas::Converter],
            "Common Cartridge 1.0" => ["cc1-0", CC::Importer::Standard::Converter],
            "Common Cartridge 1.1" => ["cc1-1", CC::Importer::Standard::Converter],
            "Common Cartridge 1.2" => ["cc1-2", CC::Importer::Standard::Converter],
            "Common Cartridge 1.3" => ["cc1-3", CC::Importer::Standard::Converter],
            "Common Cartridge 1.3 - flat" => ["cc1-3flat.xml", CC::Importer::Standard::Converter],
            "Common Cartridge 1.3 - thin" => ["cc1-3thin.xml", CC::Importer::Standard::Converter],
            "QTI packages" => ['qti', Qti::Converter],
            "WebCT exports (as qti packages)" => ['webct', Qti::Converter],
    }

    unsupported = {
            "Blackboard packages" => ['bb_learn', :bb_learn],
            "Angel 7.3 packages" => ["angel7-3", :angel_7_3],
            "Angel 7.4 packages" => ["angel7-4", :angel_7_4],
            "D2L packages" => ['d2l', :d2l],
            "Generic IMS Content Package" => ['ims_cp', :unknown_ims_cp_package],
            "Moodle 1.9 Package" => ["moodle1-9", :moodle_1_9],
            "Moodle 2 Package" => ["moodle2", :moodle_2],
            "SCORM 1.1 Package" => ["scorm1-1", :scorm_1_1],
            "SCORM 1.2 Package" => ["scorm1-2", :scorm_1_2],
            "SCORM 1.3 Package" => ["scorm1-3", :scorm_1_3],
            "Unknown zip Package" => ["unknown", :unknown],
            "WebCT 4.1 Package" => ["webct4-1", :webct_4_1],
    }

    supported.each_pair do |key, val|
      it "should find converter for #{key}" 

    end

    unsupported.each_pair do |key, val|
      it "should correctly identify package type for #{key}" 

    end

    it "should raise a traceable error for invalid packages" 

  end

  context "migrator" do
    it "should deal with backslashes path separators in migrations" 


    it "creates overview assignments for graded discussion topics and quizzes and pages" 

  end

end

