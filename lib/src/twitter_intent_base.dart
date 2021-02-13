const _authority = 'twitter.com';

class RetweetIntent {
  RetweetIntent({
    required this.tweetId,
    this.language,
  });

  static const _path = 'intent/retweet';

  /// Tweet ID to retweet.
  final String tweetId;

  /// The language of the Twitter UI once the intent is launched.
  final String? language;

  @override
  String toString() {
    return Uri.https(
      _authority,
      _path,
      {
        'tweet_id': tweetId,
        if (language != null) 'lang': language!,
      },
    ).toString();
  }
}

class TweetIntent {
  TweetIntent({
    this.hashtags,
    this.via,
    this.url,
    this.text,
    this.related,
    this.inReplyTo,
    this.language,
  });

  static const _path = 'intent/tweet';

  /// Allow easy discovery of Tweets by topic by including a
  /// list of hashtag values without the preceding # character.
  ///
  /// For more info, visit https://developer.twitter.com/en/docs/twitter-for-websites/tweet-button/guides/web-intent
  final List<String>? hashtags;

  /// A username to associate with the tweet.
  ///
  /// The provided username will be appended to the end of the tweet with the
  /// text "via @username".
  final String? via;

  /// A fully-qualified URL with a HTTP or HTTPS scheme.
  ///
  /// The URL is currently displayed after the text and before the hashtags.
  final String? url;

  /// Pre-populated Tweet text.
  ///
  /// The passed text will appear pre-selected for a Twitter user to delete or
  /// edit before posting.
  ///
  /// The Tweet author may easily remove the text with a single delete action.
  ///
  /// For more info, visit https://developer.twitter.com/en/docs/twitter-for-websites/tweet-button/guides/web-intent
  final String? text;

  /// A list of related account.
  ///
  /// I'm not sure this works, but honestly, I don't care, this is the least
  /// important feature at the moment, and I don't know how to verify this.
  ///
  /// Feel free to open a pull request if this does not work for you.
  final List<RelatedAccount>? related;

  /// The tweet ID of a parent tweet in a conversation, such as the initial
  /// tweet from your site or author account.
  final String? inReplyTo;

  /// The language of the Twitter UI once the intent is launched.
  final String? language;

  @override
  String toString() {
    return Uri.https(
      _authority,
      _path,
      {
        if (text != null) 'text': text!,
        if (hashtags != null) 'hashtags': hashtags!.join(','),
        if (via != null) 'via': via!,
        if (url != null) 'url': url!,
        if (related != null) 'related': related!.map((r) => '$r').join(','),
        if (inReplyTo != null) 'in_reply_to': inReplyTo!,
        if (language != null) 'lang': language!,
      },
    ).toString();
  }
}

class RelatedAccount {
  RelatedAccount({
    required this.username,
    this.description,
  });

  /// Suggested usernames related to the action (such as tweet).
  ///
  /// Twitter may suggest this account to follow after the user posts their
  /// tweet.
  final String username;

  /// Optional description of how the account relates to the action (such as
  /// tweet).
  final String? description;
  @override
  String toString() {
    if (description == null) return username;
    return '$username:$description';
  }
}

class LikeTweetIntent {
  LikeTweetIntent({
    required this.tweetId,
    this.language,
  });

  static const _path = 'intent/like';

  /// The ID of the tweet the user will be asked to like.
  ///
  /// Every tweet is identified by an ID. You can find this value from the
  /// API or by viewing the permalink page for any tweet, usually accessible by
  /// clicking on the timestamp displayed alongside a tweet.
  final String tweetId;

  /// The language of the Twitter UI once the intent is launched.
  final String? language;

  @override
  String toString() {
    return Uri.https(
      _authority,
      _path,
      {
        'tweet_id': tweetId,
        if (language != null) 'lang': language!,
      },
    ).toString();
  }
}

class FollowUserIntent {
  FollowUserIntent({
    required this.username,
    this.language,
  });

  static const _path = 'intent/follow';

  /// The username (screen name) to follow.
  ///
  /// When opened, the user will be asked to login if not already logged in.
  ///
  /// A simple "follow" window will be shown to the user. The user can
  /// decide not to follow the account.
  final String username;

  /// The language of the Twitter UI once the intent is launched.
  final String? language;
  @override
  String toString() {
    return Uri.https(
      _authority,
      _path,
      {
        'screen_name': username,
        if (language != null) 'lang': language!,
      },
    ).toString();
  }
}

class DirectMessageIntent {
  DirectMessageIntent({
    required this.recipientId,
    this.text,
    this.language,
  });

  static const _path = 'messages/compose';

  /// The user ID of the Twitter user that will receive the message.
  final String recipientId;

  /// The pre-populated text in the message.
  ///
  /// The user will have the chance to edit or discard the message.
  final String? text;

  /// The language of the Twitter UI once the intent is launched.
  final String? language;
  @override
  String toString() {
    return Uri.https(
      _authority,
      _path,
      {
        'recipient_id': recipientId,
        if (text != null) 'text': text!,
        if (language != null) 'lang': language!,
      },
    ).toString();
  }
}
