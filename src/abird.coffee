cac = require 'cac'
sjs = require 'shelljs'
fs = require 'fs'
cp = require 'child_process'

setup = ->
  cp.spawn 'docker', [
    'run'
    '-d'
    '--name=abird'
    '--net=host'
    '--cap-add=NET_ADMIN'
    '--restart=always'
    '-v', '~/.abird/bird:/bird'
    'anillc/abird'
  ], { stdio: 'inherit', shell: true }

cli = cac 'abird'

cli.command 'setup'
  .action setup

cli.command 'start'
  .action ->
    sjs.exec 'docker start abird'

cli.command 'stop'
  .action ->
    sjs.exec 'docker stop abird'

cli.command 'rm'
  .action ->
    sjs.exec 'docker stop abird && docker rm abird'

cli.command 'update'
  .action ->
    sjs.exec 'docker stop abird && docker rm abird'
    sjs.exec 'docker pull anillc/abird:latest'
    setup()

cli.command 'c [...cmd]'
  .action (cmd) ->
    cp.spawn 'docker', [
      'exec'
      '-it'
      'abird'
      '/usr/sbin/birdc'
      ...cmd
    ], { stdio: 'inherit' }

alias = 'alias abird="~/.abird/abird"\nalias abirdc="~/.abird/abird c"'

cli.command 'install'
  .action ->
    program = process.argv[0]
    if !fs.existsSync program
      console.log '请使用./abird install进行安装'
      return
    sjs.mkdir '-p', '~/.abird'
    sjs.cp program, '~/.abird/abird'
    sjs.echo alias
      .toEnd '~/.bashrc'
    sjs.echo alias
      .toEnd '~/.zshrc'
    console.log '重启您的shell以生效'

cli.help()
cli.version (require '../package.json').version
cli.parse()
