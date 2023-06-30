import sigiltypes, random
randomize()

var
  (
    athletics*, broadCraft*,
    burglary*, deceive*,
    constitution*, diplomacy*,
    drive*, fineCraft*,
    fight*, intimidate*,
    perception*, intuition*,
    might*, investigate*,
    shoot*, logic*,
    stealth*, luck*,
    throw*, will*
  ) = (
    ("Athletics", 30), ("Broad-Craft", 30),
    ("Burglary", 30), ("Deceive", 30),
    ("Constitution", 30), ("Diplomacy", 30),
    ("Drive", 30), ("Fine-Craft", 30),
    ("Fight", 30), ("Intimidate", 30),
    ("Perception", 30), ("Intuition", 30),
    ("Might", 30), ("Investigate", 30),
    ("Shoot", 30), ("Logic", 30),
    ("Steatlh", 30), ("Luck", 30),
    ("Throw", 30), ("Will", 30))

  qna*: seq[tuple[question: string, answer: SkRes]]

proc genAge(): int =
  return case rand 1..100:
    of 1..35: 20 + rand 1..10
    of 36..70: 30 + rand 1..10
    of 71..85: 40 + rand 1..10
    of 86..95: 50 + rand 1..10
    of 96..100: 60 + rand 1..10
    else: 0

let age* = genAge()

oracleTable handedness:
  1..89: "Right-Handed"
  90..99: "Left-Handed"
  100: "Ambidextrous"

oracleTable sex:
  1..50: "Male"
  51..100: "Female"

oracleTable maleBuild:
  1..10: "Scrawny"
  11..25: "Lean"
  26..40: "Athletic"
  41..60: "Average"
  61..75: "Brawny"
  76..90: "Stocky"
  91..100: "Heavy"

oracleTable femaleBuild:
  1..10: "Petite"
  11..25: "Slender"
  26..40: "Fit"
  41..60: "Average"
  61..75: "Muscular"
  76..90: "Buxom"
  91..100: "Plump"

oracleTable complexion:
  1..10: "Pale"
  11..20: "Fair"
  21..30: "Golden"
  31..40: "Rosy"
  41..50: "Ruddy"
  51..60: "Tan"
  61..70: "Olive"
  71..80: "Dark"
  81..90: "Swarthy"
  91..100: "Dusky"

oracleTable distinctiveTrait:
  1..2: "Animal tattoos"
  3..4: "Bald head"
  5..6: "Cheek piercings"
  7..8: "Close-set eyes"
  9..10: "Crooked nose"
  11..12: "Crooked teeth"
  13..14: "Ear piercings"
  15..16: "Excess body hair"
  17..18: "Exotropic eyes"
  19..20: "Extensice liquid burn marks"
  21..22: "Extreme scarring on legs"
  23..24: "Eyebrow piercings"
  25..26: "Gang tattoos"
  27..28: "Healed chemical burn marks"
  29..30: "Heavy scarring on face"
  31..32: "Huge scarring on back"
  33..34: "large mole on cheek"
  35..36: "Lip piercing"
  37..38: "Long fingers"
  39..40: "Major electrical burns marks"
  41..42: "Military tattoos"
  43..44: "Missing ear"
  45..46: "Missing finger"
  47..48: "Missing teeth"
  49..50: "Missing toe"
  51..52: "Mythological tattoos"
  53..54: "Nervous facial tic"
  55..56: "Nose piercing"
  57..58: "Old brand on face"
  59..60: "Old brand on neck"
  61..62: "Old brands on arms"
  63..64: "Old brands on legs"
  65..66: "Old brands on torso"
  67..68: "Overbite"
  69..70: "Plant tattoos"
  71..72: "Pockmarked skin"
  73..74: "Protuding brow and chin"
  75..76: "Religious tattoos"
  77..78: "Scarring on arms"
  79..80: "Severe flame burn marks"
  81..82: "Stain-mark on arm"
  83..84: "Stain-mark on face"
  85..86: "Stain-mark on neck"
  87..88: "Stain-mark on torso"
  89..90: "Terrible scarring on chest"
  91..92: "Tribal tattoos"
  93..94: "Underbite"
  95..96: "Unpleasant odour"
  97..98: "Vitiligo"
  99..100: "Roll twice"

oracleTable heirlooms:
  1..2: "A bracelet made of silver charms"
  3..4: "A braided necklace made of different metals"
  5..6: "A brass bell with a large crack running through it"
  7..8: ""
  9..10: "Crooked nose"
  11..12: "Crooked teeth"
  13..14: "Ear piercings"
  15..16: "Excess body hair"
  17..18: "Exotropic eyes"
  19..20: "Extensice liquid burn marks"
  21..22: "Extreme scarring on legs"
  23..24: "Eyebrow piercings"
  25..26: "Gang tattoos"
  27..28: "Healed chemical burn marks"
  29..30: "Heavy scarring on face"
  31..32: "Huge scarring on back"
  33..34: "large mole on cheek"
  35..36: "Lip piercing"
  37..38: "Long fingers"
  39..40: "Major electrical burns marks"
  41..42: "Military tattoos"
  43..44: "Missing ear"
  45..46: "Missing finger"
  47..48: "Missing teeth"
  49..50: "Missing toe"
  51..52: "Mythological tattoos"
  53..54: "Nervous facial tic"
  55..56: "Nose piercing"
  57..58: "Old brand on face"
  59..60: "Old brand on neck"
  61..62: "Old brands on arms"
  63..64: "Old brands on legs"
  65..66: "Old brands on torso"
  67..68: "Overbite"
  69..70: "Plant tattoos"
  71..72: "Pockmarked skin"
  73..74: "Protuding brow and chin"
  75..76: "Religious tattoos"
  77..78: "Scarring on arms"
  79..80: "Severe flame burn marks"
  81..82: "Stain-mark on arm"
  83..84: "Stain-mark on face"
  85..86: "Stain-mark on neck"
  87..88: "Stain-mark on torso"
  89..90: "Terrible scarring on chest"
  91..92: "Tribal tattoos"
  93..94: "Underbite"
  95..96: "Unpleasant odour"
  97..98: "Vitiligo"
  99..100: "Roll twice"

skillTable c1:
  1..10:
    "A loud explosion and then silence."
    drive
    intimidate
  11..20:
    "Running, dancing, and celebrating."
    athletics
    perception
  21..30:
    "Getting caught stealing."
    burglary
    will
  31..40:
    "Being put to work to help my family."
    constitution
    throw
  41..50:
    "Crying because I got hopelessly lost."
    fineCraft
    investigate
  51..60:
    "Being covered in someone else's blood."
    broadCraft
    shoot
  61..70:
    "My parents telling me it will all be OK."
    deceive
    might
  71..80:
    "The joyful laughter of my family."
    diplomacy
    luck
  81..90:
    "A vicious battle. I don't know who won."
    fight
    logic
  91..100:
    "Playing hide and seek with my friends."
    intuition
    stealth

qna.add ("WHAT WAS YOUR EARLIEST MEMORY?", c1())

skillTable c2:
  1..10:
    "On the streets."
    stealth
    fight
  11..20:
    "On the open road, always travelling."
    drive
    diplomacy
  21..30:
    "On a farm, in the muck."
    broadCraft
    athletics
  31..40:
    "Near a church, helping the priests."
    investigate
    might
  41..50:
    "In a busy shop, constantly underfoot."
    intimidate
    burglary
  51..60:
    "Near a library that I always visited."
    logic
    fineCraft
  61..70:
    "Near danger, seeing things I shouldn't."
    shoot
    perception
  71..80:
    "Near a library that I always visited."
    will
    throw
  81..90:
    "In an unremarkable but safe home."
    luck
    intuition
  91..100:
    "On the stage, performing every night."
    deceive
    constitution

qna.add ("WHERE DID YOU GROW UP?", c2())

skillTable c3:
  1..10:
    "Too small to be called a family."
    deceive
    shoot
  11..20:
    "So big it could have been an army."
    constitution
    burglary
  21..30:
    "Small enough to be comfortable."
    athletics
    will
  31..40:
    "Large enough and loud enough."
    intuition
    throw
  41..50:
    "Nothing out of the ordinary."
    drive
    perception
  51..60:
    "Tiny. Just the essentials."
    drive
    perception
  61..70:
    "Not big, but friends made up for it."
    diplomacy
    broadCraft
  71..80:
    "Just big enough for me."
    luck
    fineCraft
  81..90:
    "Almost bigger than the house."
    fight
    might
  91..100:
    "I can't even remember all their names."
    logic
    investigate

qna.add ("HOW LARGE WAS YOUR FAMILY?", c3())

skillTable c4:
  1..10:
    "Solid people doing solid work."
    athletics
    throw
  11..20:
    "Paper pushers minding their business."
    will
    stealth
  21..30:
    "Cops chasing down criminals."
    shoot
    luck
  31..40:
    "Builders tinkering and crafting all day."
    perception
    might
  41..50:
    "Smart people, their noses in books."
    logic
    diplomacy
  51..60:
    "Hunters, rangers living in the open air."
    investigate
    drive
  61..70:
    "Drifters, never putting down roots."
    intimidate
    constitution
  71..80:
    "Artists, who created beautiful things."
    intuition
    fineCraft
  81..90:
    "Soldiers fighting one war after the other."
    fight
    broadCraft
  91..100:
    "Criminals and ne'er-do-wells."
    burglary
    deceive

qna.add ("WHAT WAS YOUR FAMILY LIKE?", c4())

skillTable c5:
  1..10:
    "Draconian"
    constitution
    shoot
  11..20:
    "Brutal"
    broadCraft
    intimidate
  21..30:
    "Heavy-handed"
    athletics
    will
  31..40:
    "Strict"
    perception
    fight
  41..50:
    "Tolerant"
    logic
    might
  51..60:
    "Indifferent"
    fineCraft
    diplomacy
  61..70:
    "Easy-going"
    drive
    intuition
  71..80:
    "Lenient"
    burglary
    stealth
  81..90:
    "Pampered"
    luck
    deceive
  91..100:
    "Spoilt"
    investigate
    throw

qna.add ("HOW STRICT WAS YOUR UPBRINGING?", c5())

skillTable c6:
  1..10:
    "Fanatical"
    constitution
    fight
  11..20:
    "Zealous"
    athletics
    shoot
  21..30:
    "Devout"
    broadCraft
    luck
  31..40:
    "Sincere"
    diplomacy
    will
  41..50:
    "Tolerant"
    investigate
    perception
  51..60:
    "Indifferent"
    might
    intuition
  61..70:
    "Apathetic"
    throw
    stealth
  71..80:
    "Agnostic"
    logic
    drive
  81..90:
    "Atheistic"
    deceive
    intimidate
  91..100:
    "Defiant"
    fineCraft
    burglary

qna.add ("HOW DID YOU RESPOND TO RELIGION?", c6())

skillTable c7:
  1..10:
    "My bully."
    drive
    stealth
  11..20:
    "My sibling."
    athletics
    investigate
  21..30:
    "My best friend."
    burglary
    diplomacy
  31..40:
    "A religious leader."
    constitution
    will
  41..50:
    "A hero from legends."
    might
    luck
  51..60:
    "My teacher and mentor."
    broadCraft
    logic
  61..70:
    "Myself."
    deceive
    intuition
  71..80:
    "A heroic soldier."
    fight
    shoot
  81..90:
    "A kind old man that helped me."
    intimidate
    fineCraft
  91..100:
    "My parents."
    perception
    throw

qna.add ("WHO HAD THE BIGGEST INFLUENCE ON YOUR CHILDHOOD?", c7())

skillTable c8:
  1..10:
    "Afraid"
    athletics
    stealth
  11..20:
    "Peaceful"
    burglary
    logic
  21..30:
    "Happy"
    fineCraft
    broadCraft
  31..40:
    "Cynical"
    diplomacy
    investigate
  41..50:
    "Proud"
    might
    drive
  51..60:
    "Sad"
    constitution
    intuition
  61..70:
    "Ashamed"
    deceive
    perception
  71..80:
    "Angry"
    fight
    luck
  81..90:
    "Confused"
    intimidate
    will
  91..100:
    "Indifferent"
    shoot
    throw

qna.add ("YOUR CHILDHOOD LEFT YOU FEELING...?", c8())

skillTable t1:
  1..10:
    "A farmhand, close to the earth and hard of spirit."
    athletics
    luck
  11..20:
    "Someone with more money than sense."
    burglary
    drive
  21..30:
    "No one. Absolutely no one."
    constitution
    investigate
  31..40:
    "The voices that won't go away, not even when I sleep."
    intuition
    broadCraft
  41..50:
    "A bookworm who had an answer for everything."
    deceive
    logic
  51..60:
    "My dog, the best friend a man could ask for."
    diplomacy
    throw
  61..70:
    "A soldier's child, who knew every weapon there was."
    fight
    will
  71..80:
    "A street thief, always one step ahead of everyone."
    might
    stealth
  81..90:
    "An outdoorsy kid, always away hunting and fishing."
    shoot
    intimidate
  91..100:
    "An apprentice, always tinkering away at something."
    fineCraft
    perception

qna.add ("WHO WAS YOUR BEST FRIEND?", t1())

skillTable t2:
  1..10:
    "They loved me, and so did their best friend."
    athletics
    shoot
  11..20:
    "They were a petty criminal and ended up in jail."
    burglary
    intuition
  21..30:
    "They left a note and disappeared forever."
    constitution
    drive
  31..40:
    "I caught them and their old lover together."
    broadCraft
    fight
  41..50:
    "Expensive and by the hour."
    deceive
    stealth
  51..60:
    "Sweet, like fine wine."
    diplomacy
    will
  61..70:
    "I fought my rival for them."
    might
    throw
  71..80:
    "Our families hated each other."
    intimidate
    luck
  81..90:
    "They hid something important from me."
    investigate
    perception
  91..100:
    "It was unrequited, through a window, from afar."
    logic
    fineCraft

qna.add ("HOW WAS YOUR FIRST LOVE?", t2())

skillTable t3:
  1..10:
    "That hard work and effort will be rewarded in time."
    drive
    might
  11..20:
    "To aim for the stars, and fake it till you get there."
    athletics
    deceive
  21..30:
    "That if you're gonna steal, do it quietly."
    burglary
    stealth
  31..40:
    "That I need to be patient with my dreams."
    constitution
    broadCraft
  41..50:
    "To see the beauty in the world, rather than the misery."
    fineCraft
    diplomacy
  51..60:
    "That violence is the only answer some will listen to."
    fight
    throw
  61..70:
    "That everyone and everything has a price."
    intuition
    intimidate
  71..80:
    "To always do the right thing, no matter what."
    investigate
    shoot
  81..90:
    "That you can never stop learning and studying."
    logic
    perception
  91..100:
    "To trust in a higher power and stop worrying."
    luck
    will

qna.add ("WHAT DID YOU LEARN FROM THE ADULTS AROUND YOU?", t3())

skillTable t4:
  1..10:
    "Disappeared for days or weeks to explore the world."
    athletics
    constitution
  11..20:
    "We were great at tracking down narcotics."
    investigate
    will
  21..30:
    "Went places we shouldn't, saw things we were too young to."
    perception
    stealth
  31..40:
    "Vandalism was how we left our mark on the world."
    fineCraft
    might
  41..50:
    "Mischief? Who? Me? Why I never."
    diplomacy
    deceive
  51..60:
    "We were the couriers of more dangerous folk."
    drive
    broadCraft
  61..70:
    "Pinched something here, pocketed something there."
    burglary
    throw
  71..80:
    "A bit of rough and tumble when the adults didn't look."
    fight
    intuition
  81..90:
    "We did anything we wanted. Who could stop us?"
    intimidate
    shoot
  91..100:
    "We studied for so long, we forgot about the mischief."
    logic
    luck

qna.add ("WHAT MISCHIEF DID YOU GET UP TO?", t4())

oracleTable t5:
  1..20:
    "My mother"
  21..40:
    "My father"
  41..55:
    "A sibling"
  56..70:
    "My best friend"
  71..80:
    "My lover"
  81..90:
    "My mentor"
  91..100:
    "Another relative"

qna.add ("WHO DID YOU LOSE?", (t5(), "", "", 0, 0))

skillTable t6:
  1..10:
    "Murder most foul."
    broadCraft
    intimidate
  11..20:
    "They simply vanished. No one knows how or when."
    deceive
    drive
  21..30:
    "I betrayed them to make myself wealthy."
    luck
    stealth
  31..40:
    "They were a criminal and were sent to prison."
    athletics
    burglary
  41..50:
    "A terrible accident. It wasn't anyone's fault."
    constitution
    fineCraft
  51..60:
    "Picked a fight with the wrong person."
    diplomacy
    fight
  61..70:
    "They gave up on this world and on us."
    intuition
    will
  71..80:
    "Illness. Not even the priests could help them."
    logic
    might
  81..90:
    "They betrayed me. Vengeance was my right."
    perception
    shoot
  91..100:
    "An ill-fated journey was their unlucky end."
    investigate
    throw

qna.add ("WHAT HAPPENED TO THE PERSON YOU LOST?", t6())

skillTable t7:
  1..10:
    "Got an addiction. The withdrawal is as bad as the drug."
    burglary
    broadCraft
  11..20:
    "Nearly died. I still bear the scars of the incident."
    constitution
    intuition
  21..30:
    "I found out that violence doesn't solve everything."
    diplomacy
    perception
  31..40:
    "Found an ancient treasure hidden among the dirt."
    deceive
    throw
  41..50:
    "Had my most prized possession stolen."
    might
    intimidate
  51..60:
    "Saved someone from dying. I was the hero they needed."
    athletics
    fineCraft
  61..70:
    "Found a starving, dying animal and nursed it back to health."
    drive
    investigate
  71..80:
    "Was given a precious family heirloom. I keep it on me always."
    logic
    luck
  81..90:
    "Got disowned by those closest to me. I never saw them again."
    shoot
    will
  91..100:
    "Was blackmailed by criminals to do something horrific."
    fight
    stealth

qna.add ("\"THE TURNING POINT IN YOUR LIFE WAS WHEN I...\"", t7())

skillTable t8:
  01..10:
    "Ashamed"
    deceive
    broadCraft
  11..20:
    "Afraid"
    will
    drive
  21..30:
    "Confused"
    diplomacy
    stealth
  31..40:
    "Proud"
    perception
    throw
  41..50:
    "Angry"
    fight
    intimidate
  51..60:
    "Happy"
    athletics
    might
  61..70:
    "Indifferent"
    burglary
    luck
  71..80:
    "Peaceful"
    constitution
    logic
  81..90:
    "Sad"
    shoot
    fineCraft
  91..100:
    "Cynical"
    intuition
    investigate

qna.add ("HOW DO YOU FEEL ABOUT YOUR TEENAGE YEARS?", t8())

skillTable a1:
  01..10:
    "A devout life, trusting in a higher power."
    will
    throw
  11..20:
    "A life spent reading and studying."
    logic
    shoot
  21..30:
    "A working life, doing an honest day's work."
    constitution
    perception
  31..40:
    "An artistic life of beauty and wonder."
    burglary
    luck
  41..50:
    "A life on the streets, battling to survive."
    broadCraft
    stealth
  51..60:
    "The golden life, trading goods and coin."
    deceive
    drive
  61..70:
    "A stale life, counting numbers and figures."
    diplomacy
    intimidate
  71..80:
    "The right side of life, keeping law and order."
    intuition
    might
  81..90:
    "A life lived on the move."
    investigate
    athletics
  91..100:
    "One fighting from one battlefield to the next."
    fineCraft
    fight

qna.add ("WHAT SORT OF LIFE LEAD YOU HERE?", a1())

skillTable a2:
  01..10:
    "Hunting and fishing."
    athletics
    drive
  11..20:
    "Taking what doesn't belong to me."
    burglary
    shoot
  21..30:
    "Socialising with others."
    constitution
    diplomacy
  31..40:
    "Going where I'm not supposed to."
    fineCraft
    stealth
  41..50:
    "Creating, tinkering, building."
    broadCraft
    luck
  51..60:
    "Putting bastards in their place."
    deceive
    fight
  61..70:
    "Exploring places I've never been."
    intuition
    perception
  71..80:
    "Watching the lives of people go by."
    intimidate
    investigate
  81..90:
    "Learning new things."
    logic
    throw
  91..100:
    "Keeping my body in shape."
    might
    will

qna.add ("IN YOUR SPARE TIME, WHAT DO YOU ENJOY DOING?", a2())

skillTable a3:
  01..10:
    "Chaste in my passions."
    athletics
    intimidate
  11..20:
    "Empathic to others' needs."
    burglary
    fight
  21..30:
    "Humble in what I do."
    will
    perception
  31..40:
    "Patient with my plans."
    fineCraft
    drive
  41..50:
    "Diligent in my work."
    investigate
    luck
  51..60:
    "Adaptable to what happens."
    logic
    intuition
  61..70:
    "Charitable to those who need it."
    throw
    broadCraft
  71..80:
    "Kind to those around me."
    diplomacy
    might
  81..90:
    "Respectful to all I meet."
    constitution
    deceive
  91..100:
    "Temperate in my choices."
    stealth
    shoot

qna.add ("WHAT DO YOU ALWAYS TRY TO BE?", a3())

skillTable a4:
  01..10:
    "Wanting to take what others have."
    fineCraft
    investigate
  11..20:
    "Always wanting more and more."
    logic
    burglary
  21..30:
    "Being consumed by my hidden desires."
    luck
    diplomacy
  31..40:
    "Feeling better than others around me."
    perception
    intimidate
  41..50:
    "Getting the energy to do my fair share."
    stealth
    might
  51..60:
    "Forcing others to my point of view."
    constitution
    drive
  61..70:
    "Consuming more than what's good for me."
    broadCraft
    intuition
  71..80:
    "Taking my anger out on anyone I see."
    athletics
    fight
  81..90:
    "Not caring much for anyone or anything."
    deceive
    will
  91..100:
    "Refusing to listen, even when I should."
    shoot
    throw

qna.add ("WHAT CAN’T YOU STOP YOURSELF DOING?", a4())

skillTable a5:
  01..10:
    "My people, my nation."
    athletics
    diplomacy
  11..20:
    "Power and the will to use it."
    burglary
    investigate
  21..30:
    "Myself, clearly."
    constitution
    might
  31..40:
    "My friends, the family I chose."
    fineCraft
    deceive
  41..50:
    "My god(s), my faith."
    broadCraft
    will
  51..60:
    "Technology and the future."
    drive
    luck
  61..70:
    "Freedom and chaos, as nature intended."
    fight
    perception
  71..80:
    "My family, my blood."
    intuition
    shoot
  81..90:
    "Order, peace, tranquillity."
    intimidate
    throw
  91..100:
    "Knowledge, and the study thereof."
    logic
    stealth

qna.add ("WHAT IS MOST IMPORTANT TO YOU?", a5())

oracleTable a6:
  01..40:
    "Yes, for better or worse."
  41..70:
    "No, I'm not that lucky."
  71..90:
    "Yes, but only for a while."
  91..100:
    "Wait, just one?"

qna.add ("DID YOU FIND YOUR SOUL MATE?", (a6(), "", "", 0, 0))

oracleTable a7:
  01..15:
    "Just the one."
  16..40:
    "A small handful of little ones."
  41..50:
    "A whole litter of them!"
  51..75:
    "It's not in the cards for me."
  76..90:
    "No, not yet."
  91..100:
    "Never work with kids or animals."

qna.add ("AND WHAT ABOUT CHILDREN?", (a7(), "", "", 0, 0))

skillTable a8:
  01..10:
    "The end justifies the means."
    deceive
    intimidate
  11..20:
    "Knowledge is power."
    logic
    drive
  21..30:
    "Victory likes careful preparation."
    might
    broadCraft
  31..40:
    "Nothing ventured, nothing gained."
    fight
    investigate
  41..50:
    "Love conquers all."
    fineCraft
    throw
  51..60:
    "He who hesitates is lost."
    shoot
    diplomacy
  61..70:
    "Evolve or die."
    burglary
    perception
  71..80:
    "Beyond fear lives freedom."
    athletics
    will
  81..90:
    "Fortune favours the bold."
    luck
    intuition
  91..100:
    "Always darkest before the dawn."
    constitution
    stealth

qna.add ("YOUR MOTTO IN LIFE?", a8())

skillTable a9:
  01..10:
    "I approve of the just."
    athletics
    logic
  11..20:
    "I admire the scholarly."
    will
    fineCraft
  21..30:
    "I like almost everyone."
    burglary
    diplomacy
  31..40:
    "I prefer the wealthy."
    investigate
    stealth
  41..50:
    "I favour the pious."
    constitution
    luck
  51..60:
    "I dig the outlaws."
    shoot
    drive
  61..70:
    "I applaud the sceptical."
    broadCraft
    perception
  71..80:
    "I care for the poor."
    might
    intimidate
  81..90:
    "I respect the unschooled."
    throw
    deceive
  91..100:
    "I dislike almost everyone."
    fight
    intuition

qna.add ("WHAT’S YOUR OUTLOOK ON PEOPLE?", a9())

oracleTable a10:
  01..15:
    "Never. I need people."
  16..45:
    "No, there's always someone around."
  46..70:
    "Only when I have to."
  71..80:
    "I might as well; few others care."
  81..100:
    "I do now; it's better this way."

qna.add ("DO YOU STAND ALONE?", (a10(), "", "", 0, 0))

skillTable a11:
  01..10:
    "The Counselor."
    athletics
    intuition
  11..20:
    "The Tinkerer."
    burglary
    broadCraft
  21..30:
    "The Warrior."
    constitution
    fight
  31..40:
    "The Mentor."
    will
    logic
  41..50:
    "The Face."
    deceive
    luck
  51..60:
    "The Boss."
    diplomacy
    perception
  61..70:
    "The Warden."
    drive
    intimidate
  71..80:
    "The Scout."
    investigate
    might
  81..90:
    "The Striker."
    shoot
    fineCraft
  91..100:
    "The Wildcard."
    stealth
    throw

qna.add ("WHAT ROLE DO YOU PLAY IN A GROUP?", a11())

proc getName*(): tuple[male, female, surname: string] =
  return case rand 1..100:
    of 1: ("Aaron", "Abigail", "Abdullah")
    of 51: ("James", "Kassandra", "Le Roux")
    of 2: ("Abel", "Alice", "Adamson")
    of 52: ("Jan", "Lana", "Lee")
    of 3: ("Abraham", "Allison", "Andrews")
    of 53: ("Jared", "Lea", "Leroy")
    of 4: ("Adam", "Amanda", "Aslan")
    of 54: ("Jason", "Leila", "Lowe")
    of 5: ("Adrian", "Amber", "Attar")
    of 55: ("John", "Lily", "Mahmud")
    of 6: ("Ali", "Amelia", "Balewa")
    of 56: ("Jonah", "Linda", "Mamadov")
    of 7: ("Amir", "Amy", "Bauer")
    of 57: ("Jordan", "Logina", "Martinez")
    of 8: ("Andrew", "Anna", "Bautista")
    of 58: ("Joseph", "Lois", "McKenzie")
    of 9: ("Antonio", "Aurora", "Bliss")
    of 59: ("Joshua", "Lucy", "McLeod")
    of 10: ("Bartholomew", "Ava", "Brady")
    of 60: ("Julian", "Lulu", "Meyer")
    of 11: ("Benjamin", "Avra", "Britz")
    of 61: ("Justin", "Madison", "Moldero")
    of 12: ("Boris", "Barbara", "Campbell")
    of 62: ("Kazuo", "Maisie", "Moreau")
    of 13: ("Bradley", "Bridget", "Castro")
    of 63: ("Kevin", "Margaret", "Muller")
    of 14: ("Bran", "Brooke", "Chen")
    of 64: ("Lachlan", "Martha", "Murphy")
    of 15: ("Brian", "Caroline", "Clark")
    of 65: ("Leonard", "Martyna", "Musayev")
    of 16: ("Caleb", "Catherine", "Cohen")
    of 66: ("Levi", "Mary", "Naidoo")
    of 17: ("Carter", "Charlotte", "Davis")
    of 67: ("Liam", "Megan", "Nelson")
    of 18: ("Charles", "Chloe", "Dugdale")
    of 68: ("Logan", "Melina", "Novak")
    of 19: ("Christian", "Claire", "Dulatre")
    of 69: ("Luke", "Mia", "O'Brien")
    of 20: ("Cole", "Coralie", "Dupont")
    of 70: ("Mark", "Mila", "Obi")
    of 21: ("Collin", "Daisy", "Dvorak")
    of 71: ("Mason", "Monika", "Park")
    of 22: ("Connor", "Dasha", "Erasmus")
    of 72: ("Matthew", "Naomi", "Patel")
    of 23: ("Cristopher", "Dora", "Eriksson")
    of 73: ("Michael", "Natalie", "Pavlov")
    of 24: ("Cruz", "Dorothy", "Evans")
    of 74: ("Mohammed", "Natasha", "Peterson")
    of 25: ("Daniel", "Elizabeth", "Farkas")
    of 75: ("Nathan", "Nina", "Powell")
    of 26: ("David", "Ella", "Fernandez")
    of 76: ("Nicholas", "Nykita", "Rodriguez")
    of 27: ("Dean", "Emily", "Ferreira")
    of 77: ("Noah", "Olga", "Rossi")
    of 28: ("Diego", "Emma", "Fisher")
    of 78: ("Omar", "Olivia", "Santos")
    of 29: ("Dimitry", "Estelle", "Fontaine")
    of 79: ("Owen", "Patricia", "Sato")
    of 30: ("Doug", "Esther", "Fyodorov")
    of 80: ("Patrick", "Penelope", "Schneider")
    of 31: ("Dylan", "Eva", "Garcia")
    of 81: ("Paul", "Persephone", "Singh")
    of 32: ("Edward", "Evelyn", "Golding")
    of 82: ("Peter", "Phoebe", "Smirnov")
    of 33: ("Elijah", "Fatima", "Gruber")
    of 83: ("Phillip", "Piper", "Smith")
    of 34: ("Ethan", "Fleur", "Hamilton")
    of 84: ("Quentin", "Rosa", "Subido")
    of 35: ("Evan", "Francine", "Hansen")
    of 85: ("Rashid", "Ruby", "Tait")
    of 36: ("Finn", "Gladys", "Hasan")
    of 86: ("Ren", "Ruth", "Taylor")
    of 37: ("Flynn", "Gloria", "Houg")
    of 87: ("Reuben", "Sabina", "Thompson")
    of 38: ("Frank", "Grace", "Janssens")
    of 88: ("Robert", "Sakura", "van der Berg")
    of 39: ("Fraser", "Hailey", "Johnson")
    of 89: ("Roderick", "Sandra", "van Dyk")
    of 40: ("Frederick", "Hannah", "Jones")
    of 90: ("Ryan", "Sarah", "Vega")
    of 41: ("Gabriel", "Hazel", "Joubert")
    of 91: ("Schalk", "Sophia", "Wagner")
    of 42: ("George", "Helen", "Katzarov")
    of 92: ("Scott", "Stella", "Walker")
    of 43: ("Gerhard", "Holly", "Khan")
    of 93: ("Sean", "Susan", "Walker")
    of 44: ("Harry", "Imogen", "Kim")
    of 94: ("Sebastian", "Tatiana", "Weber")
    of 45: ("Henry", "Isabella", "Kowalski")
    of 95: ("Stephen", "Victoria", "White")
    of 46: ("Hugo", "Ivy", "Kumar")
    of 96: ("Thomas", "Violet", "Williams")
    of 47: ("Isiah", "Jennifer", "Lambert")
    of 97: ("Tobias", "Wanda", "Wilson")
    of 48: ("Izak", "Jessica", "Lang")
    of 98: ("Vasco", "Willow", "Wright")
    of 49: ("Jackson", "Julia", "Lawton")
    of 99: ("Willem", "Zahra", "Zabat")
    of 50: ("Jake", "Karen", "Le Gall")
    of 100: ("Wyatt", "Zoey", "Zhou")
    else: ("?", "?", "?")
