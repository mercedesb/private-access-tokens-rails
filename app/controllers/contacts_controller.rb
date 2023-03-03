class ContactsController < ApplicationController
  include PrivacyPassSupportable

  before_action :present_privacy_pass_challenge, unless: :redeemed_privacy_pass_token?, only: :index

  def index; end

  def show
    @name = session[:redeemed_privacy_pass] if session[:redeemed_privacy_pass]
    session.delete(:redeemed_privacy_pass)
  end

  def create
    session[:redeemed_privacy_pass] = params[:name] if session[:redeemed_privacy_pass]
    redirect_to contact_path
  end

  private

  def present_privacy_pass_challenge
    setup_privacy_pass_challenge
    render template: 'contacts/index', status: :unauthorized
  end
end
