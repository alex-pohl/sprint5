/* global use, db */
// MongoDB Playground
// To disable this template go to Settings | MongoDB | Use Default Template For Playground.
// Make sure you are connected to enable completions and to be able to run a playground.
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.
// The result of the last command run in a playground is shown on the results panel.
// By default the first 20 documents will be returned with a cursor.
// Use 'console.log()' to print to the debug output.
// For more documentation on playgrounds please refer to
// https://www.mongodb.com/docs/mongodb-vscode/playgrounds/

// Select the database to use.
use('restaurants');

// let query1 = db.restaurants.find()
// let query2 = db.restaurants.find({},{_id: 1, name: 1, borough: 1, cuisine: 1})
// let query3 = db.restaurants.find({},{_id: 0, name: 1, borough: 1, cuisine: 1})
// let query4 = db.restaurants.find({},{_id: 0, name: 1,borough:1, 'address.zipcode': 1})
// let query5 = db.restaurants.find({"borough":"Bronx"})
// let query6 = db.restaurants.find({"borough":"Bronx" }).limit(5)
// let query7 = db.restaurants.find({"borough":"Bronx"}).limit(5).skip(5)
// let query8 = db.restaurants.find({"grades.score": {$gt:90}})
// let query9 = db.restaurants.find({"grades.score": {$gt:80, $lt:100}})
// let query10 = db.restaurants.find({"address.coord.0":{$lt: -95.754168}},{_id:0 ,name: 1, "address.coord": 1})
// let query11 = db.restaurants.find({$and: [{ cuisine: { $ne: "American" } },{ "grades.score": { $gt: 70 } },{ "address.coord": { $lt: -65.754168 } }]})
// let query12 = db.restaurants.find({cuisine: {$ne: "American"}, "grades.score":{$gt:70}, "address.coord": {$lt:-65.754167}})
// let query13 = db.restaurants.find({cuisine: {$ne: "American"},"grades.grade": {$eq: "A"}, borough: {$ne: "Brooklyn"}}).sort({cuisine: -1})
// let query14 = db.restaurants.find({name:/^Wil/i},{restaurant_id:1, cuisine: 1, name:1})
// let query15 = db.restaurants.find({name:/ces$/i},{restaurant_id:1, cuisine:1, name:1})
// let query16 = db.restaurants.find({name: /Reg/i}, {name:1, restaurant_id:1, cuisine:1})
// let query17 = db.restaurants.find({borough: "Bronx", cuisine: {$in:["Chinese","American"]}})
// let query18 = db.restaurants.find({borough: {$in:["Staten Island","Queens","Bronx","Brooklyn"]}},{name:1,borough:1,cuisine:1,restaurant_id:1})
// let query19 = db.restaurants.find({borough: {$nin:["Staten Island","Queens","Bronx","Brooklyn"]}},{name:1,borough:1,cuisine:1,restaurant_id:1})
// let query20 = db.restaurants.find({"grades.score":{$lt:10}},{restaurant_id:1,name:1,borough:1,cuisine:1})
// let query25 = db.restaurants.find({},{_id:0,name:1}).sort({name:1})
// let query26 = db.restaurants.find({},{_id:0,name:1}).sort({name:-1})
// let query27 = db.restaurants.find({},{_id:0,name:1}).sort({cuisine:1, borough:-1})
// let query30 = db.restaurants.find({"grades.score":{$mod:[7,0]}},{restaurant_id:1,name:1,"grades.grade":1})
// let query31 = db.restaurants.find({name:/mon/i},{_id:0,name:1,borough:1,cuisine:1,"address.coord":1})
// let query32 = db.restaurants.find({name:/^Mad/i},{_id:0,name:1,borough:1,cuisine:1,"address.coord":1})



