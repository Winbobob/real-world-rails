# frozen_string_literal: true

class TrackingController < ApplicationController
  # We need this controller to be accessible by anyone without authentication
  skip_before_action :authenticate_admin!
  # SSL redirection is also disabled for this controller. See
  # ApplicationController force_ssl.

  def open
    unless HashId.valid?(params[:delivery_id], params[:hash])
      raise ActiveRecord::RecordNotFound
    end

    delivery = Delivery.find(params[:delivery_id])
    unless Rails.configuration.cuttlefish_read_only_mode
      delivery.add_open_event(request)
    end
    # TODO: Check that we are asking for a gif and only accept those for
    # the time being
    # This sends a 1x1 transparent gif
    send_data(
      Base64.decode64(
        "R0lGODlhAQABAPAAAAAAAAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
      ),
      type: "image/gif",
      disposition: "inline"
    )
  end

  def click
    if HashId.valid?(
      "#{params[:delivery_link_id]}-#{params[:url]}",
      params[:hash]
    )
      delivery_link = DeliveryLink.find_by_id(params[:delivery_link_id])
      # If there is no delivery_link this is probably an old email
      # which has been archived and the delivery_link record doesn't exist
      # anymore.
      if delivery_link && !Rails.configuration.cuttlefish_read_only_mode
        delivery_link.add_click_event(request)
      end
      redirect_to params[:url]
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
