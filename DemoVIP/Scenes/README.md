#  Scenes

* Every scene corresponds to one or more page which related to each other
* Scenes use VIP Architecture
* Scene managed by View (View Controller), Interactor and Presenter
* Routing logic is seperated to different file. Every scene has its own router.
* To make this architecture setup easier we have configurator class. This classes setup relation of classes in scene

## VIP cycle

We are using the Clean Swift approach for separating concerns for the different screens. Every scene* has it's own VIP cycle which manages:
[For more information](https://hackernoon.com/introducing-clean-swift-architecture-vip-770a639ad7bf)

### Interactors

* Holds buiseness logic
* Loading the data from the DB or backend - Interactor
* All processing should be done on the background thread 

### Presenters

* Preparing the data in a form ready to be displayed in the view controller - Presenter
* Should do any processing on the background thread as well, when possible.
* Make sure to dispatch back to the main thread when calling the view controller.
* Should contain a `weak` reference to the viewController - otherwise there will be a retain cycle in the VIP.

### ViewControllers

* Should not contain any logic - just interactor and router calls
* Triggering actions on user events - ViewController(s)

### Routers

* Contain the logic to move through the application flow
* Set the necessary configuration for the next scene to be displayed
* Routing to a new scene - Router

### Models 

#### Request

* Reparameters that need to be sent to the API request.

#### Response 

* Intercepts the response from the API and stores the appropriate data.

#### ViewModel

* Everything that you need to show to the UI is stored here. For example, your API returns objects with 10 parameters, but you only need to show 4 of them.


        

