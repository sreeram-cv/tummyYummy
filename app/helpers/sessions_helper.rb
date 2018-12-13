module SessionsHelper
    def sign_in(user,check)
        cookies.permanent[:check] = check
        remember_token = User.new_remember_token
        cookies.permanent[:remember_token] = remember_token
        user.update_attribute(:remember_token, User.digest(remember_token))
        self.current_user = user
    end

    def current_user=(user)
        @current_user = user
    end

    def current_user
        remember_token = User.digest(cookies[:remember_token])
        check = cookies[:check]
        curuser = ''; 
        if check == "user"
            curuser = User.find_by(remember_token: remember_token)
        else
            curuser = Agent.find_by(remember_token: remember_token)    
        end
        @current_user ||= curuser
    end

    def signed_in?
        !current_user.nil?
    end

    
      def current_user?(user)
        user == current_user
      end

    def sign_out
        current_user.update_attribute(:remember_token,
                                      User.digest(User.new_remember_token))
        cookies.delete(:remember_token)
        self.current_user = nil
      end

      def findAgent(id)
        agent = Agent.find_by(id: id).name
      end

      def findUser(id)
        agent = User.find_by(id: id).name
      end

      def findUserPhone(id)
        agent = User.find_by(id: id).phone
      end

      def findUserAddress(id)
        agent = User.find_by(id: id).address
      end
end
