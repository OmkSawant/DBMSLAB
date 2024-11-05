db.employees.insertMany([
   { employee_id: 1, first_name: "John", last_name: "Doe", department: "IT", salary: 60000, hire_date: new Date("2021-05-15"), position: "Software Engineer" },
   { employee_id: 2, first_name: "Jane", last_name: "Smith", department: "HR", salary: 55000, hire_date: new Date("2020-03-10"), position: "HR Specialist" },
   { employee_id: 3, first_name: "Alex", last_name: "Johnson", department: "IT", salary: 70000, hire_date: new Date("2019-09-22"), position: "DevOps Engineer" },
   { employee_id: 4, first_name: "Emily", last_name: "Davis", department: "Finance", salary: 80000, hire_date: new Date("2021-02-18"), position: "Analyst" },
   { employee_id: 5, first_name: "David", last_name: "Duck", department: "IT", salary: 40000, hire_date: new Date("2020-06-05"), position: "Software Engineer" },
   { employee_id: 6, first_name: "Don", last_name: "Dev", department: "Finance", salary: 90000, hire_date: new Date("2019-08-03"), position: "Developer" }
])

--Queries
db.employees.find({})

db.employees.find({ department: "IT" })

db.employees.find({ department: "Finance", salary: { $gt: 85000 } })

db.employees.aggregate([
   { $group: { _id: "$department", count: { $sum: 1 } } }
])

db.employees.aggregate([
   { $group: { _id: "$department", averageSalary: { $avg: "$salary" } } }
])

db.employees.find({ hire_date: { $gt: new Date("2021-01-01") } })

db.employees.updateMany(
   { department: "IT" },
   { $inc: { salary: 50000 } }
)

db.employees.deleteOne({ employee_id: 6 })

db.employees.aggregate([
   { $group: { _id: "$department", maxSalary: { $max: "$salary" } } }
])

db.employees.aggregate([
   { $group: { _id: "$department", count: { $sum: 1 } } },
   { $match: { count: { $gt: 1 } } }
])

