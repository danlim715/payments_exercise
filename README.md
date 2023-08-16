# Payments Exercise

Add in the ability to create payments for a given loan using a JSON API call. You should store the payment date and amount. Expose the outstanding balance for a given loan in the JSON vended for `LoansController#show` and `LoansController#index`. The outstanding balance should be calculated as the `funded_amount` minus all of the payment amounts.

A payment should not be able to be created that exceeds the outstanding balance of a loan. You should return validation errors if a payment can not be created. Expose endpoints for seeing all payments for a given loan as well as seeing an individual payment.

# Notes
I added a couple gems to my solution:
- `mimemagic` was added due to a gem dependency error I was seeing when I first pulled down the code base.
- `active_model_serializers` was a tool I've used in the past to formulate serializers, and I have a bit more familiarity with it. However, I do have some experience using jbuilder as well.
- `shoulda-matchers` is a handy tool for rspecs, and provides some nice shorthand for testing validations.

As this is an API solution, no front-end was implemented. All my regression testing was done using Postman for mocking requests, and rails console for creating new DB entries.