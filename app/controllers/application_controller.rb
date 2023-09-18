class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_stripe_key


  private

    def set_stripe_key
      Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
    end
end
