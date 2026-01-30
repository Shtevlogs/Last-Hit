class_name LevelConfig

static var DATA : Array[WaveSetConfig] = [
    WaveSetConfig.new()
        .with_opening_gambit([
            WaveConfig.new(WarriorMinion)
                .after(1.0)
                .on(3),
            WaveConfig.new(CasterMinion)
                .after(0.5)
                .on(5)
        ])
]
