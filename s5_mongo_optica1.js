const Clients = new Schema({
    id: ObjectId,
    nom: String,
    email: String,
    data_registre: Date,
    adreça: {
        carrer: String,
        cp: Number,
        municipi: String
    },
    telefon: String,
    referent: String,
    comandes: {
        ref_comanda: ObjectId
    }
});

const proveidors = new Schema({
    id: ObjectId,
    nom: String,
    nif: String,
    telefon: String,
    fax: String,
    adreça:{
        carrer: String,
        cp: String,
        municipi: String
    }
});

const producte = new Schema({
    id: ObjectId,
    proveidor: String,
    marca: String,
    montura: String,
    color_montura: String,
    vidres: {
        d: Number,
        e: Number,
        d_c: String,
        e_c: String
    }
});

const vendes = new Schema({
    id: ObjectId,
    venut_per: String,
    import: Number,
    client: ObjectId,
    data_venda: Date
});
