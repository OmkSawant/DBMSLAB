db.Student.insertMany([
    { student_id: 1, first_name: "John", last_name: "Doe", age: 20, grade: "A", major: "Computer Science" },
    { student_id: 2, first_name: "Jane", last_name: "Smith", age: 21, grade: "B", major: "Mathematics" },
    { student_id: 3, first_name: "Alex", last_name: "Johnson", age: 22, grade: "A", major: "Physics" },
    { student_id: 4, first_name: "Emily", last_name: "Davis", age: 23, grade: "C", major: "Biology" },
    { student_id: 5, first_name: "David", last_name: "Duck", age: 21, grade: "B", major: "Mathematics" },
    { student_id: 6, first_name: "Don", last_name: "Dev", age: 22, grade: "A", major: "Mathematics" }
]);

--Queries
db.Student.find({});

db.Student.find({ major: "Computer Science" });

db.Student.aggregate([
    { $group: { _id: "$major", total_students: { $sum: 1 } } }
]);

db.Student.find({ grade: "A" });

db.Student.aggregate([
    { $group: { _id: "$grade", count: { $sum: 1 } } },
    { $match: { count: { $gt: 2 } } }
]);

db.Student.find({}).sort({ age: 1 });  // Ascending order

db.Student.updateOne(
    { first_name: "Emily" },
    { $set: { major: "Physics" } }
);

db.Student.find({}).sort({ age: -1 }).limit(1);

db.Student.find({}).sort({ age: -1 }).limit(1);

db.Student.deleteOne({ student_id: 6 });

