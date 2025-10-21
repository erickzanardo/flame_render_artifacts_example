import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_tiled/flame_tiled.dart';

class TiledIssueGame extends FlameGame with PanDetector, ScrollDetector {
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    //const resX = 30.0;
    //const resY = 80.0;

    //camera = CameraComponent.withFixedResolution(width: resX, height: resY)
    //    ..viewfinder.position = Vector2(100, 90);

    camera.viewfinder.zoom = 8.33333;

    //camera.viewfinder.position = Vector2(130, 89);


    final mapComponent = await TiledComponent.load(
      'map.tmx',
      prefix: 'assets/images/',
      //layerPaintFactory: (layer) {
      //    return Paint()..filterQuality = FilterQuality.none;
      //},
      Vector2.all(16),
    );


    world.add(mapComponent);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    camera.viewfinder.position -= info.delta.global / camera.viewfinder.zoom;
    print(camera.viewfinder.position);
  }

  @override
  void onScroll(PointerScrollInfo info) {
    camera.viewfinder.zoom += info.scrollDelta.global.y / 20;
  }

  @override
  Color backgroundColor() => const Color(0xFFFFFFFF);
}
