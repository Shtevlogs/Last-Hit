# Last Hit - Game Design Document

## Executive Summary

**Last Hit** is a prototype idle/clicker game that combines MOBA-style last-hitting mechanics with strategic lane-based combat. Players must click and hold on enemy minions at the right moment to secure last-hits and earn points, which can be spent to spawn their own minions. The game features a grid-based combat system with multiple lanes, upgradeable stats, and boss encounters.

**Platform**: Web and PC (Godot Engine)  
**Art Style**: Simple top-down 2D polygon-based graphics with simple colors and shapes  
**Target Audience**: Players who enjoy idle games and MOBA mechanics

---

## Core Gameplay Mechanics

### Last-Hit System

- **Mechanic**: Click and hold on enemy minions when their health is low enough
- **Visual Indicator**: Circular meter wraps around cursor during hold
- **Hold Duration**: Starts at 0.8 seconds (reducible via upgrades by 0.1s per upgrade)
- **Damage**: When meter completes, minion takes instant damage equal to player's damage stat
- **Last-Hit Threshold**: Dynamic based on player damage stat
  - Starting thresholds: ~1/4 of caster HP, ~1/6 of melee HP, ~1/10 of tank HP
  - Damage dealt is highlighted on enemy health bars
- **Alternative Action**: Players can hold click on enemies to deal damage without last-hitting, but this risks missing other last-hit opportunities

### Combat System

- **Grid Layout**: 8x10 grid (8 lanes, 10 cells per lane)
- **Lane Structure**: 
  - Player minions spawn at top, move downward
  - Enemy minions spawn at bottom, move upward
  - Minions cannot move between lanes
- **Movement Speed**: 1 grid cell per second (all minion types)
- **Combat Behavior**:
  - Minions move toward each other and attack with predictable timings
  - When minions meet, they stop and fight
  - If a minion is blocked by a friendly minion with no enemies in range, it waits
  - Minions cannot move through each other

### Minion Types

All minion types (player and enemy) share the same stats:

#### Melee
- **Health**: 100 HP
- **Damage**: 20
- **Range**: 1 (Manhattan distance)
- **Attack Interval**: 0.8 seconds
- **Spawn Cost**: 10 points
- **Last-Hit Reward**: 15 points

#### Caster
- **Health**: 80 HP
- **Damage**: 25
- **Range**: 4 (Manhattan distance)
- **Attack Interval**: 0.7 seconds
- **Spawn Cost**: 10 points
- **Last-Hit Reward**: 10 points

#### Tank
- **Health**: 150 HP
- **Damage**: 15
- **Range**: 3 (Manhattan distance)
- **Attack Interval**: 1.0 seconds
- **Spawn Cost**: 25 points
- **Last-Hit Reward**: 25 points

### Lane End Behavior

- **Enemy Minions Reaching Bottom**: Player takes 1 hit of damage
- **Player Minions Reaching Top**: 
  - Enemies stop spawning in that lane
  - Minion stays at the top position
- **Level End Condition**: Level ends if player takes 3 hits

---

## Level Structure

### Level Progression

- **Total Levels**: 20
- **Pattern**: 4 regular combat levels → 1 boss level (repeated 4 times)
- **Boss Levels**: Levels 5, 10, 15, 20

### Regular Levels

- **Enemy Spawning**: 
  - Different spawn rates per level
  - Spawn frequency increases as game progresses
  - Within each level, spawn intervals are static
- **Starting State**:
  - Player starts with 0 points
  - Pre-placed minions (both player and enemy) provide initial combat
  - Enough starting minions to "hold your own" until player can last-hit for more

### Boss Levels

- **Boss Types**:
  - **Towers**: 
    - Cannot move
    - Much higher health than regular minions
    - 6 range attack
    - Deal ~3x tank minion damage (45 damage)
    - Pre-spawned at level start
  - **Enemy Bases**:
    - Cannot move
    - Do not attack
    - Guarded by 1-2 towers
    - Accompanied by more enemy minions than usual
    - Pre-spawned at level start
- **Boss Mechanics**: Can be last-hit like regular minions using the same click-and-hold system

---

## Progression & Upgrades

### Upgrade System

Upgrades are purchased between levels using leftover points from the previous level. Upgrade costs scale (starting around 10 points, increasing per purchase).

#### Available Upgrades

1. **Click Hold Time**
   - Starting: 0.8 seconds
   - Reduction: -0.1s per upgrade
   - Effect: Faster last-hit execution

2. **Minion Spawn Cooldown** (per type)
   - Starting cooldowns: Melee = 2s, Caster = 2s, Tank = 5s
   - Reduction: -0.25s per upgrade
   - Effect: Spawn minions more frequently

3. **New Minion Types** (unlockable)
   - Caster minion (unlockable)
   - Tank minion (unlockable)
   - Melee is available from start

4. **Player Attack Damage**
   - Starting: 1/4 of caster minion HP (rounded up) = 20 damage
   - Increase: +10 per upgrade
   - Effect: Higher damage = lower health threshold for last-hitting

### Starting State

- Each level starts with 0 points (regardless of leftover points from previous level)
- Leftover points are used for upgrades between levels
- Starting minions are pre-placed to provide initial combat

---

## User Interface

### In-Game HUD

- **Current Points**: Display of available points
- **Level Number**: Current level indicator
- **Hits Remaining**: Health indicator (starts at 3, decreases when enemies reach bottom)
- **Minion Spawn Buttons**: Up to 3 buttons (one per minion type)
  - Display current cooldown timers
  - Hotkey support for quick spawning
  - When clicked, player selects a lane (lanes highlight on mouseover)

### Main Menu

- **Start Run**: Begin a new game
- **Continue Run**: Resume saved progress (game saves constantly, including mid-level)
- **Settings**: Volume controls
- **Exit**: Quit game

### Upgrade Screen

- Displayed between levels
- Shows available upgrades with costs
- Purchase using leftover points from previous level

### Win/Loss Screens

- **Level Loss**: 
  - Displayed when player takes 3 hits
  - Shows retry tally
  - Options: Retry level or return to main menu
- **Game Win**: 
  - Displayed upon completing all 20 levels
  - Shows total retry count across entire run

---

## Technical Specifications

### Engine & Platform

- **Engine**: Godot
- **Export Targets**: Web and PC (using Godot's built-in export tools)
- **Save System**: Constant saving (including mid-level progress)

### Visual Style

- **Perspective**: Top-down 2D
- **Art Style**: Simple polygon-based shapes
- **Color Scheme**: Simple colors
- **Grid**: 8 lanes × 10 cells

### Controls

- **Mouse**: 
  - Click and hold on enemies to last-hit
  - Click minion spawn buttons
  - Select lanes when spawning minions
- **Keyboard**: 
  - Hotkeys for minion spawn buttons
  - (Additional controls TBD)

---

## Game Balance Notes

### Economy Balance

- **Point Rewards vs. Spawn Costs**:
  - Melee: 15 reward / 10 cost = +5 profit
  - Caster: 10 reward / 10 cost = break even
  - Tank: 25 reward / 25 cost = break even
- **Strategy**: Melee provides profit, while caster and tank are more about tactical positioning

### Difficulty Scaling

- Enemy spawn frequency increases per level
- Boss levels provide significant challenge spikes
- Upgrade system allows players to customize their approach

### Risk/Reward

- Holding click to damage enemies risks missing other last-hit opportunities
- Choosing when to spawn minions vs. saving for upgrades creates strategic decisions
- Last-hitting requires timing and attention to multiple lanes

---

## Implementation Phases

### Phase 1: Core Mechanics
- Grid system and lane structure
- Minion movement and collision
- Basic combat system (attack intervals, damage, health)
- Health bars and visual feedback

### Phase 2: Last-Hit System
- Click-and-hold mechanic
- Circular meter around cursor
- Last-hit detection and point rewards
- Damage visualization on health bars

### Phase 3: Minion Spawning
- Spawn button UI
- Lane selection system
- Cooldown system
- Point economy

### Phase 4: Level System
- Level progression structure
- Enemy spawning system
- Starting minion placement
- Win/loss conditions

### Phase 5: Boss System
- Tower boss implementation
- Enemy base boss implementation
- Boss-specific mechanics

### Phase 6: Progression
- Upgrade system
- Between-level screens
- Save/load system

### Phase 7: Polish
- Main menu
- Settings menu
- Visual effects and feedback
- Audio (volume controls)
- Win/loss screens with retry tracking

---

## Future Considerations

- Additional minion types
- More boss varieties
- Special abilities or power-ups
- Leaderboards or scoring system
- Difficulty modes
- Tutorial system for new players

---

## Design Notes

- The game emphasizes skill in timing and multi-tasking across lanes
- The idle/clicker hybrid creates a unique gameplay loop
- Upgrade choices create meaningful strategic decisions
- The retry system encourages improvement without harsh punishment
- Constant saving ensures players never lose significant progress
