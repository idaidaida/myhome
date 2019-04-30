module LoginsHelper

    def set_login_session(account_id)
        session[:LOGIN_SESSION] = account_id
    end

    def delete_login_session
        session.delete(:LOGIN_SESSION)
    end

    def login?
        !session[:LOGIN_SESSION].nil?
    end

    def login_account_id
        session[:LOGIN_SESSION]
    end

    def login_account_obj
        Account.find_by(id:session[:LOGIN_SESSION])
    end

end
