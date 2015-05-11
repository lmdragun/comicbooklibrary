# Preview all emails at http://localhost:3000/rails/mailers/user_mail
class UserMailPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mail/password_reset
  def password_reset
    UserMail.password_reset
  end

end
