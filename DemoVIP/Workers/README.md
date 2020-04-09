#  Workers

* The access to the data in the Interactors is done through the workers. Be aware that interactors keep separate instances, so make sure to optimize the resources that are being used, by always keeping performance in mind
* The workers access the Stores and do not have reference to other workers. 
* They *do not* keep state and are purely functional - can be 100% tested.
* They encapsulate the access to the services like Networkings, Database, Userdefaults


