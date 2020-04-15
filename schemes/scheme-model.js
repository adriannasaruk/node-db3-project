const knex = require('knex')
const knexfile = require("../knexfile.js")
const db = knex(knexfile.development)


module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}

function find(){
    return db("schemes")
}
function findById(id){
    return db("schemes").where({id}).first()
}
function findSteps(id){
    return db.select("steps.id", "schemes.scheme_name","steps.step_number", "steps.instructions",).from("schemes")
    .join("steps", "schemes.id", "steps.scheme_id")
    .where("schemes.id", id)
}
function add(schemeData) {
    return db("schemes").insert(schemeData) 
}

function update(id,changes) {
    return db("schemes").where({id}).update(changes).then(()=> {
        return findById(id)
    })
}
function remove(id){
    return db("schemes").where({id}).del()
}

