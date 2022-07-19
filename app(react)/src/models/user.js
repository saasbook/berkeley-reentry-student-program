class User extends Application {
    constructor(...args) {
        super(...args);
    }
    find_by_id(id) {
        return this.find_by({id: id});
    }
    find_by_name(name) {
        return this.find_by({name: name});
    }
    find_by_email(email) {
        return this.find_by({email: email});
    }
    find_by_password(password) {
        return this.find_by({password: password});
    }
    find_by_is_admin(is_admin) {
        return this.find_by({is_admin: is_admin});
    }
    
    find_by_is_staff(is_staff) {
        return this.find_by({is_staff: is_staff});
    }
    find_by_is_student(is_student) {
        return this.find_by({is_student: is_student});
    }

    from_omniauth = function(auth) {
        // Creates a new user only if it doesn't exist
        where({email: auth.info.email}).first_or_initialize(function(user) {
          user.first_name = auth.info.first_name;
          user.last_name = auth.info.last_name;
          user.email = auth.info.email
        })
      };
      
    name() {
        first_name + " " + last_name
      }
}