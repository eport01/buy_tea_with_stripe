class PurchasesController < ApplicationController
  # before_action :set_tea
  def new
    @purchase = Purchase.new
    @tea = Tea.find_by(name: params[:name])
  end

  def create

    @purchase = Purchase.new(purchase_params)

    @tea = Tea.find(params[:purchase][:tea_id])

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to root_url, notice: "Tea was successfully purchased!"}
      else
        format.html { redirect_to new_purchase_path(params: {name: tea.name}), status: :unprocessable_entity}
      end
    end
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

  private
    def set_tea
      @tea = Tea.find(params[:id])
    end
    def purchase_params
      params.require(:purchase).permit(:status, :name, :email, :customer_paid, :tea_id )
    end
end