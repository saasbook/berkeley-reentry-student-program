class Appointment extends Application {
    constructor(...args) {
        super(...args);
    }
    static find_by_id(id) {
        return this.find_by({id: id});
    }
    static find_by_name(name) {
        return this.find_by({name: name});
    }
    static find_by_email(email) {
        return this.find_by({email: email});
    }
    static find_by_password(password) {
        return this.find_by({password: password});
    }
    static find_by_is_admin(is_admin) {
        return this.find_by({is_admin: is_admin});
    }
    static find_by_is_staff(is_staff) 
    from_omniauth = function(auth) {
        // Creates a new user only if it doesn't exist
        where({email: auth.info.email}).first_or_initialize(function(user) {
          user.first_name = auth.info.first_name;
          user.last_name = auth.info.last_name;
          user.email = auth.info.email
        })
      }


}