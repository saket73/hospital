CREATE DATABASE Hospital_Management;
USE Hospital_Management;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    contact_number VARCHAR(15)
);

INSERT INTO Patients VALUES
(1, 'Amit Sharma', 30, 'Male', '9876543210'),
(2, 'Sonal Gupta', 25, 'Female', '9876543211'),
(3, 'Rahul Mehta', 40, 'Male', '9876543212'),
(4, 'Priya Desai', 35, 'Female', '9876543213'),
(5, 'Anil Kumar', 50, 'Male', '9876543214'),
(6, 'Meena Rathi', 45, 'Female', '9876543215'),
(7, 'Rohit Jain', 28, 'Male', '9876543216'),
(8, 'Kavita Yadav', 32, 'Female', '9876543217'),
(9, 'Vikram Singh', 38, 'Male', '9876543218'),
(10, 'Pooja Sinha', 29, 'Female', '9876543219');

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(50),
    specialization VARCHAR(30),
    contact_number VARCHAR(15),
    department VARCHAR(30)
);

INSERT INTO Doctors VALUES
(1, 'Dr. Sharma', 'Cardiology', '9990001111', 'Heart'),
(2, 'Dr. Joshi', 'Neurology', '9990002222', 'Brain'),
(3, 'Dr. Kapoor', 'Orthopedics', '9990003333', 'Bone'),
(4, 'Dr. Verma', 'Pediatrics', '9990004444', 'Children'),
(5, 'Dr. Rao', 'Dermatology', '9990005555', 'Skin'),
(6, 'Dr. Sen', 'ENT', '9990006666', 'Ear Nose Throat'),
(7, 'Dr. Mishra', 'Psychiatry', '9990007777', 'Mental Health'),
(8, 'Dr. Naik', 'Gastroenterology', '9990008888', 'Stomach'),
(9, 'Dr. Pathak', 'Ophthalmology', '9990009999', 'Eye'),
(10, 'Dr. Das', 'Pulmonology', '9990001212', 'Lungs');

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    reason VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Appointments VALUES
(1, 1, 1, '2025-04-01', 'Chest Pain'),
(2, 2, 2, '2025-04-02', 'Headache'),
(3, 3, 3, '2025-04-03', 'Back Pain'),
(4, 4, 4, '2025-04-04', 'Fever'),
(5, 5, 5, '2025-04-05', 'Skin Rash'),
(6, 6, 6, '2025-04-06', 'Ear Pain'),
(7, 7, 7, '2025-04-07', 'Anxiety'),
(8, 8, 8, '2025-04-08', 'Stomach Pain'),
(9, 9, 9, '2025-04-09', 'Blurred Vision'),
(10, 10, 10, '2025-04-10', 'Cough');

CREATE TABLE Medications (
    medication_id INT PRIMARY KEY,
    name VARCHAR(50),
    type VARCHAR(30),
    dosage VARCHAR(20),
    price DECIMAL(10,2)
);

INSERT INTO Medications VALUES
(1, 'Paracetamol', 'Tablet', '500mg', 10.00),
(2, 'Crocin', 'Tablet', '650mg', 15.00),
(3, 'Amoxicillin', 'Capsule', '250mg', 20.00),
(4, 'Azithromycin', 'Tablet', '500mg', 25.00),
(5, 'Cetirizine', 'Tablet', '10mg', 5.00),
(6, 'Dolo', 'Tablet', '650mg', 12.00),
(7, 'Ibuprofen', 'Tablet', '400mg', 8.00),
(8, 'Pantoprazole', 'Tablet', '40mg', 18.00),
(9, 'Ranitidine', 'Tablet', '150mg', 9.00),
(10, 'Metformin', 'Tablet', '500mg', 22.00);

CREATE TABLE Prescriptions (
    prescription_id INT PRIMARY KEY,
    appointment_id INT,
    medication_id INT,
    dosage VARCHAR(20),
    duration VARCHAR(20),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id),
    FOREIGN KEY (medication_id) REFERENCES Medications(medication_id)
);

INSERT INTO Prescriptions VALUES
(1, 1, 1, '500mg', '5 days'),
(2, 2, 2, '650mg', '3 days'),
(3, 3, 3, '250mg', '7 days'),
(4, 4, 4, '500mg', '3 days'),
(5, 5, 5, '10mg', '5 days'),
(6, 6, 6, '650mg', '2 days'),
(7, 7, 7, '400mg', '4 days'),
(8, 8, 8, '40mg', '10 days'),
(9, 9, 9, '150mg', '5 days'),
(10, 10, 10, '500mg', '15 days');

SELECT * FROM Patients;

SELECT name, specialization FROM Doctors;

SELECT * FROM Appointments WHERE patient_id = 3;

SELECT * FROM Medications WHERE price > 10;

SELECT * FROM Appointments WHERE appointment_date = '2025-04-05';

SELECT P.name AS Patient, D.name AS Doctor, A.appointment_date
FROM Appointments A
JOIN Patients P ON A.patient_id = P.patient_id
JOIN Doctors D ON A.doctor_id = D.doctor_id;

SELECT A.appointment_id, P.name, M.name AS Medication
FROM Prescriptions PR
JOIN Appointments A ON PR.appointment_id = A.appointment_id
JOIN Medications M ON PR.medication_id = M.medication_id
JOIN Patients P ON A.patient_id = P.patient_id;

SELECT D.name, COUNT(*) AS Total_Appointments
FROM Appointments A
JOIN Doctors D ON A.doctor_id = D.doctor_id
GROUP BY D.name;

SELECT COUNT(*) AS Total_Patients FROM Patients;

SELECT AVG(price) AS Avg_Price FROM Medications;

SELECT * FROM Medications WHERE price BETWEEN 10 AND 20;

SELECT appointment_date, COUNT(*) FROM Appointments GROUP BY appointment_date;

SELECT * FROM Patients WHERE age > 30;

SELECT * FROM Doctors WHERE department = 'Heart';

SELECT * FROM Medications WHERE name LIKE '%in%';

SELECT name FROM Patients
WHERE patient_id IN (SELECT patient_id FROM Appointments);

SELECT name FROM Doctors
WHERE doctor_id NOT IN (SELECT doctor_id FROM Appointments);

SELECT * FROM Medications ORDER BY price DESC LIMIT 5;

SELECT * FROM Appointments ORDER BY appointment_date DESC LIMIT 3;

SELECT PR.prescription_id, PA.name AS Patient, D.name AS Doctor, 
M.name AS Medication, PR.dosage, PR.duration
FROM Prescriptions PR
JOIN Appointments A ON PR.appointment_id = A.appointment_id
JOIN Patients PA ON A.patient_id = PA.patient_id
JOIN Doctors D ON A.doctor_id = D.doctor_id
JOIN Medications M ON PR.medication_id = M.medication_id;