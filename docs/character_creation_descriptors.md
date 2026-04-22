# Character Creation Descriptor Inventory

This inventory is taken from `code/modules/client/descriptors/descriptor_choice.dm` and the species `descriptor_choices` lists under `code/modules/mob/living/carbon/human/species.dm` and `code/modules/mob/living/carbon/human/species_types/`.

`code/datums/mob_descriptors/descriptors/other.dm` also defines `age` and anatomy descriptors, but no current `descriptor_choice` points at them, so they are not part of the character-creation picker.

## Core Categories

### `trait` - Physical Descriptor
- `Moderate`, `Mundane`, `Middling`, `Tall`, `Short`, `Dainty`, `Towering`, `Giant`, `Tiny`
- `Stout`, `Cadaverous`, `Lanky`, `Wide`, `Thin`, `Zardish`, `Lupian`, `Venardic`, `Feline`, `Elven`, `Rousley`
- `Blessed`, `Accursed`, `Aquatic`, `Horned`, `Snoutly`, `Tailed`, `Fanged`, `Tusked`, `Clawed`, `Furred`, `Feathered`, `Scaly`, `Crimson`, `Cerulean`, `Emerald`, `Amber`
- `Disfigured`, `Loutish`, `Limping`, `Foreign`, `Soggy`, `Rotten`
- `Viscous`, `Oozing`, `Slimy`, `Squishy`, `Squelching`, `Engorged`, `Bloated`, `Gluttonous`, `Overfed`, `Feral`, `Radiant`, `Bountiful`, `Trembling`
- `Magnificent`, `Esteemed`, `Regal`, `Decadent`, `Lavish`, `Pompous`, `Dashing`, `Gravid`, `Fecund`

### `stature` - Stature
- `Man/Woman`, `Gentleman/Gentlewoman`, `Patriarch/Matriarch`, `Hag/Codger`, `Villain/Villainess`, `Thug`, `Knave`, `Wench`, `Snob`, `Slob`, `Brute`, `Highbrow`, `Scholar`
- `Rogue`, `Hermit`, `Pushover`, `Beguiler`, `Fiend`, `Adventurer`, `Valiant`, `Plump figure`, `Daredevil`, `Stoic`, `Stooge`, `Fool`, `Bookworm`, `Lowlife`
- `Dignitary`, `Degenerate`, `Zealot`, `Churl`, `Archon`, `Vizier`, `Blaggard`, `Creep`, `Freek`, `Weerdoe`, `Socialite`, `Recluse`, `Soldier`, `Pupil`, `Samaritan`, `Hustler`, `Wanderer`, `Savant`, `Shitheel`, `Critter`, `Creacher`, `Cur`, `Wretch`, `Dullard`, `Basterd`
- `Harlot`, `Strumpet`, `Hussy`, `Slattern`, `Nymph`, `Gourmand`, `Sovereign`, `Brawler`, `Amazon`, `Titan`, `Savage`, `Beast`, `Drifter`, `Fanatic`, `Maniac`, `Brat`, `Provocateur`, `Scavenger`, `Pariah`, `Fugitive`, `Cutpurse`, `Anarchist`, `Warlord`
- `Drunkard`, `Moron`, `Simpleton`, `Bitch`, `Numbskull`, `Gambler`, `Plaything`, `Chewtoy`, `Bait`, `Reprobate`, `Spendthrift`, `Gutter-Rat`, `Liability`

### `height` - Height
- `Moderate`, `Middling`, `Tall`, `Short`, `Towering`, `Giant`, `Tiny`

### `body` - Body
- `Average`, `Athletic`, `Muscular`, `Herculean`, `Plump`, `Pear-shaped`, `Pudgy`, `Strong-fat`, `Round`, `Heavy`, `Top Heavy`, `Bottom Heavy`
- `Curvy`, `Voluptuous`, `Decrepit`, `Thin`, `Bulky`, `Slender`, `Lissome`, `Lanky`, `Twiggy`, `Dainty`, `Petite`, `Gaunt`, `Lean`, `Skeletal`, `Broad-shouldered`, `Wasp-waisted`, `Burly`

### `face` - Face
- `Unremarkable`, `Smooth`, `Rough`, `Chiseled`, `Scarred`, `Angular`, `Gaunt`, `Round`, `Delicate`, `Soft`, `Sharp`, `Sleek`, `Broad`, `Disfigured`, `Tall`, `Chubby`, `Mousy`, `Full`

### `face_exp` - Resting Expression
- `Refined`, `Disinterested`, `Sour`, `Bright`, `Starry-eyed`, `Cold`, `Haggard`, `Fake`, `Bitchy`, `Spiteful`, `Warm`, `Salacious`, `Contemptous`, `Mocking`, `Knowing`, `Cocky`, `Coy`, `Frustrated`, `Stern`, `Genuine`, `Jaded`, `Inquisitive`, `Suspicious`, `Tender`, `Affectionate`, `Calm`, `Cutthroat`, `Suave`, `Humble`, `Smug`

### `skin` - Skin
- `Normal Skin`, `Hairy Skin`, `Soft Skin`, `Rugged Skin`, `Diseased Skin`, `Dry Skin`, `Fine Skin`, `Wrinkled Skin`, `Sunkissed Skin`, `Aged Skin`, `Pockmarked Skin`, `Dusky Skin`, `Irritated Skin`, `Ashen Skin`

### `voice` - Voice
- `Ordinary`, `Monotone`, `Deep`, `Soft`, `Shrill`, `Sleepy`, `Commanding`, `Kind`, `Growly`, `Androgynous`, `Nasal`, `Refined`, `Cheery`, `Dispassionate`, `Gravelly`, `Whiny`, `Melodic`, `Drawling`, `Stilted`, `Grave`, `Doting`, `Booming`, `Lisping`, `Honeyed`, `Facetious`, `Snide`, `Smoker's`, `Venomous`

### `prominent_one` / `prominent_two` / `prominent_three` / `prominent_four` - Prominent
- General and behavior: `Hunched Over`, `Crooked Nose`, `Drooling`, `Lazy Eye`, `Bloodshot Eyes`, `Baggy Eyes`, `Dead Fish Eyes`, `Twitchy`, `Clumsy`, `Unkempt`, `Tidy`, `Eloquent`, `Thick Tail`, `Cleft Lip`, `Physically Deformed`, `Extensive Scarring`, `Moves Strangely`, `Ghoulish Appearance`
- Body-shape and presence: `Prominent Chest`, `Prominent Posterior`, `Prominent Potbelly`, `Prominent Thighs`, `Prominent Shoulders`, `Prominent Jawline`, `Prominent Ears`, `Cold Gaze`, `Piercing Gaze`, `Innocent Gaze`, `Sensual Manners`, `Intimidating Presence`, `Meek Presence`, `Adorable Presence`, `Lordly Presence`, `Doting Presence`, `Aristocratic Haughtiness`, `Ghastly Pale`
- Looks and markings: `Elaborate Tattoos`, `Ritual Tattoos`, `Tribal Tattoos`, `Slave Tattoos`, `Enigmatic Tattoos`, `Mean Look`, `Haughty Atmosphere`, `Untrustworthy`, `Ratty Hair`, `Predatory Look`, `Chaste Mannerisms`, `Air of Whimsy`, `Dim Look`
- `Prominent #3` and `Prominent #4` also allow `None`

### `scales` - Scales
- `Plain Scales`, `Rough Scales`, `Smooth Scales`, `Plated Scales`, `Peeling Scales`

### `fur` - Fur
- `Plain Fur`, `Short Fur`, `Coarse Fur`, `Bristly Fur`, `Fluffy Fur`, `Shaggy Fur`, `Silky Fur`, `Lank Fur`, `Mangy Fur`, `Velvety Fur`, `Dense Fur`, `Matted Fur`

### `chitin` - Chitin
- `Smooth Chitin`, `Hard Chitin`, `Fine Chitin`

### `feathers` - Feathers
- `Fine Feathers`, `Stiff Feathers`, `Frayed Feathers`, `Delicate Feathers`, `Soft Feathers`
- No species currently exposes this as a standalone picker; it only appears inside `skin_all`.

### `skin_all` - Skin/Fur/Scales
- Combined pool of the `skin`, `scales`, `fur`, and `feathers` lists above.

### `prominent_one_wild` / `prominent_two_wild` / `prominent_three_wild` / `prominent_four_wild` - Prominent (Wild)
- Standard prominent pool above, plus wildkin additions: `Canine Features`, `Feline Features`, `Hyaenidae Features`, `Equine Features`, `Bovine Features`, `Cervine Features`, `Lapine Features`, `Rodent Features`, `Primate Features`, `Marsupial Features`, `Lizard Features`, `Avian Features`, `Amphibian Features`, `Instectoid Features`, `Marine Features`, `Vulpine Features`
- `Prominent #3` and `Prominent #4` also allow `None`

## Species Exposure

- `Base species` / default `/datum/species` list: `trait`, `stature`, `height`, `body`, `face`, `face_exp`, `skin`, `voice`, `prominent_one`, `prominent_two`, `prominent_three`, `prominent_four`
- `akula`, `dracon`, `kobold`, `lizardfolk`: same as base, but `skin` is replaced with `scales`
- `lupian`, `tabaxi`, `vulpkanin`: same as base, but `skin` is replaced with `fur`
- `moth`: same as base, but `skin` is replaced with `chitin`
- `demihuman`: same as base, but uses the wild prominent pool
- `anthromorph`, `anthromorphsmall`, `dullahan`, `goblinp`: same as base, but `skin` is replaced with `skin_all` and the wild prominent pool is used

## Free-Form Slots

- `Custom #1`
- `Custom #2`

## Behavior Notes

- `Predatory Look` is just a prominent descriptor entry; it does not have a special mechanic attached to it.
- The `Feral` trait descriptor is also just a picker entry; the examine line `Something about them seems... predatory.` comes from the separate `TRAIT_FERAL` check in `code/modules/mob/living/carbon/human/examine.dm`, not from either descriptor.
- The main non-flavor hooks are `trait` and `stature` for obscured-name generation, `voice` for alternate speaking names, and a few prominent descriptors with conditional logic like `Thick Tail`, `Custom #1`, and `Custom #2`.
