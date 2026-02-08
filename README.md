# Parametric Allen Key Handle

A customizable 3D printable allen key handle that stores multiple hex keys in a compact, ergonomic polygonal design.

## Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `key_sizes` | Array of hex key sizes in mm | `[1.5, 6, 2, 5.5, 2.5, 5, 3, 4]` |
| `center_key_size` | Center key diameter in mm (false to disable) | `false` |
| `key_labels` | Optional custom labels (uses size if empty) | `[]` |
| `length` | Handle length in mm | `65` |
| `diameter` | Handle diameter in mm | `25` |
| `tolerance` | Additional clearance for keys in mm | `0.2` |
| `slot_depth` | Depth of hex key slots in mm | `32` |
| `text_size` | Size of text labels | `4.5` |
| `wall` | Wall thickness around each key slot in mm | `1.2` |
| `key_faces` | Number of faces for hex keys (6 or 12) | `6` |
| `alternate` | Alternate key placement on opposite sides | `false` |

### Tips
- **Key arrangement**: Alternate small and large key sizes for better spacing and ergonomics
- **Empty faces**: Use `0` or `false` as a key size to create empty faces for magnets or custom attachments
- **Key alignment**: Set `key_faces = 12` to align all hex keys in the same orientation
- **Center key**: (EXPERIMENTAL) The `center_key_size` feature creates a center void for additional functionality (requires slicer configuration - split resulting STL to parts, convert center part to 'negative volume' or similar, place as desired)


## Examples

### Basic Usage
```scad
allen_key_handle();
```

### Custom Labels (Non-alternating)
```scad
allen_key_handle(
    key_labels = ["1.5mm", "6mm", "2mm", "5.5mm"],
    alternate = false
);
```

### SAE/Imperial Sizes
```scad
in = 25.4;
allen_key_handle(
    key_sizes = [5/64*in, 3/16*in, 1/32*in, 1/4*in],
    key_labels = ["5/64\"", "3/16\"", "1/32\"", "1/4\""],
    diameter = 27,
    key_faces = 12,
    tolerance = 0.1
);
```

### Advanced Configuration
```scad
allen_key_handle(
    key_sizes = [1.5, 6, 0, 5.5, 2.5, 5, 3, 4], // 0 creates empty face
    key_labels = ["1.5", "6", "MAG", "5.5", "2.5", "5", "3", "4"],
    length = 70,
    diameter = 30,
    alternate = true,
    key_faces = 12
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

