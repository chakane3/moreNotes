const pgp = require("pg-promise")({})
const db = pgp("postgress://localhost:5432/cars")
module.exports = db