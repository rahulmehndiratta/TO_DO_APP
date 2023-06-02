# TO_DO_APP





https://github.com/rahulmehndiratta/TO_DO_APP/assets/10243461/94841409-f55b-4936-98a5-32524f8e8726




TO_DO_APP Assignment in Swift
This is a sample iOS app that demonstrates the implementation of a TODO application using the VIPER architectural pattern and the Realm database.

Overview
The TODO Swift Assignment app allows users to create and manage their tasks in a structured manner. It follows the VIPER (View, Interactor, Presenter, Entity, Router) architectural pattern for a modular and scalable codebase. The app utilizes the Realm database for data persistence.

Features
Create new tasks with a title, time, and status.
Mark tasks as pending, completed, or TODO.
List all tasks with their respective details.
Edit and update existing tasks.
Delete tasks from the list.
VIPER Architecture
The app follows the VIPER architectural pattern, which separates responsibilities into distinct layers:

View: Displays the user interface and handles user interactions. Sends user actions to the presenter for processing.
Interactor: Contains the business logic and interacts with the data layer to perform CRUD operations on tasks.
Presenter: Receives user actions from the view and coordinates the response by interacting with the interactor and view.
Entity: Represents the task object and its properties.
Router: Handles navigation between different screens or modules within the app.
Realm Database Integration
The app utilizes the Realm database for data persistence. The TaskModel class represents the task entity and includes properties such as title, time, createdAt, and status. The Realm database allows for easy storage, retrieval, and modification of task objects.



Requirements
iOS 13.0+
Xcode 14.0+
Swift 5.0+
Installation
Clone or download the project from the GitHub repository: TODO Swift Assignment App.

Open the project in Xcode.

Install the required dependencies using a dependency manager like CocoaPods or Swift Package Manager.

Build and run the app on a simulator or physical device.

Usage
Upon launching the app, you will be presented with a list of existing tasks, if any. You can perform the following actions:

Tap the "+" button to create a new task. Fill in the title, time, and status, and tap "Save" to add the task to the list.
Tap on an existing task to view its details and make changes.
Swipe left on a task to reveal options for editing or deleting the task.
Use the segmented control at the top to filter tasks by status (TODO, Pending, or Completed).
Credits
The TODO Swift Assignment App was developed by Rahul Mehndiratta.

License
This project is licensed under the MIT License.

Feel free to update the sections and details based on your app's specific implementation and requirements.
