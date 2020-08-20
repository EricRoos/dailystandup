class ProductOrdersController < ApplicationController
  def new
  end

  def create
    customer_id = current_user.payment_profile.profile_id
    @product_order = build_product_order
    amount = @product_order.price_cents
    @product_order.save
    @intent = PaymentProcessor.new.create_payment_intent(customer_id, amount, {product_order_id: @product_order.id})
  end

  def confirmation
    product_order = ProductOrder.find(params[:id])
    @confirmed = product_order.confirm_order_payment(params[:payment_confirmation_id])
  end

  private

  def product_order_params
    params.require(:product_order)
      .permit(:product_id, :payment_method_id)
      .merge({payment_method_source: :stripe})
  end

  def build_product_order
    current_user.product_orders.build(product_order_params)
  end
end
