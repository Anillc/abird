cac = require 'cac'
cp = require 'child_process'

cli = cac 'abird'

cli.command 'setup'
  .action ->
    cp.spawn 'docker', [
      'run'
      '-d'
      '--name=abird'
      '--net=host'
      '--cap-add=NET_ADMIN'
      '--restart=always'
      '-v', '~/.abird/bird:/bird'
      'ghcr.io/Anillc/abird:latest'
    ], { stdio: 'inherit' }

cli.command 'start'
  .action ->
    cp.spawn 'docker', ['start', 'abird'], { stdio: 'inherit' }

cli.command 'stop'
  .action ->
    cp.spawn 'docker', ['stop', 'abird'], { stdio: 'inherit' }

cli.command 'c <...cmd>'
  .action (cmd) ->
    cp.spawn 'docker', [
      'exec'
      '-it'
      'abird'
      '/bin/bash'
    ], { stdio: 'inherit' }

cli.command 'install'
  .action ->

cli.help()
cli.version (require '../package.json').version

cli.parse()
