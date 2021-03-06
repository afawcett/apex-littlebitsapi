apex-littlebitsapi
==================

<a href="https://githubsfdeploy.herokuapp.com?owner=afawcett&repo=apex-littlebitsapi">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>

An Apex wrapper around the [LittleBits Cloud API](http://developer.littlebitscloud.cc/preview). [LittleBits](http://littlebits.cc/cloud) is a very cool way to creating **Internet of Things devices**! I was lucky enough to get given a [Cloud Starter Kit](http://littlebits.cc/kits/cloudbit-starter-kit) recently from Salesforce through the MVP program, thank you! And of course could not resist calling its API from Apex, to connect my new device up to my favourite cloud! 

Deploy the code and setup the Custom Setting or pass the Access Token and Device ID to the API directly. The following code uses the Custom Setting to obtain the token and device Id, then sends 80% voltage for 10 seconds to the device. 
- If the LED is connected it shines at 80% for 10 seconds
- If the Servo is connected (in swing mode) it swings at 80% speed back and forth for 10 seconds. 

```java
new LittleBits().getDevice().output(80, 10000);
```
This API now supports the subscribe and unsubscribe resources.

If **#clicksnotcode** is your thing, there is an integration with **Chatter via IFTTT** [here](https://ifttt.com/connect/littlebits/salesforce_chatter). I am also working on a **LittleBits Connector** [here](https://github.com/afawcett/littlebits-connector).
