# wttrbar-cr

CLI tool for generating weather info for waybar using wttr.in - Crystal port of the original [wttrbar](https://github.com/bjesus/wttrbar)

## Installation

- Install crystal and shards
- Clone the repo
- cd in to the repo directory
- Build the binary with `shards build`
- cp the binary located in `bin` folder somewhere like ~/.local/bin

## Usage

```
Usage: wttrbar [options]
    --indicator=INDICATOR            Set the main weather indicator (default: temp_C or temp_F based on --fahrenheit flag)
    --location=LOCATION              Specify the location for weather data
    --vertical-view                  Use vertical view mode
    --ampm                           Use 12-hour format with AM/PM
    --nerd                           Use nerd icons for weather symbols
    --fahrenheit                     Use Fahrenheit for temperature
    --mph                            Use miles per hour for wind speed
    --lang=LANG                      Set the language for output (default: en)
    -h, --help                       Show this help message
```

## Contributing

1. Fork it (<https://github.com/your-github-user/wttrbar-cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
