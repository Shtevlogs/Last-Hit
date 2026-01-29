class_name LevelConfig

static var DATA : Array[WaveSetConfig] = [
    WaveSetConfig.new()
        .with_opening_gambit([
            WaveConfig.new()
                .after(1.0)
                .on(3),
            
            WaveConfig.new()
                .after(0.5)
                .at(Vector2i(3, 9))
                .player()
        ])
]
