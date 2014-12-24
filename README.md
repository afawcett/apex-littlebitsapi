apex-littlebitsapi
==================

<a href="https://githubsfdeploy.herokuapp.com?owner=afawcett&repo=apex-littlebitsapi">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>

An Apex wrapper around the [LittleBits Cloud API](http://developer.littlebitscloud.cc/preview). [LittleBits](http://littlebits.cc/cloud) is a very cool way to creating **Internet of Things devices**! I was lucky enough to get given a [Cloud Starter Kit](http://littlebits.cc/kits/cloudbit-starter-kit) recently from Salesforce through the MVP program, thank you! And of course could not resist calling its API from Apex, to connect my new device up to my favourite cloud! 

Deploy the code and setup the Custom Setting or pass the Access Token and Device ID to the API directly, the following code uses the Custom Setting and sends 80% voltage for 10 seconds to the device. 
- If the LED is connected it shines at 80% for 10 seconds
- If the Servo is connected (in swing mode) it swings at 80% speed back and forth for 10 seconds. 

```java
new LittleBits().getDevice().output(80, 10000);
```
I plan to expand this to support more of the API, including Apex web hooks to allow subscription to events from the device inputs.

If **#clicksnotcode** is your thing, there is an integration with **Chatter via IFTTT** [here](https://ifttt.com/connect/littlebits/salesforce_chatter).
