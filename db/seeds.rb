loan = Loan.create!(funded_amount: 100.0)
loan.payments.create!(payment_amount: 10.0, payment_date: Date.today)