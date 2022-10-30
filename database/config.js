const { config } = require("dotenv");
config();

module.exports = {
    db: {
        user: process.env.DB_USER ||'ikzlfnfinavcat',
        password: process.env.DB_PASSWORD || 'e0ee8d511fa81b1e31c1825c43068e0de4b264816b557fc75848b8fe3a07493b',
        host: process.env.DB_HOST || 'ec2-3-220-207-90.compute-1.amazonaws.com',
        port: process.env.DB_PORT || 5432,
        database: process.env.DB_DATABASE || 'd45hd1v6900g43',
    
}
}

