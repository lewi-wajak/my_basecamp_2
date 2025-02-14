class MakeUserAdmin < ActiveRecord::Migration[8.0]
  def up
    user = User.find_by(email: "lewiwajak@gmail.com")
    if user
      user.add_role(:admin)
      puts "User #{user.email} is now an admin."
    else
      puts "User not found!"
    end
  end
end
