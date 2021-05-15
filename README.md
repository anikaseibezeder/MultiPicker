# MultiPicker

![build](https://img.shields.io/github/workflow/status/anikaseibezeder/MultiPicker/build)
![release](https://img.shields.io/github/v/release/anikaseibezeder/MultiPicker)
![license](https://img.shields.io/github/license/anikaseibezeder/MultiPicker)

**MultiPicker** helps you create Pickers which allow multiple selection in your `SwiftUI` apps.

<p align="center">
    <img src="Resources/Demo.gif" width=300 />
</p>

## Installation

### Swift Package Manager

```
https://github.com/anikaseibezeder/MultiPicker.git
```

## Usage

1. Add a `Set`, which will later on hold the selected values.

```swift
@State private var selection = Set<String>()
```

2. Add the `MultiPicker` to your view by providing a `title`, the `selection` Set, an array containing the available `options` 
   and what you want to use as the label of those options.

```swift
private let options = ["Option 1", "Option 2"]

MultiPicker("Options",
            selection: $selection,
            options: options) { $0 }
```

## Styling

### DefaultMultiPickerStyle

> Displays the options similar as the default `Picker`.

#### Properties

* `allowsMultipleSelection` - define if the Picker should allow multiple selection

#### Apply by adding

```swift
.multiPickerStyle(DefaultMultiPickerStyle(allowsMultipleSelection: true))
```


### GridPickerStyle

> Displays the options in a grid.

#### Properties

* `columns` - define how many columns should be used to display the options
* `allowsMultipleSelection` - define if the Picker should allow multiple selection

#### Apply by adding

```swift
.multiPickerStyle(GridPickerStyle(columns: 5, 
                                  allowsMultipleSelection: true))
```

## Demo

For more information on how to use **MultiPicker**, see the attached `Demo` project.
Just open it and run the app.

## Acknowledgements

Some parts of this package are based on [this blog post](https://dev.to/jeehut/multi-selector-in-swiftui-5heg) by [Jeehut](https://github.com/Jeehut). 
Thanks for providing a really simple explanation on how to create a Multi Selector in `SwiftUI`. 

## License

**MultiPicker** is available under the MIT license. 
See the [LICENSE](https://github.com/anikaseibezeder/MultiPicker/blob/main/LICENSE) file for more information.