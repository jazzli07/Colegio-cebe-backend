//ASIGNACIOONES DE LOS CURSOS A LOS CATEDRATICOS

const db = require("../../database/pool"); //credenciales bajo las cuales se realizan las operaciones crud
//sentencias sql en forma de strings para no hacer tediosa la lectura del codigo y (mensajes tambien se incluyen)
const {
    insertInto,
    selectAll,
    selectWhereEstaActivo,
    selectWhere,
    uptadeWhere,
    deleteWhere,
    msgNotFound
} = require("../sql/asignacionCC.sql");

const create = async (req, res, next) => {
    try {
        const { id_curso, id_docente, nombres, apellidos, id_aula,id_horario } = req.body;
        const nombreCompleto = `${nombres} ${apellidos}`;
        const result = await db.query(insertInto, [
            id_curso,
            id_docente,
            id_aula,
            id_horario
        ]);
        res.json(result.rows[0]);
    } catch (error) {
        next(error);
    }
};

const readAll = async (req, res, next) => {
    try {
        const allAsig = await db.query(selectAll);
        res.json(allAsig.rows);
    } catch (error) {
        next(error);
    }
};

const readActive = async (req, res, next) => {
    try {
        const asigActivos = await db.query(selectWhereEstaActivo, [true]);
        res.json(asigActivos.rows);
    } catch (error) {
        next(error);
    }
};

const readNoActive = async (req, res, next) => {
    try {
        const asigInativos = await db.query(selectWhereEstaActivo, [false]);
        res.json(asigInativos.rows);
    } catch (error) {
        next(error);
    }
};
//con correo
const readOne = async (req, res, next) => {
    try {
        const { idAsig } = req.params;
        const result = await db.query(selectWhere, [idAsig]);
        if (result.rows.length === 0) {
            return res.status(404).json({
                message: msgNotFound('obtener', 'id_curso', idAisg)
            });
        } //else
        res.json(result.rows[0]);
    } catch (error) {
        next(error);
    }
};

const updateOne = async (req, res, next) => {
    try {
        const { idAsig } = req.params;
        const { id_curso, id_docente, id_aula, id_horario } = req.body;
        const result = await db.query(uptadeWhere, [
            id_curso,
            id_docente,
            id_aula,
            id_horario,
        ]);
        if (result.rows.length === 0) {
            return res.status(404).json({
                message: msgNotFound('actualizar', 'idAisg', idAsig)
            });
        } //else
        return res.json(result.rows[0]);
    } catch (error) {
        next(error);
    }
};

const deleteOne = async (req, res, next) => {
    try {
        const { idAsig } = req.params;
        const result = await db.query(deleteWhere, [idAsig]);
        if (result.rowCount === 0) {
            return res.status(404).json({
                message: msgNotFound('eliminar', 'idAsig', idAsig)
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
    readActive,
    readNoActive,
    readOne,
    updateOne,
    deleteOne
};