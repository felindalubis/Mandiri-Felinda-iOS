# Mandiri-Felinda-iOS

Notes:
App doesn't fully meet the requirements (yet) such as:
1. Create a screen to display the list of news categories. ✅ -> This one is hard coded based on newsapi.org doc since no endpoint covers the category list
2. Show news sources when user click one of the news category. ✅ -> I'm using /top-headlines/sources?
3. Show news articles when user click one of the news source. ✅ -> I'm using /everything?q="category"&sources="source-id"
4. Show the article detail on web view when user click one of the article. ✅ -> WKWebView
5. Provide function to search news sources and news articles. ❌
6. Implement endless scrolling on news sources and articles screen. ❌ -> haven't implement pagination, load full pages in 1 request
7. Cover positive and negative cases. ❌ -> haven't implement negative cases like no network, request time out, etc.

There are still lots of imperfection on the code quality also. Not to justify, I built the app and learn VIPER from 0 in a day, because of one reason or another.
I'd really appreciate it if I could still be given a chance to continue the reqruitment process apart from this speedrun project.

Cheers!🍻 <br>
Felinda
