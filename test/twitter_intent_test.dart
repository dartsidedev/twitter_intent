import 'package:twitter_intent/twitter_intent.dart';
import 'package:test/test.dart';

void main() {
  group('$TweetIntent', () {
    test('simple test', () {
      expect(
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
        ).toString(),
        'https://twitter.com/intent/tweet?text=The+new+twitter_intent+package+is+here%21+%F0%9F%9A%80&hashtags=Dart%2CFlutter&via=vincevargadev&url=https%3A%2F%2Fpub.dev%2Fpackages%2Ftweet_intent&related=flutter101podcast%3AFlutter+Podcast',
      );
    });

    test('in reply to', () {
      expect(
        TweetIntent(
          text: 'Can\'t wait for this @FlutterDev podcast!',
          hashtags: ['Flutter', 'Dart'],
          via: 'vincevargadev',
          inReplyTo: '1355115682170597377',
        ).toString(),
        'https://twitter.com/intent/tweet?text=Can%27t+wait+for+this+%40FlutterDev+podcast%21&hashtags=Flutter%2CDart&via=vincevargadev&in_reply_to=1355115682170597377',
      );
    });
  });

  group('$FollowUserIntent', () {
    test('simple', () {
      expect(
        FollowUserIntent(
          username: 'vincevargadev',
        ).toString(),
        'https://twitter.com/intent/follow?screen_name=vincevargadev',
      );
    });

    test('with the Twitter UI set to Chinese (simplified)', () {
      expect(
        FollowUserIntent(
          username: 'vincevargadev',
          language: 'zh-cn',
        ).toString(),
        'https://twitter.com/intent/follow?screen_name=vincevargadev&lang=zh-cn',
      );
    });
  });

  group('$LikeTweetIntent', () {
    test('simple case', () {
      expect(
        LikeTweetIntent(
          tweetId: '1355115682170597377',
        ).toString(),
        'https://twitter.com/intent/like?tweet_id=1355115682170597377',
      );
    });

    test('like tweet intent for the French!', () {
      expect(
        LikeTweetIntent(
          tweetId: '1355115682170597377',
          language: 'fr',
        ).toString(),
        'https://twitter.com/intent/like?tweet_id=1355115682170597377&lang=fr',
      );
    });
  });

  group('$DirectMessageIntent', () {
    final vincevargadev = '1104126419557335042';
    test('recipient ID only', () {
      expect(
        DirectMessageIntent(recipientId: vincevargadev).toString(),
        'https://twitter.com/messages/compose?recipient_id=1104126419557335042',
      );
    });

    test('pre-populated message with emojis', () {
      expect(
        DirectMessageIntent(
          recipientId: vincevargadev,
          text: 'I just tried your Twitter package and it is 👌❤️.',
        ).toString(),
        'https://twitter.com/messages/compose?recipient_id=1104126419557335042&text=I+just+tried+your+Twitter+package+and+it+is+%F0%9F%91%8C%E2%9D%A4%EF%B8%8F.',
      );
    });
    test(
        'pre-populated message with a German text and emojis, and language set to German',
        () {
      expect(
        DirectMessageIntent(
          recipientId: vincevargadev,
          text: 'Hallo Vince, wie geht\'s dir? 🇩🇪',
          language: 'de',
        ).toString(),
        'https://twitter.com/messages/compose?recipient_id=1104126419557335042&text=Hallo+Vince%2C+wie+geht%27s+dir%3F+%F0%9F%87%A9%F0%9F%87%AA&lang=de',
      );
    });
  });

  group('$RetweetIntent', () {
    test('simple', () {
      expect(
        RetweetIntent(
          tweetId: '1355115682170597377',
        ).toString(),
        'https://twitter.com/intent/retweet?tweet_id=1355115682170597377',
      );
    });

    test('with language set to Spanish', () {
      expect(
        RetweetIntent(
          tweetId: '1355115682170597377',
          language: 'es',
        ).toString(),
        'https://twitter.com/intent/retweet?tweet_id=1355115682170597377&lang=es',
      );
    });
  });
}
