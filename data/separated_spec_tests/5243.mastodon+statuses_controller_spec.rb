# frozen_string_literal: true

require 'rails_helper'

describe StatusesController do
  render_views

  describe '#show' do
    context 'account is suspended' do
      it 'returns gone' 

    end

    context 'status is not permitted' do
      it 'raises ActiveRecord::RecordNotFound' 

    end

    context 'status is a reblog' do
      it 'redirects to the original status' 

    end

    context 'account is not suspended and status is permitted' do
      it 'assigns @account' 


      it 'assigns @status' 


      it 'assigns @stream_entry' 


      it 'assigns @type' 


      it 'assigns @ancestors for ancestors of the status if it is a reply' 


      it 'assigns @ancestors for [] if it is not a reply' 


      it 'assigns @descendant_threads for a thread with several statuses' 


      it 'assigns @descendant_threads for several threads sharing the same descendant' 


      it 'assigns @max_descendant_thread_id for the last thread if it is hitting the status limit' 


      it 'assigns @descendant_threads for threads with :next_status key if they are hitting the depth limit' 


      it 'returns a success' 


      it 'renders stream_entries/show' 

    end
  end
end

