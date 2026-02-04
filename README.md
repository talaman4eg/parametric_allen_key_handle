# Parametric Allen Key Handle

A customizable 3D printable allen key handle that can hold multiple hex keys in a compact, ergonomic design. The handle features a polygonal shape where each face contains a hex socket for a different key size.

## Features

- **Parametric Design**: Fully customizable key sizes, handle dimensions, and layout
- **Multiple Key Storage**: Store multiple allen keys in a single compact handle
- **Alternating Layout**: Optional alternating key placement for better organization
- **Custom Labels**: Add custom text labels for each key size
- **Tolerance Control**: Adjustable tolerance for perfect fit
- **Ergonomic Design**: Comfortable handle diameter and length

## Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `key_sizes` | array | `[1.5, 6, 2, 5.5, 2.5, 5, 3, 4]` | Array of hex key sizes in mm |
| `key_labels` | array | `[]` | Optional custom labels for each key (uses size if empty) |
| `handle_length` | number | `55` | Total length of the handle in mm |
| `handle_diameter` | number | `25` | Diameter of the handle in mm |
| `tolerance` | number | `0.5` | Additional clearance for hex keys in mm |
| `slot_depth` | number | `32` | Depth of the hex key slots in mm |
| `text_size` | number | `4.5` | Size of the text labels |
| `alternate` | boolean | `true` | Whether to alternate key placement on opposite sides |

## Examples

### Basic Usage (Default Configuration)

```scad
alen_key_handle();
```

This creates a handle with the default metric sizes: 1.5, 2, 2.5, 3, 4, 5, 5.5, and 6mm keys with alternating layout.

### Custom Metric Sizes with Alternating Layout

```scad
alen_key_handle(
    key_sizes = [1.5, 2, 2.5, 3, 4, 5, 6, 8],
    handle_length = 60,
    handle_diameter = 28,
    alternate = true
);
```

### Non-Alternating Layout with Custom Labels

```scad
alen_key_handle(
    key_sizes = [1.5, 2, 2.5, 3, 4, 5],
    key_labels = ["1.5mm", "2mm", "2.5mm", "3mm", "4mm", "5mm"],
    alternate = false
);
```

### SAE (Imperial) Sizes Example

```scad
// Define inch conversion
inch = 25.4;

// Common SAE allen key sizes
alen_key_handle(
    key_sizes = [
        inch * 1/16,    // 1/16"
        inch * 5/64,    // 5/64"
        inch * 3/32,    // 3/32"
        inch * 7/64,    // 7/64"
        inch * 1/8,     // 1/8"
        inch * 9/64,    // 9/64"
        inch * 5/32,    // 5/32"
        inch * 3/16     // 3/16"
    ],
    key_labels = [
        "1/16\"", 
        "5/64\"", 
        "3/32\"", 
        "7/64\"", 
        "1/8\"", 
        "9/64\"", 
        "5/32\"", 
        "3/16\""
    ],
    handle_length = 60,
    handle_diameter = 30,
    alternate = true
);
```

### Large SAE Sizes with Custom Handle

```scad
inch = 25.4;

alen_key_handle(
    key_sizes = [
        inch * 1/4,     // 1/4"
        inch * 5/16,    // 5/16"
        inch * 3/8,     // 3/8"
        inch * 7/16,    // 7/16"
        inch * 1/2      // 1/2"
    ],
    key_labels = ["1/4\"", "5/16\"", "3/8\"", "7/16\"", "1/2\""],
    handle_length = 70,
    handle_diameter = 35,
    tolerance = 0.3,
    alternate = false
);
```

## Design Notes

### Alternating Layout
When `alternate = true`, keys are placed on alternating sides of the handle:
- Odd-indexed keys (1st, 3rd, 5th...) go on one side
- Even-indexed keys (2nd, 4th, 6th...) go on the opposite side
- This prevents interference between adjacent keys and improves usability

### Tolerance
The tolerance parameter adds extra clearance around each hex socket. You may need to adjust this based on:
- Your printer's accuracy
- Filament shrinkage
- Desired fit (snug vs. loose)

### Handle Geometry
- The handle becomes a polygon with as many faces as there are keys
- Each face contains one hex socket
- Face width is determined by the handle diameter and number of keys

## Print Settings

### Recommended Settings
- **Layer Height**: 0.2-0.3mm
- **Infill**: 15-25%
- **Supports**: None required
- **Orientation**: Print standing up (along Z-axis)

### Post-Processing
- Clean out hex sockets with a drill bit if needed
- Test fit keys before removing support material completely

## Customization Tips

1. **Key Selection**: Choose keys you actually use frequently
2. **Handle Size**: Larger handles are more comfortable but take up more space
3. **Label Clarity**: Keep labels short for better readability at small text sizes
4. **Tolerance Testing**: Print a small test piece first to verify key fit

## License

This design is released under Creative Commons Attribution 4.0 International License.

## Contributing

Feel free to submit improvements, bug fixes, or additional features via pull requests.