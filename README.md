# nebula-games (private)

Ready-to-play WebAssembly builds for **Nebula Desktop** (nebula-desktop.html in the nebula-c repo).
Open the **Game Library** on the desktop, paste a read-only GitHub token once, and download games from here.

| Game | Folder | Source |
|---|---|---|
| DOOM | `doom/` | doomgeneric + `examples/doomgeneric_nebula.c` and `examples/doom-music/` in nebula-c (GPL) |
| Quake | `quake/` | `examples/quake/` in nebula-c (quakegeneric, GPL) |
| Craft | `craft/` | `examples/craft/` in nebula-c (MIT) |
| Half-Life (Quake-HL) | `quake-hl/` | `~/quake-hl` (`nebula/make_nebula.py`, then `nebula/check_build.mjs`); Quake engine GPL, SDK 2.3 under Valve's SDK license, data from your Steam Half-Life |

Each game folder: `game.json` (title, arguments, file list), `game.wasm`, `files/` (game data).
`games.json` lists the games for the library app. This repo is private because `quake/files/id1/pak1.pak` is the
full (registered) Quake data and `quake-hl/files/valve/` is Half-Life's — keep it private.

## Adding or updating a game
Build it in NebulaEdit with **Export ▾ → Program only (.wasm)**, put it in a folder like the ones here, add its
data under `files/`, write its `game.json`, add an entry to `games.json` (with the file list and a new `version`),
then commit and push.
