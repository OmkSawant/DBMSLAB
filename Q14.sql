db.Employee.insertMany([
    { emp_id: 1, emp_name: "Anuja", dept_name: "Comp", salary: 20000, gender: "F" },
    { emp_id: 2, emp_name: "Khushi", dept_name: "Comp", salary: 40000, gender: "M" },
    { emp_id: 3, emp_name: "Jayesh", dept_name: "It", salary: 30000, gender: "F" },
    { emp_id: 4, emp_name: "Lokesh", dept_name: "It", salary: 60000, gender: "M" },
    { emp_id: 5, emp_name: "Bhushan", dept_name: "Etc", salary: 50000, gender: "F" },
    { emp_id: 6, emp_name: "Manisha", dept_name: "Etc", salary: 90000, gender: "M" }
]);

--Queries
db.Employee.find({});

db.Employee.distinct("dept_name");

db.Employee.aggregate([
    { $group: { _id: "$dept_name", total_employees: { $sum: 1 } } }
]);

db.Employee.aggregate([
    { $group: { _id: "$dept_name", total_salary: { $sum: "$salary" } } }
]);

db.Employee.aggregate([
    { $match: { gender: "F" } },
    { $group: { _id: "$dept_name", total_female_salary: { $sum: "$salary" } } }
]);

db.Employee.aggregate([
    { $match: { gender: "M" } },
    { $group: { _id: "$dept_name", male_employee_count: { $sum: 1 } } }
]);

db.Employee.countDocuments({ gender: "M" });
db.Employee.aggregate([
    { $match: { gender: "M" } },
    { $count: "total_male_employees" }
]);

db.Employee.aggregate([
    { $group: { _id: null, minimum_salary: { $min: "$salary" } } }
]);

db.Employee.aggregate([
    { $match: { dept_name: "Comp" } },
    { $group: { _id: "$dept_name", max_salary_in_comp: { $max: "$salary" } } }
]);

db.Employee.find({ gender: "M" }).sort({ emp_name: 1 });


