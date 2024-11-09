
# AkakceProject_Appium_RobotFramework

![Appium](https://img.shields.io/badge/Appium-16B5E5?style=for-the-badge&logo=appium&logoColor=white)
![Robot Framework](https://img.shields.io/badge/Robot_Framework-FF5733?style=for-the-badge&logo=robot-framework&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![GitHub last commit](https://img.shields.io/github/last-commit/ChatGTHB/AkakceProject_Appium_RobotFramework?style=for-the-badge)

## 📜 Introduction
This project is an automated testing framework for the Akakce mobile application, developed using **Appium** and **Robot Framework**. The framework allows automated user actions such as registration, login, and product search on the Akakce platform, supporting both local and remote (BrowserStack) environments.

## 📂 Folder Structure
- **Data**: Contains data files like `user_details.yaml` with predefined user credentials.
- **Libraries**: Custom Python libraries, such as `StringGenerator.py`, for generating random user data.
- **Resources**: Robot Framework resource files (`.robot`) containing keywords for different pages in the application.
- **Tests**: Contains test case files (`Accounts.robot` and `Search.robot`) to validate functionalities like user registration, login, and product search.

## 🚀 Features
- **Automated Registration & Login**: Supports creating new user accounts and logging in with predefined credentials.
- **Product Search and Follow**: Searches for a product and follows it as a user action.
- **BrowserStack Integration**: Enables testing on cloud devices using BrowserStack.
- **Random Data Generation**: Uses the `faker` library to generate random user data.

## 📦 Dependencies
- **Appium**: For automating mobile interactions.
- **Robot Framework**: As the main test framework.
- **Faker**: For generating random user data.
- **BrowserStack**: For remote testing on cloud devices.

## 📥 Installation
1. **Clone the repository**:
   ```bash
   git clone https://github.com/ChatGTHB/AkakceProject_Appium_RobotFramework.git
   ```
2. **Install dependencies**:
   - Appium: Install Appium server.
   - Python packages:
     ```bash
     pip install robotframework appium-python-client Faker
     ```
3. **Set up Appium**:
   - Ensure the Appium server is running on the default port (4723) for local testing.

## 🔧 Configuration
- **User Data**: Modify `Data/user_details.yaml` to add or update user credentials.
- **Execution Environment**: Update `common.robot` with `local` or `browserstack` as the `execution_env` variable.
  - **Local**: Runs tests on an Android emulator or connected device.
  - **BrowserStack**: Runs tests on BrowserStack using the provided credentials.

## 📚 Test Execution
1. **Run Registration and Login Tests**:
   ```bash
   robot Tests/Accounts.robot
   ```
2. **Run Product Search Tests**:
   ```bash
   robot Tests/Search.robot
   ```

## 🔍 Key Components

### 1. **Data Files**
   - `user_details.yaml`: Contains predefined user data such as name, email, and password.

### 2. **Custom Libraries**
   - `StringGenerator.py`: Generates random names, surnames, emails, and passwords using the `faker` library.

### 3. **Test Files**
   - **Accounts.robot**: Includes test cases for user registration and login.
   - **Search.robot**: Includes test cases for searching a product and following it.

## 🤝 Contributing
1. Fork the repository.
2. Create a new branch for your feature (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a Pull Request.

## 📜 License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## 📫 Contact
For questions or issues, please open an issue in this repository or reach out via [LinkedIn](https://www.linkedin.com/in/cihatkose/).
