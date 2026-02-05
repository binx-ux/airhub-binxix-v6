Binxix Hub V6

AirHub V2 Style Redesign

Overview

Binxix Hub V6 is a Roblox script hub featuring a complete UI redesign inspired by the AirHub V2 aesthetic. This version focuses on a premium visual style, smooth animations, modular structure, and automatic game detection with conditional feature loading.

The hub supports multiple Roblox experiences and adapts its functionality depending on the current game.

Features
User Interface

Full AirHub V2 inspired redesign

Custom color palette with purple and pink accents

Smooth tween animations using TweenService

Modern tab system with active and inactive states

Clean typography and consistent spacing

Optimized UI performance

Game Detection

Automatically detects the current PlaceId

Loads game-specific configurations

Falls back to a universal mode if the game is unsupported

Supported Games

Arsenal

MiscGunTest-X

PR

MTC

Quick-Shot

Sniper Duels

Murder Mystery 2 (external loader)

The Strongest Battlegrounds (external loader)

Some games redirect to trusted external scripts when detected.

ESP System

Distance-based ESP color scaling

Separate color definitions for close, medium, far, and very far targets

Game-based ESP enable or disable logic

ESP availability depends on the detected game.

Supported Executors

Binxix Hub V6 is designed to work with executors that support modern UI rendering, HttpGet, and environment access.

Tested compatibility includes:

Xeno

Solara

Wave

Seliware

Compatibility may vary depending on executor updates. Using outdated versions may cause UI or feature issues.

External Script Handling

For certain games, Binxix Hub V6 automatically unloads itself and redirects to an external script:

Murder Mystery 2 uses Vertex

The Strongest Battlegrounds uses Phantasm

A custom loader notification UI is displayed during redirection.

Services Used

Players

TweenService

TeleportService

RunService

UserInputService

Workspace

Lighting

HttpService

Execution

This script is intended to be executed through a compatible Roblox script executor that supports:

HttpGet

UI instance creation

TweenService

Global environment access

Source Visibility and Usage

This project is intended for use only as provided.

You may run the script as-is, but modification, redistribution, or reverse engineering is not permitted unless explicitly authorized by the author.

Disclaimer

This project is provided for educational and experimental purposes. Use at your own risk. The author is not responsible for bans, data loss, or account actions resulting from usage.

Credits

Binxix
UI redesign inspired by AirHub V2
External scripts credited to their respective authors
