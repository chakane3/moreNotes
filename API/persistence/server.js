const express = require('express')
const studentRoutes = require('./src/student/routes')
const app = express()
const port = 8080

//  add middleware - allows us to post and get json from out endpoints
app.use( express.json() )

app.get('/', (req, res) => {
    res.send("Hello, World!")
})

app.use('/api/v1/students', studentRoutes)

app.listen(port, () => console.log(`head to http://localhost:${port}`))