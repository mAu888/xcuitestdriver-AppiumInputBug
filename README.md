# xcuitestdriver-AppiumInputBug

## Working
1. Build the `AppiumInputBug` target and copy the destination to the `AppiumInputBug.app` file
2. Install `xcuitest@4.33.2` driver (`appium driver install xcuitest@4.33.2`)
3. Start Appium `appium server --default-capabilities "{\"appium:app\":\"/path/to/AppiumInputBug.app\"}"`
4. Run the test `cd Tests; bundle install; be ruby test.rb`
5. Observe the test passes

## Broken
1. Build the `AppiumInputBug` target and copy the destination to the `AppiumInputBug.app` file
2. Install `xcuitest@4.34.0` or higher driver (`appium driver install xcuitest@4.34.0`)
3. Start Appium `appium server --default-capabilities "{\"appium:app\":\"/path/to/AppiumInputBug.app\"}"`
4. Run the test `cd Tests; bundle install; be ruby test.rb`
5. Observe the test fails
