const { config } = require("dotenv");
config();

module.exports = {
    db: {
        user: 'ikzlfnfinavcat',
        password: 'e0ee8d511fa81b1e31c1825c43068e0de4b264816b557fc75848b8fe3a07493b',
        host: 'ec2-3-220-207-90.compute-1.amazonaws.com',
        port: 5432,
        database: 'd45hd1v6900g43',
        dialectOptions: {
            ssl: {
              require: true,
              rejectUnauthorized: false // <<<<<<< YOU NEED THIS
            }
    }
}
}

