-- Display appointment details along with patient and doctor names
SELECT
    a.AppointmentID,
    CONCAT(p.FirstName,' ',p.LastName) AS PatientName,
    CONCAT(d.FirstName,' ',d.LastName) AS DoctorName,
    a.AppointmentDate,
    a.Status
FROM Appointments a
JOIN Patients p
ON a.PatientID = p.PatientID
JOIN Doctors d
ON a.DoctorID = d.DoctorID;

-- Display doctors along with their department names
SELECT
    d.DoctorID,
    CONCAT(d.FirstName,' ',d.LastName) AS DoctorName,
    dep.DepartmentName
FROM Doctors d
JOIN Departments dep
ON d.DepartmentID = dep.DepartmentID;

-- Count the number of doctors in each department
SELECT
    dep.DepartmentName,
    COUNT(d.DoctorID) AS TotalDoctors
FROM Departments dep
LEFT JOIN Doctors d
ON dep.DepartmentID = d.DepartmentID
GROUP BY dep.DepartmentName;

-- Count the number of appointments handled by each doctor
SELECT
    d.DoctorID,
    CONCAT(d.FirstName,' ',d.LastName) AS DoctorName,
    COUNT(a.AppointmentID) AS TotalAppointments
FROM Doctors d
LEFT JOIN Appointments a
ON d.DoctorID = a.DoctorID
GROUP BY d.DoctorID, DoctorName
ORDER BY TotalAppointments DESC;

-- Find departments having more than 10 doctors
SELECT
    dep.DepartmentName,
    COUNT(d.DoctorID) AS TotalDoctors
FROM Departments dep
JOIN Doctors d
ON dep.DepartmentID = d.DepartmentID
GROUP BY dep.DepartmentName
HAVING COUNT(d.DoctorID) > 10;

-- Display average consultation fee of each department
SELECT
    dep.DepartmentName,
    ROUND(AVG(d.ConsultationFee),2) AS AverageFee
FROM Departments dep
JOIN Doctors d
ON dep.DepartmentID = d.DepartmentID
GROUP BY dep.DepartmentName;

-- Display total revenue generated from bills
SELECT
    SUM(TotalAmount) AS TotalRevenue
FROM Bills;

-- Display department-wise revenue
SELECT
    dep.DepartmentName,
    SUM(b.TotalAmount) AS Revenue
FROM Bills b
JOIN Appointments a
ON b.AppointmentID = a.AppointmentID
JOIN Doctors d
ON a.DoctorID = d.DoctorID
JOIN Departments dep
ON d.DepartmentID = dep.DepartmentID
GROUP BY dep.DepartmentName
ORDER BY Revenue DESC;

-- Display patients who have visited more than 3 times
SELECT
    p.PatientID,
    CONCAT(p.FirstName,' ',p.LastName) AS PatientName,
    COUNT(a.AppointmentID) AS Visits
FROM Patients p
JOIN Appointments a
ON p.PatientID = a.PatientID
GROUP BY p.PatientID, PatientName
HAVING COUNT(a.AppointmentID) > 3;

-- Find the most expensive bill
SELECT
    BillID,
    TotalAmount
FROM Bills
WHERE TotalAmount = (
    SELECT MAX(TotalAmount)
    FROM Bills
);

-- Display payment status along with bill amount
SELECT
    p.PaymentID,
    b.TotalAmount,
    p.PaymentStatus
FROM Payments p
JOIN Bills b
ON p.BillID = b.BillID;

-- Display monthly appointment count
SELECT
    MONTH(AppointmentDate) AS MonthNumber,
    COUNT(*) AS TotalAppointments
FROM Appointments
GROUP BY MONTH(AppointmentDate)
ORDER BY MonthNumber;

-- Display patient names in uppercase
SELECT
    UPPER(CONCAT(FirstName,' ',LastName)) AS PatientName
FROM Patients;

-- Display doctor experience category
SELECT
    CONCAT(FirstName,' ',LastName) AS DoctorName,
    ExperienceYears,
    CASE
        WHEN ExperienceYears < 5 THEN 'Junior'
        WHEN ExperienceYears BETWEEN 5 AND 15 THEN 'Mid-Level'
        ELSE 'Senior'
    END AS ExperienceLevel
FROM Doctors;

-- Display completed appointments with diagnosis
SELECT
    a.AppointmentID,
    mr.Diagnosis
FROM Appointments a
JOIN MedicalRecords mr
ON a.AppointmentID = mr.AppointmentID
WHERE a.Status='Completed';

-- Find patients who have never booked an appointment
SELECT
    p.PatientID,
    CONCAT(p.FirstName,' ',p.LastName) AS PatientName
FROM Patients p
LEFT JOIN Appointments a
ON p.PatientID = a.PatientID
WHERE a.AppointmentID IS NULL;

-- Display medicine names prescribed for each diagnosis
SELECT
    mr.Diagnosis,
    m.MedicineName
FROM Prescriptions pr
JOIN Medicines m
ON pr.MedicineID = m.MedicineID
JOIN MedicalRecords mr
ON pr.RecordID = mr.RecordID;

-- Display total medicines prescribed for each patient
SELECT
    p.PatientID,
    CONCAT(p.FirstName,' ',p.LastName) AS PatientName,
    COUNT(pr.PrescriptionID) AS TotalMedicines
FROM Patients p
JOIN Appointments a
ON p.PatientID = a.PatientID
JOIN MedicalRecords mr
ON a.AppointmentID = mr.AppointmentID
JOIN Prescriptions pr
ON mr.RecordID = pr.RecordID
GROUP BY p.PatientID, PatientName
ORDER BY TotalMedicines DESC;

-- Display average bill amount by payment method
SELECT
    PaymentMethod,
    ROUND(AVG(b.TotalAmount),2) AS AverageBill
FROM Payments p
JOIN Bills b
ON p.BillID = b.BillID
GROUP BY PaymentMethod;

-- Display all pending payments
SELECT
    p.PaymentID,
    b.BillID,
    b.TotalAmount,
    p.PaymentMethod
FROM Payments p
JOIN Bills b
ON p.BillID = b.BillID
WHERE p.PaymentStatus='Pending';