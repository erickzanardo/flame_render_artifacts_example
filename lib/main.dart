import 'package:flame/game.dart' hide Route;
import 'package:flame_render_artifacts_example/fixed_example.dart';
import 'package:flame_render_artifacts_example/issue_example.dart';
import 'package:flutter/material.dart';

class IssueGameExample extends StatelessWidget {
  const IssueGameExample({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (context) => const IssueGameExample(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.all(56.0),
        child: GameWidget.controlled(gameFactory: IssueGame.new),
      ),
    );
  }
}

class FixedGameExample extends StatelessWidget {
  const FixedGameExample({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (context) => const FixedGameExample(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.all(56.0),
        child: GameWidget.controlled(gameFactory: FixedGame.new),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 16.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(IssueGameExample.route());
              },
              child: const Text('Issue Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(FixedGameExample.route());
              },
              child: const Text('Fix Example'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: const Home()));
}
