VGS.subscribe 'customer.subscription.deleted' do |event|
  sale = Sale.find_by(vgs_id: event.data.object.id)
  user = User.find_by(email: sale.email)
  UserMailer.expire_email(user).deliver
  user.destroy
end
