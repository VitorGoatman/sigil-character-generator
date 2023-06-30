import math, jsony, strformat
include questions

type
  Trait* = tuple
    name, desc: string
  Contact* = tuple
    name: string
    aptitude, influence: Skill
    usefulness: string
  Character* = object
    name*: string
    age*: int
    sex*: string
    handedness*: string
    wealth*: int
    mindSk*: array[10, Skill]
    physSk*: array[10, Skill]
    perks*, quirks*: seq[Trait]
    contacts*: seq[Contact]

var player*: Character

player.age = age
player.sex = sex()
if player.sex == "Male":
  player.name = getName().male&" "&getName().surname
else:
  player.name = getName().female&" "&getName().surname
player.handedness = handedness()

player.mindSk = [
  broadCraft, deceive, diplomacy, fineCraft, intimidate,
  intuition, investigate, logic, luck, will
]
player.physSk = [
  athletics, burglary, constitution, drive, fight,
  perception, might, shoot, stealth, throw
]

var pRust*, mRust*: int
let rust: int = floorDiv(age, 10)
case rust
of 4: pRust = rust
of 5: pRust = rust+4
of 6:
  pRust = rust+5+4
  mRust = rust
of 7:
  pRust = rust+6+5+4
  mRust = rust+6
else: discard

for i in 0..9:
  player.physSk[i].value -= pRust
  player.mindSk[i].value -= mRust

oracleTable usefulness:
  01..10: "Equipment merchant"
  11..20: "Information"
  21..30: "Equipment repairs"
  31..40: "Medical aids"
  41..50: "Black market goods"
  51..60: "Getting jobs"
  61..70: "Money loans"
  71..80: "Transportation"
  81..90: "Recruiting mercenaries"
  91..100: "Help with law enforcement"

var contactpts: int
contactpts += floorDiv(player.mindSk[1].value, 10)
contactpts += floorDiv(player.mindSk[2].value, 10)
contactpts += floorDiv(player.mindSk[4].value, 10)

while contactpts > 0:
  var pool = rand 1..contactpts
  contactpts -= pool
  let inf = (rand 0..pool)
  pool -= inf
  let apt = pool
  player.contacts.add (
    [getName().male, getname().female].sample&" "&getName().surname,
    ("Aptitude", 30+(inf*5)), ("Influence", 30+(apt*5)), usefulness())

var md = &"""
Sigil 1.7 Character Sheet - Generated at [GITHUB PAGES URL HERE]

Player:
Character Name: {player.name}
Age: {age}  Sex: {player.sex}  Handedness: {player.handedness}

 ______________________________________  __________________________
/                SKILLS                \/       SPECIALTIES        \
|-------------------+------------------||--------------------------|
|     Physical      |       Mental     ||                      |   |
|-------------------+------------------||                      |   |
| Athletics    | {player.physSk[0].value} | Broad-Craft | {player.mindSk[0].value} ||                      |   |
| Burglary     | {player.physSk[1].value} | Deceive     | {player.mindSk[1].value} ||                      |   |
| Constitution | {player.physSk[2].value} | Diplomacy   | {player.mindSk[2].value} ||                      |   |
| Drive        | {player.physSk[3].value} | Fine-Craft  | {player.mindSk[3].value} ||                      |   |
| Fight        | {player.physSk[4].value} | Intimidate  | {player.mindSk[4].value} ||                      |   |
| Perception   | {player.physSk[5].value} | Intuition   | {player.mindSk[5].value} ||                      |   |
| Might        | {player.physSk[6].value} | Investigate | {player.mindSk[6].value} ||                      |   |
| Shoot        | {player.physSk[7].value} | Logic       | {player.mindSk[7].value} ||                      |   |
| Stealth      | {player.physSk[8].value} | Luck        | {player.mindSk[8].value} ||                      |   |
\ Throw        | {player.physSk[9].value} | Will        | {player.mindSk[9].value} /\                      |   /
 ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨  ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨
"""
var
  bonusMeatWound* = floorDiv(player.physSk[2].value, 10)-3
  bonusSociWound* = floorDiv(player.mindSk[5].value, 10)-3
  bonusMindWound* = floorDiv(player.mindSk[9].value, 10)-3
  meattxt: string

if bonusMeatWound <= 0: discard
else:
  for bonus in 1..bonusMeatWound:
    meattxt.add "|"
    for i in 1..bonus:
      meattxt.add "[ ]|"

md.add &"""
 ___________   ___________   ___________ 
| HEAD      \ | TORSO     \ | L. ARM    \
|-----------| |-----------| |-----------|
| M | S | G | | M | S | G | | M | S | G |
|[ ]|[ ]|[ ]| |[ ]|[ ]|[ ]| |[ ]|[ ]|[ ]|
{meattxt}         {meattxt}         {meattxt}
 ___________   ___________   ___________
| L. LEG    \ | R. LEG    \ | R. ARM    \
|-----------| |-----------| |-----------|
| M | S | G | | M | S | G | | M | S | G |
|[ ]|[ ]|[ ]| |[ ]|[ ]|[ ]| |[ ]|[ ]|[ ]|
{meattxt}         {meattxt}         {meattxt}
 ___________
| SOCIAL    \   M(inor) Wound
|-----------|     
| M | S | G |   S(ignificat) Wound
|[ ]|[ ]|[ ]|   
|[ ]|[ ]|[ ]|   G(rievous) Wound
|[ ]|[ ]|[ ]|   
"""

if bonusSociWound <= 0: discard
else:
  for bonus in 1..bonusSociWound:
    md.add "|[ ]|[ ]|[ ]|\n"

md.add """
 ___________
| MENTAL    \
|-----------|
| M | S | G |
|[ ]|[ ]|[ ]|
|[ ]|[ ]|[ ]|
|[ ]|[ ]|[ ]|
"""

if bonusMindWound <= 0: discard
else:
  for bonus in 1..bonusMindWound:
    md.add "|[ ]|[ ]|[ ]|\n"

player.wealth = 30+roll(2, 10)

md.add &"""

  ___________         _____________
 / EQUIPMENT \_______/ WEALTH | {player.wealth} \
|----------------------------------|
|                                  |
|                                  |
|                                  |
|                                  |
|                                  |
|                                  |
|                                  |
|                                  |
|                                  |
 ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨

# Contacts

"""

for c in player.contacts:
  md.add &"  - {c.name}, {c.usefulness}\n"
  md.add &"    - Aptitude: {c.aptitude.value}\n"
  md.add &"    - Influence: {c.influence.value}\n"

md.add """

# Backstory

"""

for qa in qna:
  md.add "## "&qa.question&"\n"
  md.add qa.answer.txt&"\n"
  if qa.answer.sk1 != 0:
    md.add &"  - {qa.answer.sn1} + {qa.answer.sk1}\n"
    md.add &"  - {qa.answer.sn2} + {qa.answer.sk2}\n"
  md.add "\n"


proc getPlayer*(): string =
  return player.toJson

proc getMd*(): string =
  return md
