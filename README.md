# mod-gnomish-army-knife

An [AzerothCore](https://www.azerothcore.org/) (WotLK 3.3.5a) module that gives every
character a Gnomish Army Knife (item 40772), the engineering tool that also works as a
skinning knife, mining pick and blacksmith hammer.

The module is data only. Its `src/` folder holds an empty script loader, which is what
puts the module on the core's module list so the worldserver imports its SQL.

## What it does

- **New characters** get the knife at creation, for every race and class
  (`playercreateinfo_item`).
- **Existing characters** get one by server mail (`mail_server_template`) on their next
  login. The core sends it once per character, to any character with at least one second
  of played time.
- **Every innkeeper** sells the knife for 1 copper, so a character that loses it can buy
  another.
- The knife becomes Bind on Pickup.

A new character's first login has no played time yet, so it gets the mail on its second
login, and ends up with a second knife.

## Requirements

- AzerothCore WotLK (3.3.5a) with the `mail_server_template` tables of the core's
  server mail system.
- No configuration file and no core patches.

## Installation

1. Clone the module into the core's `modules` folder:

   ```sh
   cd <azerothcore>/modules
   git clone https://github.com/dudemcbro/mod-gnomish-army-knife.git
   ```

2. Re-run CMake and rebuild the core, for example with `./acore.sh compiler build`.

3. Restart `worldserver`. It imports `data/sql/world` and `data/sql/characters` on
   startup (with the updater enabled, the default). Each file can run again safely.

## Updating

```sh
cd <azerothcore>/modules/mod-gnomish-army-knife
git pull
```

Then re-run CMake, rebuild and restart `worldserver`.

## Removing the module

Delete its folder, re-run CMake and rebuild. The SQL stays in the databases: knives
already handed out stay, and new characters keep getting one until you remove the
`playercreateinfo_item`, `npc_vendor` and `mail_server_template*` rows for item 40772 and
mail template 90040772.

## Contributing

Bug reports and pull requests are welcome on
[GitHub](https://github.com/dudemcbro/mod-gnomish-army-knife). For larger changes,
please open an issue first, and describe how you tested your change.

## License

GNU Affero General Public License v3.0, see [LICENSE](LICENSE).
