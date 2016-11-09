class EmailapiController < ApplicationController
  before_action :subscribe_params, only: :subscribe
  def index
  end

  def subscribe
    list_id = ENV["mailchimp_list_id"]
    gb = Gibbon::Request.new

    begin
      gb.lists(list_id).members.create(
        body: { 
                email_address: "#{subscribe_params['email_address']}", 
                status: "subscribed", 
                merge_fields: { 
                                FNAME: "#{subscribe_params['first_name']}", 
                                LNAME: "#{subscribe_params['last_name']}"
                              }
              }
      )
    rescue Gibbon::MailChimpError => e
      flash[:error] = e.detail
    end

    flash[:error] ? (redirect_to subscribe_path) : (redirect_to root_path)
  end

private
  def subscribe_params
    params.permit(:email_address, :first_name, :last_name)
  end
end
