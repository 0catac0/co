# Co

Co stands for Command Organizer.

You may use co to remember and organize shell commands.

Imagine you have successfully figured out the command to do a firewall scan for MAC address spoofing, say:

    nmap -v -sT -PN --spoof-mac 0 192.168.1.1

Chances are that the next time you want to do a firewall scan, you have forgotten the arguments. If you are lucky you may find the command with a combination of 'grep' and 'history'. 

For these situations you can use co.

After you have executed a command that you might want to reuse later;

    $ co save

This will save the command for reuse. By default co will tag this command with the current directory. 

At a later stage just;

    $ co

And use the arrow keys to cycle the commands that are tagged with the directory that you are currently in. If you wish change some arguments and then press enter to execute the (modified) command.

Besides the automatic pwd tags, you may also define your own tags. And specify a message that helps you remember the exact use for the command. 
For the nmap example you could use:

    $ co @scan @nmap -m "perform firewall scan with random mac"

At a later stage, when you need to do a scan, you can;

    $ co list @scan

And co will print a list of commands that tagged with @scan, with an id and the message you provided:

    3 | nmap -v -sT -PN --spoof-mac 0 192.168.1.1 | perform firewall scan with random mac

To execute the command you can;

    $ co 3

## Installation

 Install co with:

    $ gem install co


IMPORTANT:

You need to include the following export into your bash profile.

    `export PROMPT_COMMAND="history -a;"$PROMPT_COMMAND`

After this bash will sync your history file on every command. 
Without it, co will save the last command of your previous session every time.

## Usage

  $ co save [@tag] [@tag] [-m message]
	Save last command from history to the database.
	Co automatically tags the saved command with @[pwd].
	Tags should start with the @ character to be recognized as such.
	The -m message should be provided within quotes "".

  $ co
	Cycles through commands tagged with [@pwd]. 
	If there are no commands found in the database, the command falls through.

  $ co @tag
	Cycles through commands tagged with @tag
	If there are no commands found in the database, the command falls through.

  $ co list [all] [@tag]
	without optional arguments: lists commands for @[pwd]
	all: lists all commands in the database
	@tag: lists commands for @tag

  $ co id
	execute command identified by id (integer)

$co delete id
	delete command id identified by id
	
## Configuration

By default the database is created as ~/.co/co.db.

Co looks for a .coconfig file.
You may specify a custom location for a database as a key value pair, with 'db' as the key;

  db=/home/0catac0/dropbox/co.db

## Contributing

1. Fork it ( https://github.com/[my-github-username]/co/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
