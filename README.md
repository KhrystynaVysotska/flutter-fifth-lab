# Flood detection app

## Idea
This simple app displays information about water level of different rivers in several measurement points. I developed [backend](https://github.com/KhrystynaVysotska/cloud-second-lab-backend) for this app and deployed it in scope of cloud technologies course. The data is gathered by float sensors (simulated) and stored in database. There is also data about rivers and its measurement points. Then api can be used to interact with that data.

## App functionality
The main page of the app provides a list of rivers. There is also an app bar with carousel of latest measurements in all possible locations for fast access to the most relevant data. You can click on river card to see the list of its measurement points. Every measurement point has some predefined max water level. In case measurements are higher, a red floating button with exclamation mark indicates to the user these deviations. When clicking at the button, user can see the list of measurement points with risk of flood and can view further information about measurments at this measurement point (at most 100 latest measurements). Further information about measurements can also be accessed by clicking at measurement point card or at latest measurement card from carousel at app bar.

## Demo

Redirecting between pages

https://user-images.githubusercontent.com/56559854/142740802-ed94b7cb-705c-4607-b86e-07dd393b1879.mp4


Interacting with floating action button that indicates flood risk

https://user-images.githubusercontent.com/56559854/142740958-39c4172a-5670-4383-bff6-b306ae04bc5b.mp4

