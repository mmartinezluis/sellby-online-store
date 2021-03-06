# SellBy Online Store 
SellBy is a Sinatra-based ruby app designed using the MVC (models, views, controllers) framework, implementing RESTFful routes and covering the full CRUD cycle. This is my second milestone project at Flatiron's software engineering program. You can find a Medium article for SellBy [here](https://luis-mmartinez.medium.com/building-an-online-store-79708e5a71c6).

In SellBy users have the ability to:
* Login or create a new user account.
* Own funds for making purchases upon signing up to the app.
* Own a shopping cart.
* Add items to their shopping cart.
* Edit the quantity of a given item in their shopping cart.
* Delete items from their shopping cart.
* Purchase items from the listings posted by other users.
* Create listings to sell items to other users.
* Edit or delete their listings.
* Earn funds from sells.
* Check a list of all their listings.
* Check a list of all their purchases.

SellBy has the potential for many more functionalities. Some planned future improvements include:
* Add a Transaction model.
* Use the Transaction model to create an inventory for purchases and an inventory for sells.
* Add a dashboard view that shows a graph for sells and purchases over time.
* Add 'List' and 'Table' toggle buttons for switching the user's listings view and purchases view from list form to table form, and viceversa. 

Video walkthrough on YouTube: [SellBy part 1](https://www.youtube.com/watch?v=vLdbpASS1_A)

## Set Up
To run the app in your local machine follow the next steps:
1. Fork this repository and clone it.
2. Run `bundle install` to install gems.
3. Run `rake db:migrate` to setup the database.
4. Run `shotgun` and open your browser at `http://localhost:9393` to run the app.

## Contributing
Contributions and pull requests are welcomed. You can also create an issue to report a bug or make a request. For pull requests, you may follow these steps:
1. Fork and clone the repository.
2. Create a branch name denoting the feature or bug. For example: `git checkout -b feature/new-feature` or `git checkout -b bug/bug-fix`.
3. Write your code and submit changes with a clear commit message.
4. Push to the branch with `git push origin feature/new-feature`. 
5. Create a pull request, and explain the reason for the requested change (why the written code should be implemented).

## License
SellBy Online Store is available as open source under the terms of the [MIT License](https://github.com/mmartinezluis/SellBy-Online-Store-Sinatra-Project/blob/main/LICENSE.txt). 