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

	def charge_customer(customer_id, payment_method_id, amount)
		payment_methods = Stripe::PaymentMethod.list(
			customer: customerId,
			type: 'card'
		)

		# Charge the customer and payment method immediately
		Stripe::PaymentIntent.create(
			amount: amount,
			currency: 'usd',
			customer: customer_id,
			payment_method: payment_method_id,
			off_session: true,
			confirm: true
		)
	end
end
