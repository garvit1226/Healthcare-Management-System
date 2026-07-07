

-- Display all patients
SELECT *
FROM Patients;

-- Display all doctors
SELECT *
FROM Doctors;

-- Display only patient names
SELECT FirstName, LastName
FROM Patients;

-- Display all active doctors
SELECT *
FROM Doctors
WHERE Status = 'Active';

-- Display patients whose blood group is O+
SELECT *
FROM Patients
WHERE BloodGroup = 'O+';

-- Display appointments that are completed
SELECT *
FROM Appointments
WHERE Status = 'Completed';

-- Display doctors whose consultation fee is greater than 700
SELECT *
FROM Doctors
WHERE ConsultationFee > 700;

-- Display medicines costing less than 100
SELECT *
FROM Medicines
WHERE UnitPrice < 100;

-- Display patients living in Delhi
SELECT *
FROM Patients
WHERE City = 'Delhi';

-- Display doctors from Cardiology department
SELECT *
FROM Doctors
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM Departments
    WHERE DepartmentName = 'Cardiology'
);

-- Display appointments scheduled in the year 2025
SELECT *
FROM Appointments
WHERE YEAR(AppointmentDate) = 2025;

-- Display patients registered after 1 January 2024
SELECT *
FROM Patients
WHERE RegistrationDate > '2024-01-01';

-- Display distinct cities of patients
SELECT DISTINCT City
FROM Patients;

-- Display top 10 highest priced medicines
SELECT *
FROM Medicines
ORDER BY UnitPrice DESC
LIMIT 10;

-- Display doctors ordered by experience
SELECT FirstName,
       LastName,
       ExperienceYears
FROM Doctors
ORDER BY ExperienceYears DESC;

-- Count the total number of patients
SELECT COUNT(*) AS TotalPatients
FROM Patients;

-- Count the total number of doctors
SELECT COUNT(*) AS TotalDoctors
FROM Doctors;

-- Find the average consultation fee
SELECT AVG(ConsultationFee) AS AverageConsultationFee
FROM Doctors;

-- Find the maximum bill amount
SELECT MAX(TotalAmount) AS HighestBill
FROM Bills;

-- Find the minimum medicine price
SELECT MIN(UnitPrice) AS LowestMedicinePrice
FROM Medicines;