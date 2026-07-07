USE healthcare_management;

CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    FloorNo INT NOT NULL,
    Phone VARCHAR(15)
);

CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentID INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender ENUM('Male','Female','Other') NOT NULL,
    DOB DATE NOT NULL,
    Qualification VARCHAR(100),
    Specialization VARCHAR(100),
    ExperienceYears INT CHECK (ExperienceYears >= 0),
    Phone VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE,
    JoiningDate DATE,
    ConsultationFee DECIMAL(10,2) CHECK (ConsultationFee >= 0),
    Status ENUM('Active','Inactive') DEFAULT 'Active',

    CONSTRAINT fk_doctor_department
        FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);

CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender ENUM('Male','Female','Other') NOT NULL,
    DOB DATE NOT NULL,
    BloodGroup ENUM(
        'A+','A-',
        'B+','B-',
        'AB+','AB-',
        'O+','O-'
    ),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    EmergencyContact VARCHAR(15),
    RegistrationDate DATE
);

CREATE TABLE Medicines (
    MedicineID INT AUTO_INCREMENT PRIMARY KEY,
    MedicineName VARCHAR(100) NOT NULL,
    Category VARCHAR(100),
    Manufacturer VARCHAR(100),
    UnitPrice DECIMAL(10,2) CHECK (UnitPrice >= 0)
);

CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    VisitType ENUM('New','Follow-up') NOT NULL,
    Status ENUM(
        'Scheduled',
        'Completed',
        'Cancelled',
        'No Show'
    ) DEFAULT 'Scheduled',
    Symptoms TEXT,

    CONSTRAINT fk_appointment_patient
        FOREIGN KEY (PatientID)
        REFERENCES Patients(PatientID),

    CONSTRAINT fk_appointment_doctor
        FOREIGN KEY (DoctorID)
        REFERENCES Doctors(DoctorID)
);

CREATE TABLE MedicalRecords (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT NOT NULL UNIQUE,
    Diagnosis TEXT NOT NULL,
    Treatment TEXT,
    HeightCM DECIMAL(5,2),
    WeightKG DECIMAL(5,2),
    BloodPressure VARCHAR(20),
    HeartRate INT,
    Notes TEXT,

    CONSTRAINT fk_record_appointment
        FOREIGN KEY (AppointmentID)
        REFERENCES Appointments(AppointmentID)
);

CREATE TABLE Prescriptions (
    PrescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    RecordID INT NOT NULL,
    MedicineID INT NOT NULL,
    Dosage VARCHAR(100),
    Frequency VARCHAR(100),
    DurationDays INT,

    CONSTRAINT fk_prescription_record
        FOREIGN KEY (RecordID)
        REFERENCES MedicalRecords(RecordID),

    CONSTRAINT fk_prescription_medicine
        FOREIGN KEY (MedicineID)
        REFERENCES Medicines(MedicineID)
);

CREATE TABLE Bills (
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT NOT NULL UNIQUE,
    ConsultationCharge DECIMAL(10,2) DEFAULT 0,
    MedicineCharge DECIMAL(10,2) DEFAULT 0,
    LabCharge DECIMAL(10,2) DEFAULT 0,
    OtherCharge DECIMAL(10,2) DEFAULT 0,
    Discount DECIMAL(10,2) DEFAULT 0,
    Tax DECIMAL(10,2) DEFAULT 0,
    TotalAmount DECIMAL(10,2) NOT NULL,
    BillDate DATE,

    CONSTRAINT fk_bill_appointment
        FOREIGN KEY (AppointmentID)
        REFERENCES Appointments(AppointmentID)
);

CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    BillID INT NOT NULL UNIQUE,
    PaymentMethod ENUM(
        'Cash',
        'UPI',
        'Credit Card',
        'Debit Card',
        'Insurance'
    ),
    PaymentStatus ENUM(
        'Paid',
        'Pending',
        'Refunded'
    ) DEFAULT 'Pending',
    PaymentDate DATE,
    AmountPaid DECIMAL(10,2),

    CONSTRAINT fk_payment_bill
        FOREIGN KEY (BillID)
        REFERENCES Bills(BillID)
);

