const { Router } = require('express')
const router = Router()
const controller = require("./controller")

router.get('/', controller.getStudents)

// :id allows us to pass in different values in our endpoint
router.get('/:id', controller.getStudentsById)

// allows client to add to the databse
router.post('/', controller.addStudent)

// allows client to delete from the database
router.delete('/:id', controller.deleteStudent)

module.exports = router