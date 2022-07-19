class Student extends User {
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

    check_is_student() {
        if (is_student == false) throw "This user must be a student!!"
    }
}