class AttendanceMailer < ApplicationMailer

default from: 'no-reply@monsite.fr'

def attendance_email(attendance)
	@attendance= attendance

	@url = 'http://monsite.fr/login'

	mail(to: @attendance.user.email, subject: 'confirmation inscription') 

end
end