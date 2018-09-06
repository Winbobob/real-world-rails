# -*- encoding : utf-8 -*-
spec_helper = File.join('..', '..', '..', '..', 'spec_helper')
require File.expand_path(spec_helper, __FILE__)

describe 'alaveteli_pro/subscriptions/_cancel_subscription' do

  def render_view
    render partial: 'alaveteli_pro/subscriptions/cancel_subscription',
           locals: { subscription: subscription }
  end

  context 'with an active subscription' do

    let(:subscription) do
      double(id: 'sub_BWb9jBSSO0nafs',
             cancel_at_period_end: false,
             current_period_end: 1509882971)
    end

    it 'sets the section heading' 


    it 'adds an .active class to the .cancel-subscription__message div' 


    it 'displays the what happens if you cancel' 


    it 'displays a link to allow the user to cancel' 


  end

  context 'with a cancelled subscription' do

    let(:subscription) do
      double(id: 'sub_BWb9jBSSO0nafs',
             cancel_at_period_end: true,
             current_period_end: 1509882971)
    end

    it 'sets the section heading' 


    it 'adds a .cancelled class to the .cancel-subscription__message div' 


    it 'displays what will happen at the end of the billing period' 


    it 'does not show a cancellation link' 


  end

end

