@type { Object.<string, import("knex").Knex.Config> }
  */
 module.exports = {
   development: {
     client: 'pg',
     connection: {
       host: 'localhost',
       port: 5432,
       user: 'acme',
       password: 'acme',
       database: 'acme',
     },
     migrations: {
       directory: './migrations',
     },
     seeds: {
       directory: './seeds',
     },
     useNullAsDefault: true,
   },
 
   // staging: {
   //   client: 'postgresql',
   //   connection: {
   //     database: 'my_db',
   //     user:     'username',
   //     password: 'password'
   //   },
   //   pool: {
   //     min: 2,
   //     max: 10
   //   },
   //   migrations: {
   //     tableName: 'knex_migrations'
   //   }
   // },
 
   // production: {
   //   client: 'postgresql',
   //   connection: {
   //     database: 'my_db',
   //     user:     'username',
   //     password: 'password'
   //   },
   //   pool: {
   //     min: 2,
   //     max: 10
   //   },
   //   migrations: {
   //     tableName: 'knex_migrations'
   //   }
   // }
 };