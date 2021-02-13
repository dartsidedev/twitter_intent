# `twitter_intent`


The `twitter_intent` package helps you build Twitter Web Intents (URLs) and
provides an idiomatic Dart interface to ask your users to

* create tweets with custom hashtags, URL, pre-populated text, emoji-support, mentions, or replies 🐦
* like tweets 💙
* follow a user 🤩
* retweet tweets 📢
* send direct messages to a user (with optional pre-populated message) 💌

![Continuous Integration](https://github.com/dartsidedev/twitter_intent/workflows/Continuous%20Integration/badge.svg?branch=master)](https://github.com/dartsidedev/twitter_intent/actions) [![codecov](https://codecov.io/gh/dartsidedev/twitter_intent/branch/master/graph/badge.svg)](https://codecov.io/gh/dartsidedev/twitter_intent) [![twitter_intent](https://img.shields.io/pub/v/twitter_intent?label=twitter_intent&logo=dart)](https://pub.dev/packages/twitter_intent 'See twitter_intent package info on pub.dev') [![Published by dartside.dev](https://img.shields.io/static/v1?label=Published%20by&message=dartside.dev&logo=dart&logoWidth=30&color=40C4FF&labelColor=1d599b&labelWidth=100)](https://pub.dev/publishers/dartside.dev/packages) [![GitHub Stars Count](https://img.shields.io/github/stars/dartsidedev/twitter_intent?logo=github)](https://github.com/dartsidedev/twitter_intent 'Star me on GitHub!')

## Important links

* [Read the source code and **star the repo** on GitHub](https://github.com/dartsidedev/twitter_intent)
* [Open an issue on GitHub](https://github.com/dartsidedev/twitter_intent/issues)
* [See package on `pub.dev`](https://pub.dev/packages/twitter_intent)
* [Read the docs on `pub.dev`](https://pub.dev/documentation/twitter_intent/latest/)

### About Twitter Web Intents

* [Twitter Web Intents Overview](https://developer.twitter.com/en/docs/twitter-for-websites/web-intents/overview)
* [Direct message](https://developer.twitter.com/en/docs/twitter-for-websites/direct-message-button)

To document this package, I sometimes directly quoted from the official docs.

## Introduction 

**Web Intents are the simplest way to let people tweet or follow Twitter accounts** (amongst others).

This package helps you build Twitter Web Intents.

Web Intents let you work with tweets and Twitter users.
They make is possible for users to interact with Twitter content in the context
of your site/app, without having to authorize a new app just for the interaction.

Web intents are **mobile friendly**, include native app handlers on iOS and Android
when the Twitter app is installed.
This mean that if the user has the Twitter app installed, the web intents will
be automatically opened in the Twitter app (instead of opening the browser).

If the user is not logged it, they will be asked to login.
After login your intent will be shown to them.

Launching web intents will not actually perform any action on the user's behalf,
it just makes the action easier for the user (for example, by pre-populating the tweet and adding hashtags).
The package will not do anything without the user's consent.

### Dart

The package works everywhere and doesn't have any Flutter specific dependency.

It works in HTML pages, regardless if you use the package on the frontend with
AngularDart, "vanilla" Dart, or rendered to an `a` tag from your Dart HTTP server.

It would also work with markdown, as you can see in the examples below.

### Flutter

If you want to use this package with Flutter, use the `url_launcher` plugin
for launching the links that you create with the `twitter_intent` package.

```dart
import 'package:twitter_intent/twitter_intent.dart';

// For Flutter applications, you'll most likely want to use
// the url_launcher package.
import 'package:url_launcher/url_launcher.dart';

// ...somewhere in your Flutter app...
launchTwitterIntent() async {
  final intent = FollowUserIntent(username: 'vincevargadev');
  // Convert the intent instance to a string.
  // Use either Dart's string interpolation or the toString() method.
  // The "launch" method is part of "url_launcher".
  await launch('$intent');
}
```

## Usage

Here are a couple of examples how you can use this package.

Don't forget to convert the intents toString to get the URLs.

I left actual, working links below each example, so that you can try them out
right from your browser.

These links will also help with understanding how the web intents work on mobile, especially if the official Twitter app is
installed on your phone. You can try out these intents without having to write
a Flutter app just by using the links below.

### Follow user

Launching a `FollowUserIntent` will ask to follow the specified user.

```dart
FollowUserIntent(username: 'vincevargadev');
```

[Follow me `@vincevargadev`](https://twitter.com/intent/follow?screen_name=vincevargadev)

Keep in mind that usernames might change.

### Retweet

To let the user retweet a link, just look up the tweet ID and you are ready to go!

```dart
RetweetIntent(tweetId: '1355115682170597377');
```

[Retweet my tweet about the Flutter 101 Podcast](https://twitter.com/intent/retweet?tweet_id=1355115682170597377)

### Simple tweet intent

With the `TweetIntent`, you can pre-populate the user's tweet with hashtags,
URLs, and the text. The user can still edit the tweet before sending it, or the
user might even just cancel the tweet.

```dart
TweetIntent(
  hashtags: ['Dart', 'Flutter'],
  text: 'The new twitter_intent package is here! 🚀',
  via: 'vincevargadev',
  url: 'https://pub.dev/packages/tweet_intent',
  related: [
    RelatedAccount(
      username: 'flutter101podcast',
      description: 'Flutter Podcast',
    ),
  ],
)
```

[Help this package get more users by tweeting about it!](https://twitter.com/intent/tweet?text=The+new+twitter_intent+package+is+here%21+%F0%9F%9A%80&hashtags=Dart%2CFlutter&via=vincevargadev&url=https%3A%2F%2Fpub.dev%2Fpackages%2Ftweet_intent&related=flutter101podcast%3AFlutter+Podcast)

### Tweet intent in reply to an existing tweet

```dart
TweetIntent(
  text: 'Can\'t wait for this @FlutterDev podcast!',
  hashtags: ['Flutter', 'Dart'],
  via: 'vincevargadev',
  inReplyTo: '1355115682170597377',
);
```

[Respond to my podcast tweet](https://twitter.com/intent/tweet?text=Can%27t+wait+for+this+%40FlutterDev+podcast%21&hashtags=Flutter%2CDart&via=vincevargadev&in_reply_to=1355115682170597377)

### Like tweet

```dart
LikeTweetIntent(tweetId: '1355115682170597377');
```

[Like my podcast tweet](https://twitter.com/intent/like?tweet_id=1355115682170597377)

### Direct message

```dart
// Twitter expects a user ID for DMs.
final vincevargadev = '1104126419557335042';
DirectMessageIntent(recipientId: vincevargadev);
```

[Send me a direct message](https://twitter.com/messages/compose?recipient_id=1104126419557335042)

### Direct message with pre-populated text (and emojis)

```dart
// Twitter expects a user ID for direct messages.
final vincevargadev = '1104126419557335042';
DirectMessageIntent(
  recipientId: vincevargadev,
  text: 'I just tried your Twitter package and it is 👌❤️.',
);
```

[Send me a direct message about this package](https://twitter.com/messages/compose?recipient_id=1104126419557335042&text=I+just+tried+your+Twitter+package+and+it+is+%F0%9F%91%8C%E2%9D%A4%EF%B8%8F.)


### Localization 

All intents in this package accept the `language` parameter that lets you
override the language display of a logged-in user or languages accepted by
the browser.

Examples: `en`, `de`, `es`, `hu`, `zh-cn`, `ur`, `vi`, `hi`, `ja`.

This basically means that you can set the language of the Twitter UI by passing
in the `language` parameter.

Twitter supports 30+ languages. For the full list visit [Twitter's supported languages](https://developer.twitter.com/en/docs/twitter-for-websites/supported-languages) document.

This feature only works in web browsers. Overriding the mobile app's language is not possible.
If you want to test the examples below, copy the link address and open it in an
incognito window.

#### Follow (Chinese)

```dart
FollowUserIntent(
  username: 'vincevargadev',
  language: 'zh-cn',
);
```

[Follow me with the Twitter UI set to Chinese!](https://twitter.com/intent/follow?screen_name=vincevargadev&lang=zh-cn)

#### Direct message (German)

```dart
DirectMessageIntent(
  recipientId: vincevargadev,
  text: 'Hallo Vince, wie geht\'s dir? 🇩🇪',
  language: 'de',
);
```

[German message with German Twitter UI](https://twitter.com/messages/compose?recipient_id=1104126419557335042&text=Hallo+Vince%2C+wie+geht%27s+dir%3F+%F0%9F%87%A9%F0%9F%87%AA&lang=de)

