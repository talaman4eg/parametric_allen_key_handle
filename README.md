# Parametric Allen Key Handle

A customizable 3D printable allen key handle that stores multiple hex keys in a compact, ergonomic polygonal design.

## Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `key_sizes` | Array of hex key sizes in mm | `[1.5, 6, 2, 5.5, 2.5, 5, 3, 4]` |
| `key_labels` | Optional custom labels (uses size if empty) | `[]` |
| `handle_length` | Handle length in mm | `55` |
| `handle_diameter` | Handle diameter in mm | `25` |
| `tolerance` | Additional clearance for keys in mm | `0.5` |
| `alternate` | Alternate key placement on opposite sides | `true` |

**Tip**: Alternate small and large key sizes in the list for better spacing and ergonomics.

## Examples

### Basic Usage
```scad
alen_key_handle();
```

### Custom Labels (Non-alternating)
```scad
alen_key_handle(
    key_labels = ["1.5mm", "6mm", "2mm", "5.5mm"],
    alternate = false
);
```

### SAE Sizes
```scad
inch = 25.4;
alen_key_handle(
    key_sizes = [inch*1/16, inch*1/4, inch*3/32, inch*3/16],
    key_labels = ["1/16\"", "1/4\"", "3/32\"", "3/16\""]
);
```

## Print Settings
- Layer Height: 0.2-0.3mm
- Infill: 15-25% 
- Supports: None required
- Orientation: Print standing up

## License

This design is released under [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/). 

You are free to share, adapt, and use this design for any purpose, including commercially, as long as you provide appropriate attribution.

