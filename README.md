# Mastering Roblox Coding

<a href="https://www.packtpub.com/product/mastering-roblox-coding/9781801814041?utm_source=github&utm_medium=repository&utm_campaign=9781801814041"><img src="https://static.packt-cdn.com/products/9781801814041/cover/smaller" alt="Mastering Roblox Coding" height="256px" align="right"></a>

This is the code repository for [Mastering Roblox Coding](https://www.packtpub.com/product/mastering-roblox-coding/9781801814041?utm_source=github&utm_medium=repository&utm_campaign=9781801814041), published by Packt.

**The unofficial guide to leveling up your Roblox scripting skills and building games using Luau programming**

## What is this book about?
Roblox is a game platform with over 47 million daily active users. Something unique to Roblox is that you’re playing games made by other gamers! This means that you can make your own games, even if you have no experience. In addition, Roblox provides a free engine that allows you to create and publish a simple game in less than five minutes and get paid while at it.

This book covers the following exciting features: 
* Understand and learn the basics of Roblox Luau
* Discover how to write efficient and optimized Luau code to avoid bad smells
* Explore how to optimize your game for PC, consoles, phones, and tablets
* Get up to speed with how to build databases using Luau
* Understand client and server functionalities and learn how to securely establish communication

If you feel this book is for you, get your [copy](https://www.amazon.com/dp/180181404X) today!

<a href="https://www.packtpub.com/?utm_source=github&utm_medium=banner&utm_campaign=GitHubBanner"><img src="https://raw.githubusercontent.com/PacktPublishing/GitHub/master/GitHub.png" 
alt="https://www.packtpub.com/" border="5" /></a>


## Instructions and Navigations
All of the code is organized into folders. For example, Chapter02.

The code will look like the following:
```
local MINIMUM_PLAYERS = 1
local MAXIMUM_PLAYERS = 8
local playerPosition = 1

-- Checking if the player's position is a valid number
if playerPosition >= MINIMUM_PLAYERS and playerPosition <= MAXIMUM_PLAYERS then
   -- Getting correct message based on player›s position
   if playerPosition <= 3 then
      print("Well done! You are in spot " .. playerPosition .. "!")
   elseif playerPosition <= 5 then
      print("You are almost there!")
   else
      print("You are not in the top three yet! Keep going!")
   end
else
   -- The position of the player is not valid
   warn("Incorrect player position [" .. playerPosition .. "]!")
end
```

**Following is what you need for this book:**

This book is for fairly experienced Roblox developers who have basic programming knowledge and want to take their skills to the next level with advanced concepts in a simple and effective way. Basic knowledge of Roblox, Roblox Studio, and Roblox Luau is recommended before getting started with this book. A short refresher is provided for those who have not used Roblox in a while.

With the following software and hardware list you can run all code files present in the book (Chapter 1-10).

### Software and Hardware List

| Chapter  | Software required                   | OS required                                                                          |
| -------- | ------------------------------------| -------------------------------------------------------------------------------------|
| 1-10     | Roblox Player                       | Windows 7 or higher, Mac OS 10 or higher, iOS 9 or higher, and Android 5.0 or higher |
| 1-10     | Roblox Studio                       | Windows 7 or higher, Mac OS 10.11 or higher                                          |
 
It is recommended to own a Microsoft Xbox controller or an Xbox One and newer to test user input in *Chapter 7, Listening to User Input*

<hr>

We also provide a PDF file that has color images of the screenshots/diagrams used in this book. [Click here to download it](https://packt.link/2Zmph).

## Code in Action

Click on the following link to see the Code in Action:

[YouTube](https://bit.ly/3OEocEy)

### Related products <Other books you may enjoy>
* Coding Roblox Games Made Easy - Second Edition [[Packt]](https://www.packtpub.com/product/coding-roblox-games-made-easy/9781803234670?_ga=2.83231057.696896402.1658994676-1157268863.1584421665&utm_source=github&utm_medium=repository&utm_campaign=9781803234670) [[Amazon]](https://www.amazon.com/dp/1803234679)

* Learning C# by Developing Games with Unity 2021 - Sixth Edition [[Packt]](https://www.packtpub.com/product/learning-c-by-developing-games-with-unity-2021/9781801813945?_ga=2.20973052.696896402.1658994676-1157268863.1584421665&utm_source=github&utm_medium=repository&utm_campaign=9781801813945) [[Amazon]](https://www.amazon.com/dp/1801813949)

## Get to Know the Author
**Mark Kiepe**
is an experienced Roblox Programmer and Game Designer with over six years of experience. He has contributed to a dozen of successful Roblox games. Besides that, he is the Co-Owner of a Roblox Game Studio called Sarcastic Studios with games such as Pet Store Tycoon and Dream Island. Mark has contributed to more than 150 million play sessions across all games at the time of writing.
Mark started as a self-taught programmer on Roblox. What he learned on Roblox helped him in College. He currently attends a University of Applied Sciences in The Netherlands, where he studies Software Development.




