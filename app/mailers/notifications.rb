class Notifications < ActionMailer::Base
  def confirm_purchase(user, tour)
    @user = user
    @tour = tour
    mail :to=>user.email, :from=>'brian_yingling@yahoo.com', :subject=>'Purchase Confirmation at tourmii'
  end
end