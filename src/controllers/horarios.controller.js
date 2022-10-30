const db = require("../../database/pool"); //credenciales bajo las cuales se realizan las operaciones crud
//sentencias sql en forma de strings para no hacer tediosa la lectura del codigo y (mensajes tambien se incluyen)
const {
    insertInto,
    selectAll,
    selectWhere,
    updateWhere,
    deleteWhere,
    msgNotFound
} = require("../sql/horarios.sql"); //change this for each controller

const create = async (req, res, next) => {
    try {
        const { nombre, descripcion } = req.body;
        const result = await db.query(insertInto, [nombre, descripcion]);
        res.json(result.rows[0]);
    } catch (error) {
        next(error);
    }
};

const readAll = async (req, res, next) => {
    try {
        const allHorarios = await db.query(selectAll);
        res.json(allHorarios.rows);
    } catch (error) {
        next(error);
    }
};

const readOne = async (req, res, next) => {
    try {
        const { idHorario } = req.params;
        const result = await db.query(selectWhere, [idHorario]);
        if (result.rows.length === 0) {
            return res.status(404).json({
                message: msgNotFound('obtener', 'id_horario', idHorario)
            });
        }//else
        res.json(result.rows[0]);
    } catch (error) {
        next(error);
    }
};

const updateOne = async (req, res, next) => {
    try {
        const { idHorario } = req.params;
        const { inicio_fin, descripcion } = req.body;
        const result = await db.query(updateWhere, [ inicio_fin, idHorario ]);
        if (result.rows.length === 0) {
            return res.status(404).json({
                message: msgNotFound('actualizar', 'id_horario', idHorario)
            });
        } //else
        return res.json(result.rows[0]);
    } catch (error) {
        next(error);
    }
};

const deleteOne = async (req, res, next) => {
    try {
        const { idHorario } = req.params;
        const result = await db.query(deleteWhere, [idHorario]);
        if (result.rowCount === 0) {
            return res.status(404).json({
                message: msgNotFound('eliminar', 'id_horario', idHorario)
            });
        }//else
        return res.sendStatus(204);
    } catch (error) {
        next(error);
    }
};

module.exports = {
    create,
    readAll,
    readOne,
    updateOne,
    deleteOne
};