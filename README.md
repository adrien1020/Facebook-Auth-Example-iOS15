# Facebook Auth button login Example with Firebase

The integration of Facebook Login has become one of the essential features of mobile applications. 
Firebase provides a direct authentication solution to integrate one or more login methods into your application..<br>

![alt text](https://res.cloudinary.com/dhdgnx4mc/image/upload/v1653136025/media/GitHub/juzxfulcceva5ipgawzp.gif)

## Installation

Add the package ID to register and configure the application to use Facebook Login. 
To do this, configure the `Info.plist` file with an XML extract containing data about your application.

Note that the SwiftUI model no longer requires configuration files such as permissions and `Info.list` files. 
You must configure the fields in the Target Info tab and create the parameters in the project editor. 
These files are added to the project when additional fields are used.
Add the field `App Transport Security Settings`, the file **Facebook-Auth-Example-Info.plist** is added to our folder.


![alt text](https://res.cloudinary.com/dhdgnx4mc/image/upload/v1653136479/media/GitHub/h8zykegxmxqogofglnbw.png)

Open the `Info.plist` file previously and add `Allow Arbitrary Loads` to the `App transport Security Settings` dictionary and 
change the value to **YES**.

![alt text](https://res.cloudinary.com/dhdgnx4mc/image/upload/v1653136648/media/GitHub/ypebyqq1jstpyc1c6zno.png)

Now right click on `Info.plist` Open as source Code.

![alt text](https://res.cloudinary.com/dhdgnx4mc/image/upload/v1653136733/media/GitHub/rg94anskwyhn2occlfwp.png)

Copy and paste the following XML extract into the body of your file (<dict>...</dict>)

```XML
<key>CFBundleURLTypes</key>
<array>
  <dict>
  <key>CFBundleURLSchemes</key>
  <array>
    <string>fbAPP-ID</string>
  </array>
  </dict>
</array>
<key>FacebookAppID</key>
<string>APP-ID</string>
<key>FacebookClientToken</key>
<string>CLIENT-TOKEN</string>
<key>FacebookDisplayName</key>
<string>APP-NAME</string>
```

![alt text](https://res.cloudinary.com/dhdgnx4mc/image/upload/v1653136960/media/GitHub/quxry77xpveodlgbwfwd.png)

To use one of the Facebook dialog boxes (such as Login, Share, App Invitations, etc.) 
that can make an application change to Facebook apps, the `Info.plist `
file of your application must also include the following XML extract in the body of your file.

```XML
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>fbapi</string>
  <string>fb-messenger-share-api</string>
</array>
```

Now drag and drop the **FaceBook-Login-Info.plist** file to import the Firebase configuration

![alt text](https://res.cloudinary.com/dhdgnx4mc/image/upload/v1653137317/media/GitHub/ye4rdhoksfmmcbttu5ws.png)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
