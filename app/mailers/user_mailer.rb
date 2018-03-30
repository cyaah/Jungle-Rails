class UserMailer < ApplicationMailer
	 default from: 'no-reply@jungle.com'
 
  def order_email(order)
  	#person sending the order
    @order = order.user
    #the url from where we will be sending our orders
    @url  = 'http://localhost:3000/'
    mail(to: order.email, subject: 'Jungle-order: #{@order.id}')
  end
end
