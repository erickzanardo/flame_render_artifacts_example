import 'package:flame/game.dart';
import 'package:flame_render_artifacts_example/fixed_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: Padding(
          padding: const EdgeInsets.all(56.0),
          child: GameWidget.controlled(gameFactory: FixedGame.new),
        ),
      ),
    ),
  );
}
