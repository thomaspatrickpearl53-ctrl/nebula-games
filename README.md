# nebula-games (private)

Ready-to-play WebAssembly builds for **Nebula Desktop** (nebula-desktop.html in the nebula-c repo).
Open the **Game Library** on the desktop, paste a read-only GitHub token once, and download games from here.

| Game | Folder | Source |
|---|---|---|
| DOOM | `doom/` | doomgeneric + `examples/doomgeneric_nebula.c` and `examples/doom-music/` in nebula-c (GPL) |
| Quake | `quake/` | `examples/quake/` in nebula-c (quakegeneric, GPL) |
| Craft | `craft/` | `examples/craft/` in nebula-c (MIT) |
| Half-Life (Quake-HL) | `quake-hl/` (mod: Blue Shift in `quake-hl/mods/bshift/`) | `~/quake-hl` (`nebula/make_nebula.py`, then `nebula/check_build.mjs`); Quake engine GPL, SDK 2.3 under Valve's SDK license, data from your Steam Half-Life |

Each game folder: `game.json` (title, arguments, file list), `game.wasm`, `files/` (game data).
`games.json` lists the games for the library app. This repo is private because `quake/files/id1/pak1.pak` is the
full (registered) Quake data and `quake-hl/files/valve/` is Half-Life's — keep it private.

Mods: `quake-hl/mods/bshift/` is Half-Life: Blue Shift for Quake-HL (`~/quake-hl`: `tools/install_bshift.py` from
the CD, then `nebula/make_nebula.py --game bshift --mod-base ~/Documents/nebula-games/quake-hl/files` and
`nebula/check_build.mjs`). Blue Shift's game code is Blue Shift Updated (twhl-community) ported to SDK 2.3.

## Icons, banners and mods
In `games.json`, a game can have:
- `"icon": "icon.png"` — a square picture (128×128 is plenty) in the game's folder: shown in the library and as the
  game's desktop icon.
- `"banner": "banner.jpg"` — a wide picture (about 960×300) shown across the top of the game in the library.
- `"mods": [ ... ]` — things that change the game's files. Each mod has `id`, `title`, `description`, `path` (its
  folder, e.g. `quake-hl/mods/bshift`), `version`, `size`, `files` and optionally its own `icon` and `banner`.

A mod's folder has:
- `mod.json`: `{ "title": ..., "args": [...], "dirs": [...], "remove": [...] }`. `args` replaces the game's program
  arguments (leave it out to keep them); `dirs` adds folders; `remove` lists game files to leave out (a path, or a
  folder ending in `/`).
- `files/...`: added on top of the game's `files/` (same path = replaced). A Doom WAD mod is e.g. `files/doom2.wad`
  plus `"args": ["-iwad", "doom2.wad"]`; a Quake mod `files/mymod/pak0.pak` plus `"args": ["-game", "mymod"]`.
- `game.wasm` (optional): when the mod needs its own program (Blue Shift: the game code is built with BSHIFT).

Nebula Desktop downloads a mod only when its game is downloaded, stores just the mod's files (and its saves), and
runs it as the game's files with the mod's on top. Removing a game removes its mods.

## Adding or updating a game
Build it in NebulaEdit with **Export ▾ → Program only (.wasm)**, put it in a folder like the ones here, add its
data under `files/`, write its `game.json`, add an entry to `games.json` (with the file list and a new `version`),
then commit and push.
