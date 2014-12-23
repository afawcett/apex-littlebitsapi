apex-littlebitsapi
==================

<a href="https://githubsfdeploy.herokuapp.com?owner=afawcett&repo=apex-littlebitsapi">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>

An Apex wrapper around the [LittleBits Cloud API](http://developer.littlebitscloud.cc/preview). [LittleBits](http://littlebits.cc/cloud) is a very cool way to creating **Internet of Things devices**! I was lucky enough to get given a [Cloud Starter Kit](http://littlebits.cc/kits/cloudbit-starter-kit) recently from Salesforce through the MVP program, thank you! And of course could not resist calling its API from Apex, to connect my new device up to my favourite cloud! 

Deploy the code and setup the Custom Setting or pass the Access Token and Device ID to the API directly, the following code uses the Custom Setting and sends the default command to the device. I plan to expand this to support more of the API, including Apex web hooks to allow subscription to events from the device inputs.

```java
new LittleBits().getDevice().output();
```
