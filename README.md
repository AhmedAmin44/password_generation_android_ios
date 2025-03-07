# Password Generation 🔐  

## 📌 Overview  
**Password Generation** is a secure password management application designed as part of a larger system to protect client data. The app automatically generates a new password for each user every four days, following specific rules set by the administrator. Security is enhanced using Firebase authentication, email OTP verification, and strict role-based access control.  

---  

## 🚀 Features  

### 👨‍💼 Admin Flow  
- The admin role is assigned via Firebase.  
- Logs in using **email OTP authentication** (OTP must be valid).  
- After successful login, the admin can:  
  - Define rules for password generation.  
  - View and manage users.  
  - Delete users from the system.  
- All passwords generated are securely stored in the database.  

---  

### 👤 User Flow  

#### Signup:  
- Users register with an email and verify it using **OTP authentication**.  

#### Login Process:  
- Users log in using their **email and password**.  
- They must enter an **email OTP** to access the home screen.  

#### Password Management:  
- If a user has a previous password, it is displayed. Otherwise, a message indicates that no password exists.  
- Users **cannot change password rules**—only the admin has this authority.  
- Users can generate a new password using the **"Generate" button**.  
- Once a password is generated, the user can confirm it using the **"This is OK" button**.  
- After confirmation, password generation is locked for **4 days**, and a **countdown timer** is displayed.  
- During the 4-day period, users can view their last password but must re-enter an **email OTP** for security verification.  

🔒 These measures ensure **high security**, as the generated passwords can be used for **banking, authentication, and other sensitive purposes**.  

---  

## 🛠️ Technologies Used  
- **Flutter (Dart)**  
- **Firebase Authentication** (Email & OTP)  
- **Cubit (State Management)**  
- **MVVM Architecture**  

---  
## 📸 Screenshots  

### 👤 User Screenshots  
🖼 Photo
🖼 Photo
🖼 Photo
🖼 Photo
🖼 Photo
🖼 Photo
🖼 Photo
🖼 Photo
🖼 Photo
🖼 Photo

### 👨‍💼 Admin Screenshots  
🖼 Photo
🖼 Photo
🖼 Photo


---  

## 🎥 Project Demo  
(https://www.linkedin.com/posts/ahmed-amin-643b1b241_flutter-firebase-security-activity-7299415747150188544-Uf8m?utm_source=share&utm_medium=member_desktop&rcm=ACoAADwk8tMBNwXxi0YUCGBNocnDUtHoPAf9lYg)
