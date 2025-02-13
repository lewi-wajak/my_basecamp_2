module ApplicationHelper
    def current_user_is_admin?
        current_user && current_user.has_role?(:admin)
    end
end
