class ElectoratesController < ApplicationController
  def show_redirect
    redirect_to params.to_unsafe_hash.merge(only_path: true, display: nil, dmp: nil, house: (params[:house] || "representatives"))
  end

  def show
    electorate = params[:mpc].gsub("_", " ") if params[:mpc]
    house = params[:house]

    @members = Member.where(constituency: electorate).order(entered_house: :desc)
    @members = @members.in_house(house) if house
    @member = @members.first
    raise ActiveRecord::RecordNotFound if @member.nil?
  end
end
