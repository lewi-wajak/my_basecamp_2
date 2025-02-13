admin_role = Role.find_or_create_by(name: 'admin')


user = User.find_by(email: 'lewiwajak@gmail.com')
if user
  user.add_role(:admin) unless user.has_role?(:admin)
  puts "Admin role assigned to #{user.email}"
else
  puts "User not found! Make sure the user exists before running this."
endcd cd