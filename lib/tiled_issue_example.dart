import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_tiled/flame_tiled.dart';

class TiledIssueGame extends FlameGame with PanDetector {
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    const resX = 30.0;
    const resY = 80.0;

    camera = CameraComponent.withFixedResolution(width: resX, height: resY)
        ..viewfinder.position = Vector2(100, 90);

    final mapComponent = await TiledComponent.load(
      'cemetery.tmx',
      prefix: 'assets/images/',
      layerPaintFactory: (layer) {
          return Paint()..filterQuality = FilterQuality.none;
      },
      Vector2.all(8),
      
    );


    world.add(mapComponent);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    camera.viewfinder.position -= info.delta.global * .1;
  }
}
