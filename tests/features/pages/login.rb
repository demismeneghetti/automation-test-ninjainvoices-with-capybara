class LoginPage < SitePrism::Page
    set_url '/login'

    element :email, '#email'
    element :password, '#password'
    element :sign_in, '.login-button'
    element :alert, '.alert-warning'

    def with(user, password)
        self.email.set user
        self.password.set password
        self.sign_in.click
        sleep(1)
    end
end