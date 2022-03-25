//  import our db
const { response } = require("express");
const pool = require("/Users/chakaneshegog/Documents/GitHub/moreNotes/API/persistence/db.js")
// import queries file
const queries = require("./queries")

// Setting up functions for our endpoints
// Here we want to send our students to the client  by querying our database
const getStudents = (req, res) => {
    pool.query(queries.getStudents, (error, results) => {
        //  check for errors
        if (error) throw error;
        res.status(200).json(results.rows)
    })
}

// function to get student by ID
const getStudentsById = (req, res) => {
    const id = parseInt(req.params.id)
    pool.query(queries.getStudentById, [id], (error, results) => {
        if (error) throw error
        res.status(200).json(results.rows)
    })
}

// function to allow client to add to the DB
const addStudent = (req, res) => {
    const {name, email, age, dob} = req.body

    // check if the student already exists
    pool.query(queries.checkEmailExists, [email], (error, results) => {
        if (results === undefined) {
            res.send("Email already exists")
            return
        }

        pool.query(queries.addStudent, [name, email, age, dob], (error, results) => {
            if (error) throw error
            res.status(201).send("Success!")
            console.log("Student created")     
        })
    })
}

const deleteStudent = (req, res) => {
    const id = parseInt(req.params.id)

    pool.query(queries.deleteStudent, [id], (error, results) => {
        const noStudentFound = !results.rows.length
        if(noStudentFound) {
            res.send("Student does not exist")
            return
        }

        pool.query(queries.deleteStudent, [id], (error, results) => {
            if (error) throw error
            res.status(200).send("Student was removed")
            console.log("Student was removed") 
        })
    })
}

const updateStudent = (req, res) => {
    const id = parseInt(req.params.id)
    const {name} = req.body
    pool.query(queries.getStudentById, [id], (error, results) => {
        const noStudentFound = !results.rows.length
        if (noStudentFound) {
            res.send("Student does not exist")
            return
        }
        pool.query(queries.updateStudent, [name, id], (error, results) => {
            if (error) throw error
            res.status(200).send("Student updated")
        })
    })
}

const addScholarship = (req, res) => {
    const {name, description, deadline, link, amount} = req.body
    pool.query(queries.insertScholarship, [name, description, deadline, link, amount], (error, results) => {
        if (error) throw error
            res.status(201).send("Success!")
            console.log("Scholarship created")
    })
}

module.exports = {
    getStudents, 
    getStudentsById,
    addStudent,
    deleteStudent,
    updateStudent,
    addScholarship,
}