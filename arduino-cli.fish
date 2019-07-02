set -l s '__fish_seen_subcommand_from'
set -l n 'not __fish_seen_subcommand_from'

function __fish_arduino_cli_devices
    arduino-cli board listall | sed -En '1d; s/ //g; s/(.+)\s+(.+)\:(.+)/\2:\3\t\1/p'
end

# Available Commands
set -l c board compile config core help lib sketch upload version
complete -c arduino-cli -n "$n $c" -f -a board   -d 'Arduino board commands'
complete -c arduino-cli -n "$n $c" -f -a compile -d 'Compiles Arduino sketches'
complete -c arduino-cli -n "$n $c" -f -a config  -d 'Arduino Configuration Commands'
complete -c arduino-cli -n "$n $c" -f -a core    -d 'Arduino Core operations'
complete -c arduino-cli -n "$n $c" -f -a help    -d 'Help about any comman'
complete -c arduino-cli -n "$n $c" -f -a lib     -d 'Arduino commands about libraries'
complete -c arduino-cli -n "$n $c" -f -a sketch  -d 'Arduino CLI Sketch Commands'
complete -c arduino-cli -n "$n $c"    -a upload  -d 'Upload Arduino sketches'
complete -c arduino-cli -n "$n $c" -f -a version -d 'Shows version number of arduino CLI'

# Flags
complete -c arduino-cli      -l config-file           -r    -d 'The custom config file (if not specified the default will be used)'
complete -c arduino-cli      -l debug                    -f -d 'Enables debug output (super verbose, used to debug the CLI)'
complete -c arduino-cli      -l format -a 'text json' -r -f -d 'The output format, can be [text|json]. (default "text")'
complete -c arduino-cli -s h -l help                     -f -d 'help for arduino-cli'

# Core
set -l c download install list search uninstall update-index upgrade
complete -c arduino-cli -n "$s core && $n $c" -a download     -f -d 'Downloads one or more cores and corresponding tool dependencies'
complete -c arduino-cli -n "$s core && $n $c" -a install      -f -d 'Installs one or more cores and corresponding tool dependencies'
complete -c arduino-cli -n "$s core && $n $c" -a list         -f -d 'Shows the list of installed platforms'
complete -c arduino-cli -n "$s core && $n $c" -a search       -f -d 'Search for a core in the package index'
complete -c arduino-cli -n "$s core && $n $c" -a uninstall    -f -d 'Uninstalls one or more cores and corresponding tool dependencies if no more used'
complete -c arduino-cli -n "$s core && $n $c" -a update-index -f -d 'Updates the index of cores'
complete -c arduino-cli -n "$s core && $n $c" -a upgrade      -f -d 'Upgrades one or all installed platforms to the latest version'

# Board
set -l c attach details list listall
complete -c arduino-cli -n "$s board && $n $c" -a attach  -f -d 'Attaches a sketch to a board'
complete -c arduino-cli -n "$s board && $n $c" -a details -f -d 'Print details about a board'
complete -c arduino-cli -n "$s board && $n $c" -a list    -f -d 'List connected boards'
complete -c arduino-cli -n "$s board && $n $c" -a listall -f -d 'List all known boards and their corresponding FQBN'

# Compile
complete -c arduino-cli -n "$s compile"      -l build-cache-path                       -r    -d 'Builds of \'core.a\' are saved into this path to be cached and reused'
complete -c arduino-cli -n "$s compile"      -l build-path                             -r    -d 'Path where to save compiled files. If omitted, a directory will be created in the default temporary path of your OS'
complete -c arduino-cli -n "$s compile"      -l build-properties                       -r -f -d 'List of custom build properties separated by commas. Or can be used multiple times for multiple properties'
complete -c arduino-cli -n "$s compile" -s b -l fqbn -a '(__fish_arduino_cli_devices)' -r -f -d 'Fully Qualified Board Name, e.g.: arduino:avr:uno'
complete -c arduino-cli -n "$s compile" -s h -l help                                      -f -d 'help for compile'
complete -c arduino-cli -n "$s compile" -s o -l output                                 -r    -d 'Filename of the compile output'
complete -c arduino-cli -n "$s compile"      -l preprocess                                -f -d 'Print preprocessed code to stdout instead of compiling'
complete -c arduino-cli -n "$s compile"      -l quiet                                     -f -d 'Optional, supresses almost every output'
complete -c arduino-cli -n "$s compile"      -l show-properties                           -f -d 'Show all build properties used instead of compiling'
complete -c arduino-cli -n "$s compile" -s v -l verbose                                   -f -d 'Optional, turns on verbose mode'
complete -c arduino-cli -n "$s compile"      -l vid-pid                                -r -f -d 'When specified, VID/PID specific build properties are used, if boards supports them'
complete -c arduino-cli -n "$s compile"      -l warnings -a 'none default more all'    -r -f -d 'Optional, can be "none", "default", "more" and "all". Defaults to "none". Used to tell gcc which warning level to use (-W flag). (default "none")'

# Config
set -l c dump init
complete -c arduino-cli -n "$s config && $n $c" -a dump -f -d 'Prints the current configuratio'
complete -c arduino-cli -n "$s config && $n $c" -a init -f -d 'Initializes a new config file into the default location'

# Lib
set -l c download install list search uninstall update-index upgrade
complete -c arduino-cli -n "$s lib && $n $c" -a download     -f -d 'Downloads one or more libraries without installing them'
complete -c arduino-cli -n "$s lib && $n $c" -a install      -f -d 'Installs one of more specified libraries into the system'
complete -c arduino-cli -n "$s lib && $n $c" -a list         -f -d 'Shows a list of all installed libraries'
complete -c arduino-cli -n "$s lib && $n $c" -a search       -f -d 'Searchs for one or more libraries data'
complete -c arduino-cli -n "$s lib && $n $c" -a uninstall    -f -d 'Uninstalls one or more libraries'
complete -c arduino-cli -n "$s lib && $n $c" -a update-index -f -d 'Updates the libraries index'
complete -c arduino-cli -n "$s lib && $n $c" -a upgrade      -f -d 'Upgrades installed libraries'

# Sketch
complete -c arduino-cli -n "$s sketch" -a new -d 'Create a new Sketch'

# Upload
complete -c arduino-cli -n "$s upload" -s b -l fqbn  -a '(__fish_arduino_cli_devices)' -r -f -d 'Fully Qualified Board Name, e.g.: arduino:avr:uno'
complete -c arduino-cli -n "$s upload" -s h -l help                                       -f -d 'help for upload'
complete -c arduino-cli -n "$s upload" -s i -l input                                   -r    -d 'Input file to be uploaded'
complete -c arduino-cli -n "$s upload" -s p -l port                                    -r    -d 'Upload port, e.g.: COM10 or /dev/ttyACM0'
complete -c arduino-cli -n "$s upload" -s v -l verbose                                    -f -d 'Optional, turns on verbose mode'
complete -c arduino-cli -n "$s upload" -s t -l verify                                     -f -d 'Verify uploaded binary after the upload'
