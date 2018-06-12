module ControllerMacros
  def login_user(user=nil)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user ||= FactoryGirl.create(:user)
    sign_in user
  end

  def login_admin(admin=nil)
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    admin ||= FactoryGirl.create(:admin)
    sign_in admin
  end
end