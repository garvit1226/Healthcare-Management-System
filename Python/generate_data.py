
"""
Healthcare Management System - Dataset Generator
Part 1/3

This is the foundation of the dataset generator.
It creates:
- departments.csv
- doctors.csv
- patients.csv
- medicines.csv

Run:
    pip install faker pandas numpy
    python generate_data.py
"""

from faker import Faker
import pandas as pd
import random
from pathlib import Path
from datetime import date, timedelta

fake = Faker("en_IN")
Faker.seed(42)
random.seed(42)

OUTPUT_DIR = Path("../Dataset")
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

DEPARTMENTS = [
    ("Cardiology",2),
    ("Neurology",3),
    ("Orthopedics",4),
    ("Pediatrics",1),
    ("Dermatology",5),
    ("Oncology",6),
    ("ENT",2),
    ("General Medicine",1),
    ("Gynecology",3),
    ("Ophthalmology",4)
]

SPECIALIZATIONS = {
    "Cardiology":["Interventional Cardiologist","Cardiologist"],
    "Neurology":["Neurologist"],
    "Orthopedics":["Orthopedic Surgeon"],
    "Pediatrics":["Pediatrician"],
    "Dermatology":["Dermatologist"],
    "Oncology":["Oncologist"],
    "ENT":["ENT Specialist"],
    "General Medicine":["Physician"],
    "Gynecology":["Gynecologist"],
    "Ophthalmology":["Eye Specialist"]
}

SYMPTOM_DEPARTMENT = {
    "Chest Pain": "Cardiology",
    "High Blood Pressure": "Cardiology",
    "Heart Palpitations": "Cardiology",

    "Headache": "Neurology",
    "Migraine": "Neurology",
    "Dizziness": "Neurology",

    "Joint Pain": "Orthopedics",
    "Back Pain": "Orthopedics",
    "Fracture": "Orthopedics",

    "Fever": "General Medicine",
    "Cold": "General Medicine",
    "Cough": "General Medicine",
    "Routine Checkup": "General Medicine",

    "Skin Allergy": "Dermatology",
    "Rashes": "Dermatology",

    "Eye Irritation": "Ophthalmology",
    "Blurred Vision": "Ophthalmology",

    "Ear Pain": "ENT",
    "Sore Throat": "ENT",

    "Diabetes Checkup": "General Medicine",

    "Pregnancy Checkup": "Gynecology",

    "Child Vaccination": "Pediatrics",

    "Cancer Consultation": "Oncology"
}

SYMPTOM_DIAGNOSIS = {

    "Chest Pain": [
        "Angina",
        "Coronary Artery Disease",
        "Cardiac Arrhythmia"
    ],

    "High Blood Pressure": [
        "Hypertension"
    ],

    "Heart Palpitations": [
        "Cardiac Arrhythmia"
    ],

    "Headache": [
        "Migraine",
        "Tension Headache"
    ],

    "Migraine": [
        "Migraine"
    ],

    "Dizziness": [
        "Vertigo"
    ],

    "Joint Pain": [
        "Arthritis",
        "Ligament Injury"
    ],

    "Back Pain": [
        "Muscle Strain",
        "Slip Disc"
    ],

    "Fracture": [
        "Bone Fracture"
    ],

    "Fever": [
        "Viral Fever",
        "Seasonal Flu"
    ],

    "Cold": [
        "Common Cold"
    ],

    "Cough": [
        "Respiratory Infection"
    ],

    "Routine Checkup": [
        "Healthy"
    ],

    "Skin Allergy": [
        "Dermatitis",
        "Eczema"
    ],

    "Rashes": [
        "Skin Rash"
    ],

    "Eye Irritation": [
        "Conjunctivitis",
        "Dry Eye Syndrome"
    ],

    "Blurred Vision": [
        "Refractive Error",
        "Cataract"
    ],

    "Ear Pain": [
        "Ear Infection"
    ],

    "Sore Throat": [
        "Tonsillitis"
    ],

    "Diabetes Checkup": [
        "Type 2 Diabetes"
    ],

    "Pregnancy Checkup": [
        "Routine Pregnancy"
    ],

    "Child Vaccination": [
        "Routine Immunization"
    ],

    "Cancer Consultation": [
        "Cancer Screening"
    ]
}


DIAGNOSIS_TREATMENT = {

    "Angina": "Cardiac Medication",

    "Coronary Artery Disease": "Angiography and Medication",

    "Cardiac Arrhythmia": "ECG and Medication",

    "Hypertension": "Blood Pressure Medication",

    "Migraine": "Pain Management",

    "Tension Headache": "Pain Relievers",

    "Vertigo": "Vestibular Therapy",

    "Arthritis": "Physiotherapy",

    "Ligament Injury": "Physiotherapy",

    "Muscle Strain": "Muscle Relaxants",

    "Slip Disc": "Physiotherapy",

    "Bone Fracture": "Casting",

    "Viral Fever": "Medication and Rest",

    "Seasonal Flu": "Antiviral Medication",

    "Common Cold": "Rest and Hydration",

    "Respiratory Infection": "Antibiotics",

    "Healthy": "No Treatment Required",

    "Dermatitis": "Topical Cream",

    "Eczema": "Steroid Cream",

    "Skin Rash": "Antihistamines",

    "Conjunctivitis": "Eye Drops",

    "Dry Eye Syndrome": "Artificial Tears",

    "Refractive Error": "Prescription Glasses",

    "Cataract": "Cataract Surgery",

    "Ear Infection": "Antibiotics",

    "Tonsillitis": "Medication",

    "Type 2 Diabetes": "Diabetes Medication",

    "Routine Pregnancy": "Prenatal Care",

    "Routine Immunization": "Vaccination",

    "Cancer Screening": "Biopsy and Further Evaluation"
}

MEDICINES = [
    "Paracetamol",
    "Crocin",
    "Dolo 650",
    "Azithromycin",
    "Amoxicillin",
    "Cefixime",
    "Ibuprofen",
    "Diclofenac",
    "Aceclofenac",
    "Metformin",
    "Insulin",
    "Glimepiride",
    "Amlodipine",
    "Telmisartan",
    "Losartan",
    "Atorvastatin",
    "Aspirin",
    "Pantoprazole",
    "Omeprazole",
    "Rabeprazole",
    "Cetirizine",
    "Levocetirizine",
    "Montelukast",
    "Vitamin C",
    "Vitamin D",
    "Calcium",
    "Zinc Tablets",
    "ORS",
    "Eye Drops",
    "Artificial Tears",
    "Ear Drops",
    "Cough Syrup",
    "Salbutamol Inhaler",
    "Budesonide Inhaler",
    "Prednisolone",
    "Hydrocortisone Cream",
    "Clotrimazole Cream",
    "Mupirocin Ointment",
    "Antacid Syrup",
    "Multivitamin",
    "Iron Tablets",
    "Folic Acid",
    "Ondansetron",
    "Domperidone",
    "Tramadol",
    "Lignocaine Gel",
    "Betadine Solution",
    "Silver Sulfadiazine",
    "Amoxiclav",
    "Doxycycline"
]

DIAGNOSIS_MEDICINES = {

    "Angina": ["Aspirin", "Atorvastatin"],

    "Coronary Artery Disease": [
        "Aspirin",
        "Atorvastatin",
        "Telmisartan"
    ],

    "Cardiac Arrhythmia": [
        "Amlodipine"
    ],

    "Hypertension": [
        "Amlodipine",
        "Telmisartan",
        "Losartan"
    ],

    "Migraine": [
        "Paracetamol",
        "Ibuprofen"
    ],

    "Tension Headache": [
        "Paracetamol"
    ],

    "Vertigo": [
        "Ondansetron"
    ],

    "Arthritis": [
        "Diclofenac",
        "Aceclofenac"
    ],

    "Ligament Injury": [
        "Diclofenac"
    ],

    "Muscle Strain": [
        "Ibuprofen"
    ],

    "Slip Disc": [
        "Diclofenac",
        "Tramadol"
    ],

    "Bone Fracture": [
        "Calcium",
        "Vitamin D"
    ],

    "Viral Fever": [
        "Paracetamol",
        "Vitamin C",
        "ORS"
    ],

    "Seasonal Flu": [
        "Paracetamol",
        "Vitamin C"
    ],

    "Common Cold": [
        "Cetirizine",
        "Cough Syrup"
    ],

    "Respiratory Infection": [
        "Azithromycin",
        "Amoxicillin"
    ],

    "Healthy": [
        "Multivitamin"
    ],

    "Dermatitis": [
        "Hydrocortisone Cream"
    ],

    "Eczema": [
        "Hydrocortisone Cream"
    ],

    "Skin Rash": [
        "Cetirizine"
    ],

    "Conjunctivitis": [
        "Eye Drops"
    ],

    "Dry Eye Syndrome": [
        "Artificial Tears"
    ],

    "Refractive Error": [
    "Artificial Tears"
    ],

    "Cataract": [
        "Eye Drops"
    ],

    "Ear Infection": [
        "Ear Drops",
        "Azithromycin"
    ],

    "Tonsillitis": [
        "Amoxicillin",
        "Paracetamol"
    ],

    "Type 2 Diabetes": [
        "Metformin",
        "Glimepiride"
    ],

    "Routine Pregnancy": [
        "Folic Acid",
        "Iron Tablets"
    ],

    "Routine Immunization": [
        "Vitamin C"
    ],

    "Cancer Screening": [
        "Vitamin D"
    ]
}

CATEGORIES = [
"Antibiotic","Painkiller","Vitamin","Antacid","Antidiabetic",
"Antihistamine","Cardiac","Supplement"
]

MANUFACTURERS = [
"Sun Pharma","Cipla","Dr. Reddy's","Abbott",
"Lupin","Mankind","Alkem","Torrent"
]


def export(df,name):
    path = OUTPUT_DIR/f"{name}.csv"
    df.to_csv(path,index=False)
    print(f"Saved {path}")


def generate_departments():
    rows=[]
    for i,(name,floor) in enumerate(DEPARTMENTS,1):
        rows.append({
            "DepartmentID":i,
            "DepartmentName":name,
            "FloorNo":floor,
            "Phone":fake.msisdn()[:10]
        })
    df=pd.DataFrame(rows)
    export(df,"departments")
    return df


def generate_doctors(n=120):

    rows = []

    current_year = date.today().year

    for i in range(1, n + 1):

        dept = random.randint(1, 10)

        dept_name = DEPARTMENTS[dept - 1][0]

        gender = random.choice(["Male", "Female"])

        if gender == "Male":
            first = fake.first_name_male()
        else:
            first = fake.first_name_female()

        last = fake.last_name()

        dob = fake.date_between("-65y", "-28y")

        age = current_year - dob.year

        max_experience = max(1, age - 25)

        experience = random.randint(1, max_experience)

        joining_year = current_year - experience

        
        joining_date = date(
            joining_year,
            random.randint(1, 12),
            random.randint(1, 28)
        )

        rows.append({

            "DoctorID": i,

            "DepartmentID": dept,

            "FirstName": first,

            "LastName": last,

            "Gender": gender,

            "DOB": dob,

            "Qualification": random.choice([
                "MBBS",
                "MD",
                "MS",
                "DM"
            ]),

            "Specialization": random.choice(
                SPECIALIZATIONS[dept_name]
            ),

            "ExperienceYears": experience,

            "Phone": fake.msisdn()[:10],

            "Email": f"{first.lower()}.{last.lower()}{i}@hospital.com",

            "JoiningDate": joining_date,

            "ConsultationFee": random.choice([
                400,
                500,
                600,
                700,
                800,
                1000,
                1200
            ]),

            "Status": "Active" if random.random() < 0.92 else "Inactive"

        })

    df = pd.DataFrame(rows)

    export(df, "doctors")

    return df


def generate_patients(n=5000):
    cities=["Delhi","Noida","Ghaziabad","Meerut","Faridabad","Gurugram"]
    states=["Delhi","Uttar Pradesh","Haryana"]
    blood=["A+","A-","B+","B-","AB+","AB-","O+","O-"]
    rows=[]
    for i in range(1,n+1):
        gender=random.choice(["Male","Female"])
        first=fake.first_name_male() if gender=="Male" else fake.first_name_female()
        last=fake.last_name()
        rows.append({
            "PatientID":i,
            "FirstName":first,
            "LastName":last,
            "Gender":gender,
            "DOB":fake.date_between("-90y","-1y"),
            "BloodGroup":random.choice(blood),
            "Phone":fake.msisdn()[:10],
            "Email":f"{first.lower()}.{last.lower()}{i}@gmail.com",
            "Address":fake.street_address().replace(",", " "),
            "City":random.choice(cities),
            "State":random.choice(states),
            "EmergencyContact":fake.msisdn()[:10],
            "RegistrationDate":fake.date_between("-3y","today")
        })
    df=pd.DataFrame(rows)
    export(df,"patients")
    return df


def generate_medicines():
    rows=[]
    for i,name in enumerate(MEDICINES,1):
        rows.append({
            "MedicineID":i,
            "MedicineName":name,
            "Category":random.choice(CATEGORIES),
            "Manufacturer":random.choice(MANUFACTURERS),
            "UnitPrice":round(random.uniform(15,500),2)
        })
    df=pd.DataFrame(rows)
    export(df,"medicines")
    return df

def generate_appointments(n=15000):

    patients = pd.read_csv(OUTPUT_DIR / "patients.csv")

    doctors = pd.read_csv(OUTPUT_DIR / "doctors.csv")

    patient_registration = (
        patients.set_index("PatientID")["RegistrationDate"]
        .to_dict()
    )

    department_lookup = {
        i + 1: dept[0]
        for i, dept in enumerate(DEPARTMENTS)
    }

    doctors_by_department = {}

    for dept_id, dept_name in department_lookup.items():

        doctor_ids = doctors[
            doctors["DepartmentID"] == dept_id
        ]["DoctorID"].tolist()

        doctors_by_department[dept_name] = doctor_ids

    visit_types = ["New", "Follow-up"]

    statuses = [
        "Completed",
        "Scheduled",
        "Cancelled",
        "No Show"
    ]

    symptoms = list(SYMPTOM_DEPARTMENT.keys())

    rows = []

    for appointment_id in range(1, n + 1):

        patient = random.randint(1, 5000)

        registration = pd.to_datetime(
            patient_registration[patient]
        )

        appointment_date = registration + timedelta(
            days=random.randint(1, 730)
        )

        if appointment_date.date() > date.today():
            appointment_date = pd.Timestamp(date.today())

        symptom = random.choice(symptoms)

        department = SYMPTOM_DEPARTMENT[symptom]

        doctor = random.choice(
            doctors_by_department[department]
        )

        rows.append({

            "AppointmentID": appointment_id,

            "PatientID": patient,

            "DoctorID": doctor,

            "AppointmentDate": appointment_date.date(),

            "AppointmentTime": fake.time("%H:%M:%S"),

            "VisitType": random.choice(visit_types),

            "Status": random.choices(
                statuses,
                weights=[70,15,10,5]
            )[0],

            "Symptoms": symptom

        })

    df = pd.DataFrame(rows)

    export(df,"appointments")

    return df


def generate_medical_records():

    appointments = pd.read_csv(
        OUTPUT_DIR / "appointments.csv"
    )

    completed = appointments[
        appointments["Status"] == "Completed"
    ]

    rows = []

    record_id = 1

    for _, row in completed.iterrows():

        symptom = row["Symptoms"]

        diagnosis = random.choice(
            SYMPTOM_DIAGNOSIS[symptom]
        )

        treatment = DIAGNOSIS_TREATMENT[diagnosis]

        systolic = random.randint(105,145)

        diastolic = random.randint(65,90)

        height = round(
            random.uniform(145,190),
            1
        )

        bmi = random.uniform(18,30)

        weight = round(
            bmi * ((height/100)**2),
            1
        )

        rows.append({

            "RecordID": record_id,

            "AppointmentID": int(row["AppointmentID"]),

            "Diagnosis": diagnosis,

            "Treatment": treatment,

            "HeightCM": height,

            "WeightKG": weight,

            "BloodPressure": f"{systolic}/{diastolic}",

            "HeartRate": random.randint(60,100),

            "Notes": fake.sentence(10)

        })

        record_id += 1

    df = pd.DataFrame(rows)

    export(df,"medical_records")

    return df

def generate_prescriptions():

    records = pd.read_csv(
        OUTPUT_DIR / "medical_records.csv"
    )

    medicines = pd.read_csv(
        OUTPUT_DIR / "medicines.csv"
    )

    medicine_lookup = medicines.set_index(
        "MedicineName"
    )["MedicineID"].to_dict()

    rows = []

    prescription_id = 1

    dosage_options = [
        "250 mg",
        "500 mg",
        "650 mg",
        "5 ml",
        "10 ml",
        "1 Tablet"
    ]

    frequency_options = [
        "Once a day",
        "Twice a day",
        "Three times a day",
        "Before meals",
        "After meals"
    ]

    for _, row in records.iterrows():

        diagnosis = row["Diagnosis"]

        medicine_names = DIAGNOSIS_MEDICINES.get(
            diagnosis,
            ["Paracetamol"]
        )

        for medicine_name in medicine_names:

            if medicine_name not in medicine_lookup:
                continue

            rows.append({

                "PrescriptionID": prescription_id,

                "RecordID": row["RecordID"],

                "MedicineID": medicine_lookup[
                    medicine_name
                ],

                "Dosage": random.choice(
                    dosage_options
                ),

                "Frequency": random.choice(
                    frequency_options
                ),

                "DurationDays": random.randint(
                    3,
                    15
                )

            })

            prescription_id += 1

    df = pd.DataFrame(rows)

    export(df, "prescriptions")

    return df

def generate_payments():
    bills = pd.read_csv(OUTPUT_DIR / "bills.csv")

    methods = [
        "Cash",
        "UPI",
        "Credit Card",
        "Debit Card",
        "Insurance"
    ]

    rows = []

    payment_id = 1

    for _, bill in bills.iterrows():

        status = random.choices(

            ["Paid", "Pending", "Refunded"],

            weights=[88, 10, 2]

        )[0]

        amount = bill["TotalAmount"]

        payment_date = (
            pd.to_datetime(bill["BillDate"])
            + timedelta(days=random.randint(0, 5))
        ).date()

        if status == "Pending":
            amount_paid = 0
            payment_date = None
        elif status == "Refunded":
            amount_paid = amount
        else:
            amount_paid = amount

        rows.append({

            "PaymentID": payment_id,

            "BillID": int(bill["BillID"]),

            "PaymentMethod": random.choice(methods),

            "PaymentStatus": status,

            "PaymentDate": payment_date,

            "AmountPaid": amount_paid

        })

        payment_id += 1

    df = pd.DataFrame(rows)

    export(df, "payments")

    return df

def generate_bills():

    appointments = pd.read_csv(
        OUTPUT_DIR / "appointments.csv"
    )

    doctors = pd.read_csv(
        OUTPUT_DIR / "doctors.csv"
    )

    doctor_fee = doctors.set_index(
        "DoctorID"
    )["ConsultationFee"].to_dict()

    completed = appointments[
        appointments["Status"] == "Completed"
    ]

    rows = []

    bill_id = 1

    for _, row in completed.iterrows():

        consultation = float(
            doctor_fee[row["DoctorID"]]
        )

        medicine = random.randint(100,1500)

        lab = random.choice([
            0,
            300,
            500,
            800,
            1200
        ])

        other = random.randint(0,500)

        subtotal = (
            consultation
            + medicine
            + lab
            + other
        )

        discount = round(
            subtotal * random.uniform(0,0.10),
            2
        )

        taxable = subtotal - discount

        tax = round(
            taxable * 0.05,
            2
        )

        total = round(
            taxable + tax,
            2
        )

        rows.append({

            "BillID": bill_id,

            "AppointmentID": row["AppointmentID"],

            "ConsultationCharge": consultation,

            "MedicineCharge": medicine,

            "LabCharge": lab,

            "OtherCharge": other,

            "Discount": discount,

            "Tax": tax,

            "TotalAmount": total,

            "BillDate": row["AppointmentDate"]

        })

        bill_id += 1

    df = pd.DataFrame(rows)

    export(df, "bills")

    return df

if __name__ == "__main__":

    # generate_departments()

    # generate_doctors()

    generate_patients()

    # generate_medicines()

    # generate_appointments()

    # generate_medical_records()

    # generate_prescriptions()

    # generate_bills()

    # generate_payments()

    print("\nAll datasets generated successfully.")

