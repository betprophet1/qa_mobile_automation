*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_PLATFORM_NAME}    Android
${ANDROID_PLATFORM_VERSION}    11    #11_9
${ANDROID_DEVICE_NAME}    emulator-5554    #emulator-5554_0ff2643f
${ANDROID_APP_PACKAGE}    com.prophetexchange
${ANDROID_APP_ACTIVITY}    com.prophetexchange.MainActivity
${remote_url}   http://127.0.0.1:4723/wd/hub
${alias}    Android
${excel_path}    ${CURDIR}/../DataSet/MobileTestData.xlsx
${testResult_path}    ${CURDIR}/../Results/MobileTestResults.xlsx
${time_out}    5