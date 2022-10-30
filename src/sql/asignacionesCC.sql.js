/** 
*? SENTENCIAS SQL
*/
//
const table = 'asignacionesCC';
const pk = 'idAsig';
// 
const insertInto = 
`INSERT INTO ${table} (id_curso, id_docente, id_aula, id_horario)
VALUES ($1, $2, $3, $4) RETURNING *`; 
// 
const selectAll = 
`SELECT * FROM ${table}`;
// 
const selectWhereEstaActivo = 
`SELECT * FROM ${table} WHERE esta_activo = $1`;
//
const selectWhere = 
`SELECT * FROM ${table} WHERE ${pk} = $1`;
// 
const uptadeWhere = 
`UPDATE ${table}
SET id_curso = $1, id_docente = $2, id_aula = $3, id_horario = $4
WHERE ${pk} = $10 RETURNING *`;
// 
const deleteWhere = 
`DELETE FROM ${table} WHERE ${pk} = $1 RETURNING *`;

/** 
*? MENSAJES
*/
// Para cuando se intenta obtener, actualizar o eliminar una persona por @cui y éste no se encuentra en la DB
const msgNotFound = (operacion, propiedad, valor)=>{
    return `No fue posible ${operacion} los datos, ${propiedad} = ${valor} no existen en la DB`;
}

module.exports = {
    insertInto,
    selectAll,
    selectWhereEstaActivo,
    selectWhere,
    uptadeWhere,
    deleteWhere,
    msgNotFound
};