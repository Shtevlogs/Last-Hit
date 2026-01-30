class_name LevelConfig

static var DATA : Array[WaveSetConfig] = [
    WaveSetConfig.new()
        .with_opening_gambit([
            WaveConfig.new(WarriorMinion)
                .after(1.0)
                .on(3),
            WaveConfig.new(WarriorMinion)
                .on(4),
            WaveConfig.new(WarriorMinion)
                .after(0.5)
                .on(2),
                
            WaveConfig.new(CasterMinion)
                .after(10.5)
                .on(5),
            WaveConfig.new(CasterMinion)
                .after(0.5)
                .on(3),
            WaveConfig.new(CasterMinion)
                .after(0.5)
                .on(2),
            WaveConfig.new(CasterMinion)
                .after(3)
                .on(2),
                
            WaveConfig.new(WarriorMinion)
                .after(10.5)
                .on(0),
            WaveConfig.new(WarriorMinion)
                .on(3),
            WaveConfig.new(WarriorMinion)
                .on(6),
                
            WaveConfig.new(CasterMinion)
                .after(3.0)
                .on(0),
            WaveConfig.new(CasterMinion)
                .on(2),
            WaveConfig.new(CasterMinion)
                .on(4),
            WaveConfig.new(CasterMinion)
                .on(6),
        ])
]
