class_name LevelConfig

static var DATA : Array[WaveSetConfig] = [
    WaveSetConfig.new()
        .with_opening_gambit([
            WaveConfig.new()
                .with_offset(1.0)
                .with_lane(3),
                
            WaveConfig.new()
                .with_offset(2.0)
                .with_lane(4),
            WaveConfig.new()
                .with_lane(2)
        ])
        .with_remaining_wave_sets([
            WaveConfig.new()
                .with_offset(1.5)
                .with_lane(0),
            WaveConfig.new()
                .with_offset(1.5)
                .with_lane(1),
            WaveConfig.new()
                .with_offset(1.5)
                .with_lane(2),
            WaveConfig.new()
                .with_offset(1.5)
                .with_lane(3),
            WaveConfig.new()
                .with_offset(1.5)
                .with_lane(4),
            WaveConfig.new()
                .with_offset(1.5)
                .with_lane(5),
            WaveConfig.new()
                .with_offset(1.5)
                .with_lane(6),
        ])
]
