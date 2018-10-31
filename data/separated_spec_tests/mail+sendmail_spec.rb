# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Mail::Sendmail do
  let :mail do
    Mail.new do
      from    'roger@test.lindsaar.net'
      to      'marcel@test.lindsaar.net, bob@test.lindsaar.net'
      subject 'some subject'
    end
  end

  before do
    Mail.defaults do
      delivery_method :sendmail
    end
  end

  it 'sends an email using sendmail' 


  it 'spawns a sendmail process' 


  context 'SMTP From' do
    it 'explicitly passes an envelope From address to sendmail' 


    it 'escapes the From address' 


    it 'does not escape ~ in From address' 

  end

  context 'SMTP To' do
    it 'explicitly passes envelope To addresses to sendmail' 


    it 'escapes the To address' 


    it 'does not escape ~ in To address' 


    it 'quotes the destinations to ensure leading -hyphen doesn\'t confuse sendmail' 

  end

  it 'still sends an email if the arguments setting have been set to nil' 


  it 'escapes evil haxxor attempts' 


  it 'raises on nonzero exitstatus' 


  it 'raises an error if no sender is defined' 


  it 'raises an error if no recipient is defined' 

end

