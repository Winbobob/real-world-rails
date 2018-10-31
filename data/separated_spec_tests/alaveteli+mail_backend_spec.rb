# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '../../../../spec_helper')

describe MailHandler::Backends::MailBackend do
  include MailHandler
  include MailHandler::Backends::MailBackend

  describe :backend do

    it 'should return the name of the backend' 


  end

  describe :mail_from_raw_email do

    it 'returns a new mail instance of the email' 


  end

  describe :get_part_file_name do

    it 'returns the part file name' 


    it 'returns nil if there is no file name' 


    it 'turns an invalid UTF-8 name into a valid one' 


  end

  describe :get_part_body do

    it 'returns the body of a part' 


  end

  describe :get_subject do

    it 'returns nil for a nil subject' 


    it 'returns valid UTF-8 for a non UTF-8 subject' 


  end

  describe :first_from do

    it 'finds the first from field' 


  end

  describe :get_from_address do

    it 'finds the first address' 


  end

  describe :get_from_name do

    it 'finds the first from name' 


  end

  describe :get_all_addresses do

    it 'returns all addresses present in an email' 


  end

  describe :empty_return_path? do

    it 'is false if the return path is nil' 


    it 'is false if the return path has some data' 


    it 'is true if the return path is blank' 


  end

  describe :get_auto_submitted do

    it 'returns the auto-submitted attribute' 


    it 'returns nil if there is no auto-submitted attribute' 


  end

  describe :expand_and_normalize_parts do

    context 'when given a multipart message' do

      it 'should return a Mail::PartsList' 


    end

  end

  describe :address_from_name_and_email do

    it 'returns an address string' 


    it 'does not change the name passed to it' 


  end


end

