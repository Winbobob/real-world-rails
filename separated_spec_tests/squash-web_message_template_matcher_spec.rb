# Copyright 2014 Square Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

require 'rails_helper'

RSpec.describe MessageTemplateMatcher do
  before :all do
    @mysql_error = <<-ERR.strip
      Duplicate entry 'foo@example.com' for key 'index_users_on_email': UPDATE `users` SET `name` = 'Sancho Sample', `crypted_password` = '349857346384697346', `updated_at` = '2012-09-23 21:18:37', `email` = 'foo@example.com' WHERE `id` = 123456 -- app/controllers/api/v1/user_controller.rb:35
    ERR
    @pg_error = <<-ERR.strip
relation "users" does not exist
  Position: 312:             SELECT a.attname as column_name, format_type(a.atttypid, a.atttypmod) as column_type, d.adsrc as column_default, a.attnotnull as column_not_null
              FROM pg_attribute a LEFT JOIN pg_attrdef d
                ON a.attrelid = d.adrelid AND a.attnum = d.adnum
             WHERE a.attrelid = '"users"'::regclass
               AND a.attnum > 0 AND NOT a.attisdropped
             ORDER BY a.attnum
    ERR
  end

  describe "#matched_substring" do
    it "should remove the query from an error message" 


    it "should return the original message if no match was found" 


    it "should use references to other error types" 

  end

  describe "#sanitized_message" do
    it "should filter the error message" 


    it "should return nil if no match was found" 


    it "should use references to other error types" 

  end
end

