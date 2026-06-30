"""Generate GameMaker sprite resources from zombies/ sprite sheets."""
from __future__ import annotations

import json
import os
import uuid
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
SPRITES_DIR = ROOT / "sprites"

ZOMBIE_CONFIGS = [
    {
        "name": "basico",
        "source": ROOT / "zombies" / "LVL1" / "basico.png",
        "cell_w": 84,
        "cell_h": 78,
        "cols": 7,
        "rows": 4,
        "walk": [7, 8, 9, 10, 11, 12, 13],
        "attack": [14, 15, 16, 17, 18, 19],
        "hit": [21, 22, 25, 26],
        "walk_speed": 14.0,
        "attack_speed": 12.0,
        "hit_speed": 10.0,
    },
    {
        "name": "runner",
        "source": ROOT / "zombies" / "LVL2" / "runner.png",
        "cell_w": 211,
        "cell_h": 246,
        "cols": 7,
        "rows": 2,
        "walk": [0, 1, 2, 3],
        "attack": [4, 5, 6],
        "hit": [10, 11, 12, 13],
        "walk_speed": 16.0,
        "attack_speed": 14.0,
        "hit_speed": 12.0,
    },
    {
        "name": "tank",
        "source": ROOT / "zombies" / "LVL3" / "tank.png",
        "cell_w": 211,
        "cell_h": 264,
        "cols": 7,
        "rows": 2,
        "walk": [0, 1, 2, 3],
        "attack": [5, 6],
        "hit": [11, 12, 13],
        "walk_speed": 8.0,
        "attack_speed": 10.0,
        "hit_speed": 10.0,
    },
    {
        "name": "toxic",
        "source": ROOT / "zombies" / "LVL4" / "toxic.png",
        "cell_w": 185,
        "cell_h": 289,
        "cols": 8,
        "rows": 2,
        "walk": [0, 1, 2],
        "attack": [4, 5],
        "hit": [11, 12, 13, 14],
        "walk_speed": 12.0,
        "attack_speed": 12.0,
        "hit_speed": 10.0,
    },
    {
        "name": "boss",
        "source": ROOT / "zombies" / "LVL5" / "BOSS.png",
        "cell_w": 103,
        "cell_h": 128,
        "cols": 7,
        "rows": 2,
        "walk": [0, 1, 2, 3],
        "attack": [4, 5],
        "hit": [12, 13],
        "walk_speed": 8.0,
        "attack_speed": 10.0,
        "hit_speed": 8.0,
    },
]

ANIM_SUFFIXES = {
    "walk": ("walk", "walk_speed", True),
    "attack": ("attack", "attack_speed", False),
    "hit": ("hit", "hit_speed", False),
}


def new_id() -> str:
    return str(uuid.uuid4())


def frame_bbox(image: Image.Image) -> tuple[int, int, int, int]:
    px = image.convert("RGBA").load()
    w, h = image.size
    min_x, min_y = w, h
    max_x, max_y = 0, 0
    found = False

    for y in range(h):
        for x in range(w):
            r, g, b, a = px[x, y]
            if a > 10 and (r + g + b) > 30:
                found = True
                min_x = min(min_x, x)
                min_y = min(min_y, y)
                max_x = max(max_x, x)
                max_y = max(max_y, y)

    if not found:
        return 0, 0, w - 1, h - 1
    return min_x, min_y, max_x, max_y


def extract_frame(sheet: Image.Image, index: int, cell_w: int, cell_h: int, cols: int) -> Image.Image:
    row = index // cols
    col = index % cols
    box = (col * cell_w, row * cell_h, (col + 1) * cell_w, (row + 1) * cell_h)
    frame = sheet.crop(box).convert("RGBA")

    # Make black background transparent.
    px = frame.load()
    w, h = frame.size
    for y in range(h):
        for x in range(w):
            r, g, b, a = px[x, y]
            if a > 0 and r < 20 and g < 20 and b < 20:
                px[x, y] = (0, 0, 0, 0)

    return frame


def build_sprite(name: str, frames: list[Image.Image], playback_speed: float, loop: bool = True) -> dict:
    sprite_name = name
    sprite_path = f"sprites/{sprite_name}/{sprite_name}.yy"
    layer_id = new_id()
    frame_ids = [new_id() for _ in frames]

    width = max(f.size[0] for f in frames)
    height = max(f.size[1] for f in frames)

    bboxes = [frame_bbox(f) for f in frames]
    bbox_left = min(b[0] for b in bboxes)
    bbox_top = min(b[1] for b in bboxes)
    bbox_right = max(b[2] for b in bboxes)
    bbox_bottom = max(b[3] for b in bboxes)

    xorigin = width // 2
    yorigin = height - 1

    sprite_dir = SPRITES_DIR / sprite_name
    sprite_dir.mkdir(parents=True, exist_ok=True)
    layers_dir = sprite_dir / "layers"
    layers_dir.mkdir(exist_ok=True)

    for frame_id, frame in zip(frame_ids, frames):
        frame.save(sprite_dir / f"{frame_id}.png")
        layer_frame_dir = layers_dir / frame_id
        layer_frame_dir.mkdir(exist_ok=True)
        frame.save(layer_frame_dir / f"{layer_id}.png")

    frame_entries = [
        {
            "$GMSpriteFrame": "v1",
            "%Name": frame_id,
            "name": frame_id,
            "resourceType": "GMSpriteFrame",
            "resourceVersion": "2.0",
        }
        for frame_id in frame_ids
    ]

    keyframes = []
    for i, frame_id in enumerate(frame_ids):
        keyframes.append(
            {
                "$Keyframe<SpriteFrameKeyframe>": "",
                "Channels": {
                    "0": {
                        "$SpriteFrameKeyframe": "",
                        "Id": {"name": frame_id, "path": sprite_path},
                        "resourceType": "SpriteFrameKeyframe",
                        "resourceVersion": "2.0",
                    }
                },
                "Disabled": False,
                "id": new_id(),
                "IsCreationKey": False,
                "Key": float(i),
                "Length": 1.0,
                "resourceType": "Keyframe<SpriteFrameKeyframe>",
                "resourceVersion": "2.0",
                "Stretch": False,
            }
        )

    playback = 1 if loop else 0

    yy = {
        "$GMSprite": "v2",
        "%Name": sprite_name,
        "bboxMode": 2,
        "bbox_bottom": bbox_bottom,
        "bbox_left": bbox_left,
        "bbox_right": bbox_right,
        "bbox_top": bbox_top,
        "collisionKind": 1,
        "collisionTolerance": 0,
        "DynamicTexturePage": False,
        "edgeFiltering": False,
        "For3D": False,
        "frames": frame_entries,
        "gridX": 0,
        "gridY": 0,
        "height": height,
        "HTile": False,
        "layers": [
            {
                "$GMImageLayer": "",
                "%Name": layer_id,
                "blendMode": 0,
                "displayName": "default",
                "isLocked": False,
                "name": layer_id,
                "opacity": 100.0,
                "resourceType": "GMImageLayer",
                "resourceVersion": "2.0",
                "visible": True,
            }
        ],
        "name": sprite_name,
        "nineSlice": None,
        "origin": 9,
        "parent": {
            "name": "Zombies",
            "path": "folders/Sprites/Enemies/Zombies.yy",
        },
        "preMultiplyAlpha": False,
        "resourceType": "GMSprite",
        "resourceVersion": "2.0",
        "sequence": {
            "$GMSequence": "v1",
            "%Name": sprite_name,
            "autoRecord": True,
            "backdropHeight": 768,
            "backdropImageOpacity": 0.5,
            "backdropImagePath": "",
            "backdropWidth": 1366,
            "backdropXOffset": 0.0,
            "backdropYOffset": 0.0,
            "events": {
                "$KeyframeStore<MessageEventKeyframe>": "",
                "Keyframes": [],
                "resourceType": "KeyframeStore<MessageEventKeyframe>",
                "resourceVersion": "2.0",
            },
            "eventStubScript": None,
            "eventToFunction": {},
            "length": float(len(frames)),
            "lockOrigin": False,
            "moments": {
                "$KeyframeStore<MomentsEventKeyframe>": "",
                "Keyframes": [],
                "resourceType": "KeyframeStore<MomentsEventKeyframe>",
                "resourceVersion": "2.0",
            },
            "name": sprite_name,
            "playback": playback,
            "playbackSpeed": max(playback_speed, 1.0),
            "playbackSpeedType": 0,
            "resourceType": "GMSequence",
            "resourceVersion": "2.0",
            "showBackdrop": True,
            "showBackdropImage": False,
            "timeUnits": 1,
            "tracks": [
                {
                    "$GMSpriteFramesTrack": "",
                    "builtinName": 0,
                    "events": [],
                    "inheritsTrackColour": True,
                    "interpolation": 1,
                    "isCreationTrack": False,
                    "keyframes": {
                        "$KeyframeStore<SpriteFrameKeyframe>": "",
                        "Keyframes": keyframes,
                        "resourceType": "KeyframeStore<SpriteFrameKeyframe>",
                        "resourceVersion": "2.0",
                    },
                    "modifiers": [],
                    "name": "frames",
                    "resourceType": "GMSpriteFramesTrack",
                    "resourceVersion": "2.0",
                    "spriteId": None,
                    "trackColour": 0,
                    "tracks": [],
                    "traits": 0,
                }
            ],
            "visibleRange": None,
            "volume": 1.0,
            "xorigin": xorigin,
            "yorigin": yorigin,
        },
        "swatchColours": None,
        "swfPrecision": 2.525,
        "textureGroupId": {
            "name": "Default",
            "path": "texturegroups/Default",
        },
        "type": 0,
        "VTile": False,
        "width": width,
    }

    with open(sprite_dir / f"{sprite_name}.yy", "w", encoding="utf-8") as fh:
        json.dump(yy, fh, indent=2)
        fh.write("\n")

    return {
        "name": sprite_name,
        "path": sprite_path,
        "frame_count": len(frames),
    }


def main() -> None:
    generated = []

    for cfg in ZOMBIE_CONFIGS:
        sheet = Image.open(cfg["source"])
        for anim_key, (suffix, speed_key, should_loop) in ANIM_SUFFIXES.items():
            indices = cfg[anim_key]
            frames = [
                extract_frame(sheet, idx, cfg["cell_w"], cfg["cell_h"], cfg["cols"])
                for idx in indices
            ]
            speed = cfg[speed_key]
            sprite_name = f"spr_zombie_{cfg['name']}_{suffix}"
            info = build_sprite(sprite_name, frames, speed, should_loop)
            generated.append(info)
            print(f"Created {sprite_name} ({info['frame_count']} frames)")

    manifest = SPRITES_DIR / "zombie_sprites_manifest.json"
    with open(manifest, "w", encoding="utf-8") as fh:
        json.dump(generated, fh, indent=2)
        fh.write("\n")

    print(f"\nGenerated {len(generated)} sprites.")


if __name__ == "__main__":
    main()
