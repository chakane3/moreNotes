const carsRouter = require("express").Router()
const {
    getAllCars, 
    getSingleCar, 
    createCar, 
    deleteCar, 
    updateCar, 
    updateCarFeature

} = require("../../queries/cars/cars")

carsRouter.get("/", getAllCars)
carsRouter.get("/", getSingleCar)
carsRouter.post("/", createCar)
carsRouter.delete("/:id", deleteCar)
carsRouter.put("/:id", updateCar)
carsRouter.patch(":id", updateCarFeature)

module.exports = carsRouter
