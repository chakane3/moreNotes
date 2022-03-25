const getStudents = "SELECT * FROM students"

// The $1 acts as a variable name where we can pass in different values
const getStudentById = "SELECT * FROM students WHERE id = $1"

// check if email exists -> s is an alias
const checkEmailExists = "SELECT s FROM students WHERE s.email = $1"

// query to add student
const addStudent = "INSERT INTO students (name, email, age, dob) VALUES ($1, $2, $3, $4)"

const deleteStudent = "DELETE FROM students WHERE id = $1"

const updateStudent = "UPDATE students SET name= $1 WHERE id = $2"

module.exports = {
    getStudents, 
    getStudentById,
    checkEmailExists,
    addStudent,
    deleteStudent,
    updateStudent,
}