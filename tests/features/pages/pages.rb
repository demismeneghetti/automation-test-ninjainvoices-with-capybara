

class HomePage < SitePrism::Page
    set_url '/'
    element :login, '#login'
end

class NavbarPage < SitePrism::Page
    element :user_menu, '#menu-item-dropdown'
    element :logout_link, 'a[href=\'/logout\']'
    element :customers_link, 'a[href=\'/customers\']'

    def logout
        self.user_menu.click
        self.logout_link.click
    end
end

class LoginPage < SitePrism::Page
    set_url '/login'
    element :user_name, '#email'
    element :password, 'input[placeholder=\'Informe sua senha\']'
    element :signin_button, '.login-button'
    element :message_warning, '.alert-warning'

    def with (user, password)
        self.user_name.set user
        self.password.set password
        self.signin_button.click
    end
end

class DashboardPage < SitePrism::Page
    element :message_welcome, '#page_title'
end

class CustomerPage < SitePrism::Page
    element :new_button, '#dataview-insert-button'
    element :name, 'input[name=name]'
    element :phone, 'input[name=phone]'
    element :email, 'input[name=email]'
    element :type_select, 'select[id=costumer]'
    element :notes, 'textarea[name=note]'
    element :save_button, '#form-submit-button'
    
    element :search_input, '#dataview-search-input'
    element :search_button, '#dataview-search-button'

    elements :view_content, 'table tbody tr'

    def search (value)
        self.search_input. set value
        self.search_button.click
    end

    def save (name, phone, email, type, notes)
        self.name.set name
        self.phone.set phone
        self.email.set email
        self.type_select.find('option', text: type).select_option
        sleep(2)
        self.notes.set notes
        self.save_button.click
    end
end