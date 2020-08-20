class PaymentProcessor
	def create_customer(name)
    customer = Stripe::Customer.create(name: name)
    { customer_source: :stripe, customer_id: customer['id'] }
	end

  def list_available_cards(customer_id)
    Stripe::PaymentMethod.list({
      customer: "#{customer_id}",
      type: 'card'
    }).data.map { |c| c.to_h.slice(:id).merge(c["card"].to_h.slice(:exp_month, :exp_year, :last4)) }
  end

	def create_payment_intent(customer_id, amount, metadata= {})
    Stripe::PaymentIntent.create({
      customer: customer_id,
      amount: amount,
      currency: 'usd',
      metadata: metadata.merge({application_source: 'dailystandup.io'})
    })
	end

  def fetch_payment(payment_id)
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    {
      succeeded: payment.status == "succeeded",
      status: payment.status,
      meta: payment.metadata.to_h.slice(:product_order_id)
    }
  end
end
