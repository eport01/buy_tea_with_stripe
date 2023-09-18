class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
    @tea = Tea.find_by(name: params[:name])
  end

  def intent
    @tea = Tea.find(params[:_json])
    amount = @tea.price * 100

    payment_intent= Stripe::PaymentIntent.create(
      amount: amount, 
      currency: 'usd', 
      automatic_payment_methods: {
        enabled: true
      },
      metadata: {
        tea_id: @tea.id
      }
    )

    respond_to do |format|
      format.json { render json: { clientSecret: payment_intent['client_secret']}}
    end
  end
end