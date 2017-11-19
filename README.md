# Beerworld
App to show were the beer at !


Design thoughts:
1. The city object could be done as a struct. then i thought i dont want the app to parse and create the city objects everytime the app load.
esspecially when its a hardcoded list of cities. so instaed ive turned it into a class so it can confirm to NSCoding. Now thea app loads with premade ity list.

known issues:
Not all the optinal variables have been addressed. if it was production level app this would be resolved.
unfortently i been multitasking between a few home assignments such as this. lack of time.


Testing:
Most cities does not have brewries. when you search for a city that have brewries try prague. its in the list.
