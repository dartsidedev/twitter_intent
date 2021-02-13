import 'package:twitter_intent/twitter_intent.dart';

void main() {
  final followLink = FollowUserIntent(username: 'vincevargadev');
  print('Follow me on Twitter: $followLink');
}
