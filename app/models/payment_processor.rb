class PaymentProcessor
	def create_customer(name)
    customer = Stripe::Customer.create(name: name)
    { customer_source: :stripe, customer_id: customer['id'] }
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
			customer: customerId,
			payment_method: payment_method_id,
			off_session: true,
			confirm: true
		)
	end
end
