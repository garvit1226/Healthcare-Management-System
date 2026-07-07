-- Rank doctors based on the number of appointments handled
SELECT
    d.DoctorID,
    CONCAT(d.FirstName,' ',d.LastName) AS DoctorName,
    COUNT(a.AppointmentID) AS TotalAppointments,
    RANK() OVER(ORDER BY COUNT(a.AppointmentID) DESC) AS DoctorRank
FROM Doctors d
JOIN Appointments a
ON d.DoctorID = a.DoctorID
GROUP BY d.DoctorID, DoctorName;

-- Assign row numbers to patients based on registration date
SELECT
    PatientID,
    CONCAT(FirstName,' ',LastName) AS PatientName,
    RegistrationDate,
    ROW_NUMBER() OVER(ORDER BY RegistrationDate) AS RowNum
FROM Patients;

-- Rank doctors by total revenue generated
SELECT
    d.DoctorID,
    CONCAT(d.FirstName,' ',d.LastName) AS DoctorName,
    SUM(b.TotalAmount) AS Revenue,
    DENSE_RANK() OVER(ORDER BY SUM(b.TotalAmount) DESC) AS RevenueRank
FROM Doctors d
JOIN Appointments a
ON d.DoctorID = a.DoctorID
JOIN Bills b
ON a.AppointmentID = b.AppointmentID
GROUP BY d.DoctorID, DoctorName;

-- Find the previous bill amount for each bill
SELECT
    BillID,
    TotalAmount,
    LAG(TotalAmount) OVER(ORDER BY BillDate) AS PreviousBill
FROM Bills;

-- Find the next bill amount for each bill
SELECT
    BillID,
    TotalAmount,
    LEAD(TotalAmount) OVER(ORDER BY BillDate) AS NextBill
FROM Bills;

-- Calculate cumulative hospital revenue
SELECT
    BillDate,
    TotalAmount,
    SUM(TotalAmount)
    OVER(ORDER BY BillDate) AS RunningRevenue
FROM Bills;

-- Calculate moving average of bill amount
SELECT
    BillDate,
    TotalAmount,
    ROUND(
        AVG(TotalAmount)
        OVER(
            ORDER BY BillDate
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),2
    ) AS MovingAverage
FROM Bills;

-- Display top three revenue-generating departments
WITH DepartmentRevenue AS
(
SELECT
    dep.DepartmentName,
    SUM(b.TotalAmount) AS Revenue
FROM Departments dep
JOIN Doctors d
ON dep.DepartmentID=d.DepartmentID
JOIN Appointments a
ON d.DoctorID=a.DoctorID
JOIN Bills b
ON a.AppointmentID=b.AppointmentID
GROUP BY dep.DepartmentName
)
SELECT *
FROM DepartmentRevenue
ORDER BY Revenue DESC
LIMIT 3;

-- Display doctors earning more than the average revenue
WITH DoctorRevenue AS
(
SELECT
    d.DoctorID,
    CONCAT(d.FirstName,' ',d.LastName) AS DoctorName,
    SUM(b.TotalAmount) AS Revenue
FROM Doctors d
JOIN Appointments a
ON d.DoctorID=a.DoctorID
JOIN Bills b
ON a.AppointmentID=b.AppointmentID
GROUP BY d.DoctorID,DoctorName
)
SELECT *
FROM DoctorRevenue
WHERE Revenue >
(
SELECT AVG(Revenue)
FROM DoctorRevenue
);

-- Find the most prescribed medicines
SELECT
    m.MedicineName,
    COUNT(*) AS PrescriptionCount
FROM Prescriptions p
JOIN Medicines m
ON p.MedicineID=m.MedicineID
GROUP BY m.MedicineName
ORDER BY PrescriptionCount DESC;

-- Find the most common diagnosis
SELECT
    Diagnosis,
    COUNT(*) AS TotalCases
FROM MedicalRecords
GROUP BY Diagnosis
ORDER BY TotalCases DESC
LIMIT 5;

-- Find patients with the highest hospital spending
SELECT
    p.PatientID,
    CONCAT(p.FirstName,' ',p.LastName) AS PatientName,
    SUM(b.TotalAmount) AS TotalSpent
FROM Patients p
JOIN Appointments a
ON p.PatientID=a.PatientID
JOIN Bills b
ON a.AppointmentID=b.AppointmentID
GROUP BY p.PatientID,PatientName
ORDER BY TotalSpent DESC
LIMIT 10;

-- Display department-wise average bill amount
SELECT
    dep.DepartmentName,
    ROUND(AVG(b.TotalAmount),2) AS AverageBill
FROM Departments dep
JOIN Doctors d
ON dep.DepartmentID=d.DepartmentID
JOIN Appointments a
ON d.DoctorID=a.DoctorID
JOIN Bills b
ON a.AppointmentID=b.AppointmentID
GROUP BY dep.DepartmentName
ORDER BY AverageBill DESC;

-- Find the busiest appointment day
SELECT
    AppointmentDate,
    COUNT(*) AS TotalAppointments
FROM Appointments
GROUP BY AppointmentDate
ORDER BY TotalAppointments DESC
LIMIT 1;

-- Find the percentage contribution of each department to total revenue
SELECT
    dep.DepartmentName,
    ROUND(
        SUM(b.TotalAmount)/
        (SELECT SUM(TotalAmount) FROM Bills)*100,
        2
    ) AS RevenuePercentage
FROM Departments dep
JOIN Doctors d
ON dep.DepartmentID=d.DepartmentID
JOIN Appointments a
ON d.DoctorID=a.DoctorID
JOIN Bills b
ON a.AppointmentID=b.AppointmentID
GROUP BY dep.DepartmentName
ORDER BY RevenuePercentage DESC;

-- Display payment status percentage
SELECT
    PaymentStatus,
    COUNT(*) AS TotalPayments,
    ROUND(
        COUNT(*)*100/
        (SELECT COUNT(*) FROM Payments),
        2
    ) AS Percentage
FROM Payments
GROUP BY PaymentStatus;

-- Find the average number of appointments per patient
SELECT
    ROUND(AVG(AppointmentCount),2) AS AverageAppointments
FROM
(
SELECT
    PatientID,
    COUNT(*) AS AppointmentCount
FROM Appointments
GROUP BY PatientID
) AS PatientVisits;

-- Find doctors who handled appointments in every month
SELECT
    DoctorID,
    COUNT(DISTINCT MONTH(AppointmentDate)) AS ActiveMonths
FROM Appointments
GROUP BY DoctorID
HAVING COUNT(DISTINCT MONTH(AppointmentDate))=12;

-- Display monthly revenue trend
SELECT
    YEAR(BillDate) AS Year,
    MONTH(BillDate) AS Month,
    SUM(TotalAmount) AS Revenue
FROM Bills
GROUP BY
YEAR(BillDate),
MONTH(BillDate)
ORDER BY Year,Month;

-- Find the top five patients with the highest number of completed appointments
SELECT
    p.PatientID,
    CONCAT(p.FirstName,' ',p.LastName) AS PatientName,
    COUNT(a.AppointmentID) AS CompletedAppointments
FROM Patients p
JOIN Appointments a
ON p.PatientID=a.PatientID
WHERE a.Status='Completed'
GROUP BY p.PatientID,PatientName
ORDER BY CompletedAppointments DESC
LIMIT 5;