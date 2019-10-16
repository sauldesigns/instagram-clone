# Instagram Clone


Instagram Clone is a cross-platform mobile application powered by the Flutter Framework and Firebase.

The application was built with the idea of creating a clone of the modern Instagram application. Modifications were made to make it a little more appealing. 


| Homepage/Timeline | Photo Upload Page |
| ------ | ------ |
|<img src="github_assets/timeline.png" width="400" height="800">| <img src="github_assets/picture_edit.png" width="400" height="800">|

### Initial Page
  - Initial page will display a list of pictures user's have posted. 
  - Displaying only pictures of people that user's follow has yet to be implemented. 

### Photo Upload
  - As of right now, it will only display an upload button.
  - On pressing the button, it will trigger image picker allowing the user to select and image.
  - Once image is selected, the user will be routed to the page that lets them add a caption to the image. 
  - Once the user clicks Share the photo will upload to the database and be displayed on the homescreen/timline. 

### Pages Implemented
  - [x] Homepage
  - [x] Photo Upload
  - [ ] Search/Explore
  - [ ] Activity/Likes
  - [ ] User Profile

### Database & Authenthication
  - Powered By Firestore Database (Firebase)


### API
  - Powered by Firebase

>Instagram Clone uses Firebase to authenthicate users, and also taking advantage of Firestore Database to store user posts and data. 

### Open Source Projects
Instagram Clone uses a number of open source projects to work properly:

  - [Connectivity] - Allows app to discover network connectivity and configure themseleves accordingly allowing app to show error when not connected to the internet.
  - [Flushbar] - Makes it easier to display snackbar messages. 
  - [Provider] - For State Management
  - [http] - Future based library for making HTTP requests
  - [flutter_spinkit] - animated loading icons
  - [url_launcher] -  Flutter plugin for launching a URL in the mobile platform
  - [Firebase Core] - Enables connecting to multiple Firebase apps.
  - [Firebase Auth] - Enables Android and iOS authentication using passwords, phone numbers and identity providers like google, facebook, and twitter
  - [Firebase Storage] - Enables the use of Cloud Storage API.
  - [Firebase Cloud Firestore] - Enables the use of the Cloud Firestore API.
  - [Image Picker] - Flutter plugin for iOS and Android for picking images from the image library, and taking new pictures with the camera
  - [Email Validator] - Allows app to properly validate if an email was entered on sign in or sign up. 

### Mobile Application Installation

| Android | iOS |
| ------ | ------ |
| In-progress | In-progress |

Application in progress of being uploaded to both the iOS and Android App store.

### Todos
  - Write MORE Tests
  - Add smoother transitions/animations. 
  - Feature to bookmark user posts
  - Add more features


  [url_launcher]: <https://pub.dev/packages/url_launcher>
  [flutter_spinkit]: <https://pub.dev/packages/flutter_spinkit>
  [provider]: <https://pub.dev/packages/provider>
  [firebase core]: <https://pub.dev/packages/firebase_core>
  [firebase auth]: <https://pub.dev/packages/firebase_auth>
  [firebase storage]: <https://pub.dev/packages/firebase_storage>
  [firebase cloud firestore]: <https://pub.dev/packages/cloud_firestore>
  [http]: <https://pub.dev/packages/http>
  [url launcher]: <https://pub.dev/packages/url_launcher>
  [image picker]: <https://pub.dev/packages/image_picker>
  [connectivity]: <https://pub.dev/packages/connectivity>
  [flushbar]: <https://pub.dev/packages/flushbar>
  [Email Validator]: <https://pub.dev/packages/email_validator>
  [Fancy Bottom Navigation]: <https://pub.dev/packages/fancy_bottom_navigation>
  [Google Sign In]: <https://pub.dev/packages/google_sign_in>
  [Flutter Slidable]: <https://pub.dev/packages/flutter_slidable>  
  
  
