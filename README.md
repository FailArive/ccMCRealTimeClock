# ComputerCraft Minecraft Real Time Clock
A real time clock, that can be displayed on a 7 segment Redstone Lamp Display, using the Mods MoreRed and ComputerCraft. 

## Download startup.lua from pastebin

In the ComputerCraft Command Line just type:
`pastebin get https://pastebin.com/rCG5zpVx startup`

And then run it with:
`startup`

Now it always starts automatically (e.g. after Server Restart or if you restart the Computer).

## Setup Cables to Redstone Lamps

If you just want to use the code to build an easy working real time clock, you have to setup the cables like mine (you can also setup it like you want, but then you have to adjust the code.)

My setup:

![Redstone Lamp Setup](/Setup.png)

These are cables from MoreRed (I played on ATM 9). You have to connect the bundled cables with the Computer:

![Front](computer.png)

You have to be sure that the bundled cables from right, left, top and back aren´t connected.

![Back](computer2.png)

For each digit you have to do the same color setup.
Then you have to connect each cable with the segment that matches the color of the cable.

The Right bundled cable leads to the hour (tens place)
The Back bundled cable leads to the hour (units place)
The Top bundled cable leads to the minute (tens place)
The Left bundled cable leads to the minute (units place)

At the end it can look like this:

![Cable Salad](cablemanagement.png)

You can definetely do a better job in cable management, but it works.

And the you have your 7 segment clock in real time!

![Clock](clock.png)
