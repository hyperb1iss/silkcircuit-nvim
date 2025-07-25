# Lilac Color Palette

## Primary Colors

### Base Colors

```
Background Primary:    #14111F - Deep purple-black base
Background Secondary:  #292633 - Lighter purple-gray for panels
Foreground Primary:    #eeffff - Bright white-blue text
Foreground Light:      #FBF5F3 - Warm off-white for UI text
```

### Core Syntax Palette

#### Purple Family (Keywords & Control)

```
Primary Purple:   #c792ea - Main keyword color
Deep Purple:      #7e57c2 - Selection backgrounds (with alpha)
Muted Purple:     #697098 - Quote blocks
```

#### Cyan Family (Operators & Properties)

```
Primary Cyan:     #7fdbca - Operators, tags, properties
Bright Cyan:      #6ae9f0 - HTML tag punctuation
Light Cyan:       #57eaf1 - CSS tag references
Teal:             #80CBC4 - CSS properties, markdown code
Blue Cyan:        #78ccf0 - Documentation variables
Cyan Blue:        #5ca7e4 - Regular expressions
```

#### Green Family (Strings & Variables)

```
Lime Green:       #addb67 - Strings, variables, attributes
Light Green:      #d9f5dd - String punctuation
Yellow Green:     #8BD649 - Unimplemented (background)
Bright Green:     #31e1eb - CoffeeScript assignments
```

#### Blue Family (Constants & Types)

```
Sky Blue:         #82AAFF - Constants, function calls, types
Bright Blue:      #82b1ff - Markdown headings
Light Blue:       #8EACE3 - Python special variables
Grayish Blue:     #B2CCD6 - Function calls, namespaces
Deep Blue:        #1d3b53 - Selection background
Blue Gray:        #5f7e97 - Function parameters, comments
```

#### Pink/Red Family (Literals & Errors)

```
Bright Pink:      #ff5874 - Booleans, null, language constants
Hot Pink:         #ff2c83 - Invalid syntax background
Coral:            #F78C6C - Numbers, constants
Red:              #ff6363 - CSS selectors
Light Pink:       #ff869a - Markdown links
Deep Red:         #d3423e - Deprecated, template expressions
Error Red:        #ec5f67 - Illegal syntax, interpolation
Faded Red:        #EF5350 - Deleted lines (with alpha)
```

#### Yellow/Orange Family (Types & Values)

```
Peach:            #ffcb8b - Class names, types
Golden:           #ecc48d - Quoted strings, Ruby classes
Bright Yellow:    #FFEB95 - CSS units, keywords
Light Yellow:     #faf39f - Object properties
Gold:             #FAD430 - CSS IDs
```

#### Gray Family (Comments & UI)

```
Blue Gray:        #637777 - Comments
Light Gray:       #d6deeb - Default text, punctuation
Lighter Gray:     #d7dbe0 - JavaScript variables
Off White:        #e0dec6 - C++ namespaces
Medium Gray:      #5f7e97 - Function parameters
UI Gray:          #32374D - Word highlight
UI Dark Gray:     #2E3250 - Word highlight strong
```

## Specialized Colors

### Diff/Git Colors

```
Changed:          #a2bffc - Modified files
Deleted:          #EF535090 - Deleted content (90 = 56% alpha)
Inserted:         #addb67ff - Added content
```

### Language-Specific Colors

```
Go Gray:          #DDDDDD - Go function calls
Ruby Variable:    #bec5d4 - PHP/SASS variables
Python Param:     #7986E7 - JavaScript parameters
```

## Alpha Values Used

- `5a` (35% opacity) - Inactive selections
- `79` (47% opacity) - Selection highlights
- `90` (56% opacity) - Deleted diff lines
- `ff` (100% opacity) - Explicitly full opacity

## Color Relationships

### Complementary Pairs

- Purple (#c792ea) ↔ Green (#addb67) - Keywords vs Strings
- Cyan (#7fdbca) ↔ Pink (#ff5874) - Properties vs Booleans
- Blue (#82AAFF) ↔ Orange (#ffcb8b) - Constants vs Classes

### Gradient Families

1. **Purple Gradient**: #14111F → #292633 → #7e57c2 → #c792ea
2. **Cyan Gradient**: #5ca7e4 → #7fdbca → #6ae9f0 → #57eaf1
3. **Green Gradient**: #addb67 → #d9f5dd → #faf39f
4. **Blue Gradient**: #1d3b53 → #5f7e97 → #82AAFF → #82b1ff

## Usage Guidelines

### High Priority Elements

Use vibrant colors (#c792ea, #7fdbca, #ff5874) for:

- Keywords and control flow
- Important operators
- Language constants

### Medium Priority Elements

Use medium saturation (#addb67, #82AAFF, #ffcb8b) for:

- Strings and variables
- Function/class names
- Constants

### Low Priority Elements

Use muted colors (#637777, #d6deeb, #5f7e97) for:

- Comments
- Punctuation
- Parameters

### Background Elements

Use dark colors with alpha for:

- Selections
- Highlights
- Overlays
