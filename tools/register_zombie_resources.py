import json
from pathlib import Path

root = Path(__file__).resolve().parents[1]
yyp_path = root / "Zombie Arena.yyp"
with open(yyp_path, encoding="utf-8") as f:
    yyp = json.load(f)

folder_entry = {
    "$GMFolder": "",
    "%Name": "Zombies",
    "folderPath": "folders/Sprites/Enemies/Zombies.yy",
    "name": "Zombies",
    "resourceType": "GMFolder",
    "resourceVersion": "2.0",
}
if not any(
    f.get("%Name") == "Zombies" and "Sprites/Enemies/Zombies" in f.get("folderPath", "")
    for f in yyp["Folders"]
):
    for i, f in enumerate(yyp["Folders"]):
        if f.get("%Name") == "Rooster":
            yyp["Folders"].insert(i + 1, folder_entry)
            break

manifest = json.loads((root / "sprites" / "zombie_sprites_manifest.json").read_text(encoding="utf-8"))
new_resources = []
for item in manifest:
    new_resources.append({"id": {"name": item["name"], "path": item["path"]}})

new_resources.extend(
    [
        {"id": {"name": "obj_zombie_toxic", "path": "objects/obj_zombie_toxic/obj_zombie_toxic.yy"}},
        {"id": {"name": "obj_zombie_boss", "path": "objects/obj_zombie_boss/obj_zombie_boss.yy"}},
    ]
)

existing_names = {r["id"]["name"] for r in yyp["resources"]}
added = 0
for resource in new_resources:
    if resource["id"]["name"] not in existing_names:
        yyp["resources"].append(resource)
        existing_names.add(resource["id"]["name"])
        added += 1

with open(yyp_path, "w", encoding="utf-8") as f:
    json.dump(yyp, f, indent=2)
    f.write("\n")

print(f"Added {added} resources")
