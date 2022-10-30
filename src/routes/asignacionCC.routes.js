//Controlador con los metodos HTTP
const asginacionCC = require("../controllers/asignacionCC.controller");
//Objeto para definir rutas
const router = require("express").Router();
// End point
const ep = '/asignacionCC';
//
router.post(`${ep}`, asginacionCC.create);
//
router.get(`${ep}`, asginacionCC.readAll);
//
router.get(`${ep}/activos`, asginacionCC.readActive);
//
router.get(`${ep}/inactivos`, asginacionCC.readNoActive);
//
router.get(`${ep}/:idAsig`, asginacionCC.readOne);
//Actualizar !!!
router.put(`${ep}/:idAsig`, asginacionCC.updateOne);
//Eliminar !!!
router.delete(`${ep}/:idAsig`, asginacionCC.deleteOne);
//Define el endpoint y sus rutas

module.exports = router;