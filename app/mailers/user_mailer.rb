class UserMailer < ActionMailer::Base
  default from: "kouchchivorn5@yahoo.com"

  def commentposted_email(comment)
    @comment = comment
    mail(to: @comment.entry.user.email, subject: "Comment Posted on #{@comment.entry.title}")
  end
end
