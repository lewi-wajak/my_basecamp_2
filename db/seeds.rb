admin_email = "sandra@gmail.com"
admin_password = "123456"  

User.find_by(email: admin_email)&.destroy

user = User.create!(
  email: admin_email,
  password: admin_password,
  password_confirmation: admin_password
)


user.add_role(:admin)
puts "✅ New admin user created: #{user.email}"