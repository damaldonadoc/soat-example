class ApplicationMailer < ActionMailer::Base
  default from: 'damaldonadoc@protonmail.com'
  layout 'mailer'

  def soat(insurance_id)
    @insurance = Insurance.find(insurance_id)
    mail(to: @insurance.payment_transaction.user.email,
         subject: 'Detalles seguro SOAT')
  end
end
