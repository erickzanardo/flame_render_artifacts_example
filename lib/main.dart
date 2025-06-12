import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    const resX = 72.0;
    const resY = 40.0;

    camera = CameraComponent.withFixedResolution(width: resX, height: resY);

    final spriteImages = await images.load('little-adventures.png');
    world.add(
      SpriteComponent.fromImage(
        spriteImages,
        srcSize: Vector2.all(8),
        srcPosition: Vector2.zero(),
        position: Vector2(-(resX / 2), (resY / 2) - 8),
        size: Vector2.all(8),
      ),
    );

    world.add(
      SpriteComponent.fromImage(
        spriteImages,
        srcSize: Vector2.all(8),
        srcPosition: Vector2(16, 0),
        position: Vector2((resX / 2) - 8, (resY / 2) - 8),
        size: Vector2.all(8),
      ),
    );

    final middleTiles = resX / 2 - 8;
    for (int i = 0; i < middleTiles; i++) {
      world.add(
        SpriteComponent.fromImage(
          spriteImages,
          srcSize: Vector2.all(8),
          srcPosition: Vector2(8, 0),
          position: Vector2(-(resX / 2) + 8 + (i * 8), (resY / 2) - 8),
          size: Vector2.all(8),
        ),
      );
    }

    world.add(
      SpriteComponent.fromImage(
        spriteImages,
        srcSize: Vector2.all(8),
        srcPosition: Vector2(8, 88),
        position: Vector2(-(resX / 2) + 16, (resY / 2) - 16),
        size: Vector2.all(8),
      ),
    );
    world.add(
      SpriteComponent.fromImage(
        spriteImages,
        srcSize: Vector2.all(8),
        srcPosition: Vector2(16, 88),
        position: Vector2(-(resX / 2) + 24, (resY / 2) - 16),
        size: Vector2.all(8),
      ),
    );
    world.add(
      SpriteComponent.fromImage(
        spriteImages,
        srcSize: Vector2.all(8),
        srcPosition: Vector2(32, 88),
        position: Vector2(-(resX / 2) + 32, (resY / 2) - 16),
        size: Vector2.all(8),
      ),
    );
    world.add(
      SpriteComponent.fromImage(
        spriteImages,
        srcSize: Vector2.all(8),
        srcPosition: Vector2(88, 32),
        position: Vector2(-(resX / 2) + 56, (resY / 2) - 16),
        size: Vector2.all(8),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: Padding(
          padding: const EdgeInsets.all(56.0),
          child: GameWidget.controlled(gameFactory: MyGame.new),
        ),
      ),
    ),
  );
}
