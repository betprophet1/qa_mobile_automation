# Mobile Automation
## A. Install environment
1. Install Python 3.8.10 - link https://www.python.org/ftp/python/3.8.10/python-3.8.10-amd64-webinstall.exe
   - check on  "Add Python 3.8 to PATH"
   - save the Python 3.8 folder

 ![2021-12-06_19h03_54](https://user-images.githubusercontent.com/3149594/144847528-db2a7072-6685-43e5-927b-787e021c6be4.png)

2. Coppy and paste file Browser Driver > chromedriver.exe to Python 3.8 folder path at step 1
![2021-12-06_19h03_54](https://user-images.githubusercontent.com/3149594/144857777-2f643d6d-d2e5-46aa-8c42-938d5009fdcd.png)

3. Install Java and AndroiD SDK
   3.1 Set JAVA_HOME Path
   3.2 Set Android_Home

4. Istall Appium-Server-GUI - link: https://github.com/appium/appium-desktop/releases/tag/v1.22.2

5. Install robotframework and library by cmd(Admin)
  - pip install robotframework-ride
  - pip install robotframework-appiumlibrary
  - pip install robotframework-seleniumlibrary
  - pip install robotframework-excellib
## B. Run test case
6. Start Appium server GUI
    host: 127.0.0.1
    port: 4723
    
8. Open RIDE to run test case
   - Open cmd and type    ![2022-01-20_01h32_39](https://user-images.githubusercontent.com/3149594/150192591-3d42b216-d3cd-484f-9550-5e97ac1d10b1.png)

7. Open project folder
   - Click on File > Open Directory > project folder

8. Run all test scripts
   - Click on Tool > Run Tests

10. View Test results
   - View Log in Browser (Ctrl + L)


-----------------------------------------------------------------------------
# Run Test Suite by Command line
Tests Suite are executed using the robot command
   - robot tests.robot

![2022-01-25_12h14_46](https://user-images.githubusercontent.com/3149594/150916103-dec82370-d2b6-4e35-8f39-359d1a70abb7.png)

