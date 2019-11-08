const knex = require('knex');
const config = require('../knexfile.js');
const db = knex(config.development);

module.exports = {
  find,
  findById,
  findSteps,
  add,
  remove,
  update,
};

function find() {

  let rows = db('schemes');
  return rows;
}

function findSteps(id) {
  return db('steps')
    .join('schemes', 'steps.scheme_id', 'scheme.id')
    .select('steps.id, schemes.scheme_name, steps.step_number, steps.instructions')
}

function findById(id) {
  return db('schemes')
    .where({ id })
    .first();
}


async function add(scheme) {
  const [id] = await db('scheme').insert(scheme);

  return findById(id);
}

function remove(id) {
  return db('schemes')
    .where({ id })
    .del();
}

function update(changes, id) {
  return db('schemes')
    .where({ id })
    .update(changes, '*');
}
