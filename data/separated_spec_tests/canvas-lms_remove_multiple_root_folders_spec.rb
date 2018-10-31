#
# Copyright (C) 2013 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')
require 'db/migrate/20130122193536_remove_multiple_root_folders'


describe 'DataFixup::RemoveMultipleRootFolders' do

  def get_root_folder_name(context)
    if context.is_a? Course
      root_folder_name = Folder::ROOT_FOLDER_NAME
    elsif context.is_a? User
      root_folder_name = Folder::MY_FILES_FOLDER_NAME
    else
      root_folder_name = "files"
    end
    root_folder_name
  end

  before :each do
    RemoveMultipleRootFolders.down

    @contexts = []

    12.times do |x|
      case x % 4
        when 0
          context = course_factory
        when 1
          context = user_factory
        when 2
          context = group
        when 3
          context = Account.create!
      end
      @contexts << context
    end
  end

  after :each do
    @contexts.each do |c|
      c.folders.each do |f|
        f.attachments.delete_all
      end
      # mysql enforces foreign keys inside of a single delete all, so do it one by one
      subfolders = folders = Folder.root_folders(c).to_a
      while !subfolders.empty?
        subfolders = subfolders.map(&:sub_folders).flatten
        folders.concat(subfolders)
      end
      folders.reverse_each { |f| Folder.where(id: f).delete_all }
      c.enrollment_terms.scope.delete_all if c.is_a?(Account)
      c.course_account_associations.scope.delete_all if c.is_a?(Course)
      c.authentication_providers.scope.delete_all if c.is_a?(Account)
      c.delete
    end
    RemoveMultipleRootFolders.up
  end

  it "should remove extra root folders if they are empty" 


  it "should move extra root folders to one root folder if they are not empty (either a sub-folder or attachment)" 


  it "should move extra root folders to the root folder with the most content" 


  it "should create a new root folder with the proper name if it doesn't exist already" 

end

