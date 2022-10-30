//
const horarios = require("../controllers/horarios.controller");
//
const router = require("express").Router();
// End Point
const ep = '/horarios';
const pk = 'id_horario'
//C
router.post(`${ep}`, horarios.create);
//R
router.get(`${ep}`, horarios.readAll);
//
router.get(`${ep}/:${pk}`, horarios.readOne);
//U
router.put(`${ep}/:${pk}`, horarios.updateOne);
//D
router.delete(`${ep}/:${pk}`, horarios.deleteOne);

module.exports = router;