class_name LevelConfig

static var DATA : Array[WaveSetConfig] = [
    WaveSetConfig.new()
        .with_opening_gambit([
            WaveConfig.new(WarriorMinion)
                .after(1.0)
                .on(3),
                
            WaveConfig.new(WarriorMinion)
                .after(4.0)
                .on(3),
        ])
        .with_remaining_wave_sets([
            WaveConfig.new(WarriorMinion)
                .after(10.0)
                .on(0),
            WaveConfig.new(WarriorMinion)
                .on(1),
                
            WaveConfig.new(WarriorMinion)
                .after(9.5)
                .on(5),
            WaveConfig.new(WarriorMinion)
                .after(1.5)
                .on(6),
                
            WaveConfig.new(WarriorMinion)
                .after(8.0)
                .on(3),
                
            WaveConfig.new(WarriorMinion)
                .after(8.5)
                .on(0),
            WaveConfig.new(WarriorMinion)
                .on(6),
        ]),
    WaveSetConfig.new()
        .with_opening_gambit([
            WaveConfig.new(CasterMinion)
                .after(1.0)
                .on(2),
            
            WaveConfig.new(WarriorMinion)
                .after(3.0)
                .on(4),
            WaveConfig.new(CasterMinion)
                .after(0.5)
                .on(4),
        ])
        .with_remaining_wave_sets([
            WaveConfig.new(CasterMinion)
                .after(10.0)
                .on(2),
            WaveConfig.new(WarriorMinion)
                .after(0.5)
                .on(2),

            WaveConfig.new(WarriorMinion)
                .after(9.5)
                .on(5),
            WaveConfig.new(WarriorMinion)
                .after(1.5)
                .on(6),

            WaveConfig.new(WarriorMinion)
                .after(8.0)
                .on(4),
            WaveConfig.new(CasterMinion)
                .after(0.5)
                .on(4),

            WaveConfig.new(WarriorMinion)
                .after(9.5)
                .on(3),
            WaveConfig.new(CasterMinion)
                .after(0.5)
                .on(4),
            WaveConfig.new(CasterMinion)
                .on(2),
        ]),
    WaveSetConfig.new()
        .with_opening_gambit([
            WaveConfig.new(WarriorMinion)
                .after(1.0)
                .on(2),

            WaveConfig.new(WarriorMinion)
                .after(0.5)
                .on(4),

            WaveConfig.new(TankMinion)
                .after(4)
                .on(4),
        ])
        .with_remaining_wave_sets([
            WaveConfig.new(WarriorMinion)
                .after(10.0)
                .on(3),
            WaveConfig.new(WarriorMinion)
                .on(2),
            WaveConfig.new(CasterMinion)
                .after(0.5)
                .on(2),

            WaveConfig.new(CasterMinion)
                .after(9.5)
                .on(5),
            WaveConfig.new(WarriorMinion)
                .after(1.5)
                .on(6),

            WaveConfig.new(WarriorMinion)
                .after(8.0)
                .on(3),
            WaveConfig.new(WarriorMinion)
                .after(0.5)
                .on(3),

            WaveConfig.new(TankMinion)
                .after(8.5)
                .on(5),
            WaveConfig.new(CasterMinion)
                .on(6),
            WaveConfig.new(CasterMinion)
                .on(4),
            
            
            WaveConfig.new(WarriorMinion)
                .after(1.5)
                .on(0),
            WaveConfig.new(WarriorMinion)
                .after(0.5)
                .on(1),
            WaveConfig.new(CasterMinion)
                .after(1.5)
                .on(0),
        ])
]
