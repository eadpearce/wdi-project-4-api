# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Prompt.destroy_all
Tag.destroy_all
Fill.destroy_all
Comment.destroy_all

# create anonymous user and dummy users
User.create!({
  username: "anonymous",
  email: "anon@anon.com",
  password: "password",
  password_confirmation: "password",
  about: "I am one. I am many."
  })
klyn = User.create!({
  username: "klyn",
  image: "https://pbs.twimg.com/media/C6hz69AWgAEa0xn.jpg",
  email: "klyn@klyn.com",
  password: "password",
  password_confirmation: "password",
  about: "## yo what up

![](https://68.media.tumblr.com/c8a9e5e2653023dddb2155765d6cbf32/tumblr_olhvfmqRjw1ug0ipjo7_400.gif)

 ardyn izunia ruined my life"
  })
kenji = User.create!({
  username: "kenji",
  image: "https://pbs.twimg.com/profile_images/866422237141889030/ncOcKBsL_400x400.jpg",
  email: "kenji@kenji.com",
  password: "password",
  password_confirmation: "password",
  about: "**your resident alchemy nerd**"
  })
neku = User.create!({
  username: "neku",
  image: "https://pbs.twimg.com/media/DBnWNkbUIAAYMay.jpg",
  email: "neku@neku.com",
  password: "password",
  password_confirmation: "password",
  about: "no"
  })

# make some prompts and comments
prompt1 = Prompt.create!({
  title: "FFXV Modern AU, Police Procedural, Comedy ??",
  rating: "general",
  body: "The cast of FFXV in a police procedural and Ardyn is the (wholly unexpected) bad guy. Maybe he's on the force with them and ends up betraying them or maybe he's just some weirdo they meet while investigating another case who leads them on a wild goose chase and eventually screws them all over?? Go nuts.",
  user_id: kenji.id
  })
kenji.prompts << prompt1

# add some tags to prompt
ffxv = Tag.create!({ name: "ffxv" })
modern_au = Tag.create!({ name: "modern au" })
police = Tag.create!({ name: "police procedural" })
comedy = Tag.create!({ name: "comedy" })
ardyn = Tag.create!({ name: "ardyn izunia" })
prompt1.tags << ffxv
prompt1.tags << modern_au
prompt1.tags << police
prompt1.tags << comedy
prompt1.tags << ardyn

# add some comments
prompt1.comments.create!({
  body: "yes pls",
  prompt_id: prompt1.id,
  user_id: neku.id
  })
prompt1.comments.create!({
  body: "i'm gonna write this",
  prompt_id: prompt1.id,
  user_id: klyn.id
  })
prompt2 = Prompt.create!({
  title: "Alien/Star Trek Crossover - ROBOT FIGHT",
  body: "Alien and Star Trek crossover. I want Data and Lore to fight Walter and David 8.",
  rating: "mature",
  tagged_as: "alien, alien covenant, prometheus, star trek tng, robots",
  user_id: klyn.id
  })
alien = Tag.create! name: "alien"
alien_c = Tag.create! name: "alien: covenant"
prometheus = Tag.create! name: "prometheus"
david8 = Tag.create! name: "david 8"
walter = Tag.create! name: "walter (alien)"
data = Tag.create! name: "data (star trek)"
lore = Tag.create! name: "lore (star trek)"
star_trek = Tag.create! name: "star trek: tng"
robots = Tag.create! name: "robots"
prompt2.tags << alien
prompt2.tags << alien_c
prompt2.tags << prometheus
prompt2.tags << david8
prompt2.tags << walter
prompt2.tags << data
prompt2.tags << lore
prompt2.tags << star_trek
prompt2.tags << robots

kenji.prompts << prompt2
prompt2.comments.create!({
  body: "omg",
  prompt_id: prompt2.id,
  user_id: neku.id
  })
prompt3 = Prompt.create!({
  title: "FE Fates AU",
  body: "Fire Emblem Fates, alternate universes AU, every time Azura sings she enters another version of reality, and every time Birthright/Conquest end she just managed to escape to another timeline; Kaze/Azura, Revelations route as the one she doesn't escape at some point",
  user_id: kenji.id,
  rating: ""
  })

fe_au = Fill.create!({
  title: "Of Silence",
  rating: "mature",
  user_id: neku.id,
  body: "It happens first when she gets lonely in Shirasagi. While Queen Mikoto treats her well enough, everyone else is frosty to her - much like it was back in Krakenburg, just with King Garon being the one who always treated her nicely. So she goes, and does what she has always been good at; she sings. She sings at the lake, for the first time since her mother's passing and the pendant reaching her hands.

Azura sings the only song she knows that isn't Nohrian, at the only place in Castle Shirasagi where she always feels safe. The water ripples, just as she remembers it rippling for her mother whenever she sang at a lake in Nohr. Azura, maybe in a vain hope of meeting her mother beyond the lake (for all they found of Queen Arete was an empty room, and her pendant in a puddle of strangely glittery water), dives in.

The silent kingdom her mother had shown her greets her as it always does - with deafening silence. There is nothing left of what her mother described as pleasant and lively place, and Azura sighs ere turning back around, and she sings once more.

Her song echoes sadly across the empty plains of the Kingdom of Valla.

It's not the last time it will do so.



When she returns, she notices several things. Ryoma's behaviour around her seems to have changed, and where Queen Mikoto had been friendly but distant earlier she was now loving and almost too close. In fact, everyone but Takumi somehow seems to have changed - Shirasagi feels warmer, more open now. She doesn't go to sing at the lake for a few years, because despite the fact she was a princess from another realm and kidnapped by people thinking she was a princess of Nohr, she suddenly feels much more like a part of Hoshido than a hostage in exchange for Kamui.

\"Who's Kamui?\"

It's that question that prompts her to sing once more, for she remembers how Queen Mikoto used to cry when she thought she was alone, about her Kamui. Queen Mikoto now looks puzzled, almost a little concerned. Her eyes ever so slightly strafe the pendant on Azura's chest, but she says naught else. Even Ryoma, who had always talked about how they had to get Kamui back looks confused. It is Takumi's voice as she goes to the lake to sing that makes a strange worry bubble up in her chest.

\"She asked about who?\" Hinoka answers Takumi's question, and the boy growls a little. \"That almost sounds like Corrin's name. Just almost.\"

So she sings, sings with fear in her heart, and Valla answers with its deafening silence once more.

She spends a few hours there, strolling over the long abandoned meadows and passes a few destroyed houses. She knows any water will bring her back to where she came from, so as long as she finds a body of water to sing at she will return to Hoshido before long.

Valla's beauty captivates her, and she cannot help but wonder how much her late mother (but had she truly died, rather than just vanished into thin air? Wasn't that the same thing anyway?) had missed her home country.

Azura sings.



When she returns, people call her Aqua. Everyone but Takumi is once more friendly to her, but the change of name almost makes her ask about it. Maybe they were getting back at her for calling Corrin Kamui.

Queen Mikoto once more cries when she thinks she is alone, cries for her missing Corrin.

After a week the name gets unnerrving, and Azura - Aqua - sings. Sakura almost catches her, but she is gone and the girl considers it mere hallucination an returns to her studies.



It is Kamui who is missing here - and for some reason Hoshido's ever verdant hills seem to be losing colour.

\"The sky above Nohr and Hoshido changed while you were gone,\" they say, and Queen Mikoto's gaze once more brushes her pendant. It does so several times in the next few months.

Where Takumi's question had instilled her with fear, this repeated curious gaze now makes a question form in Azura's head.

Thus she goes, to sing once more. And she sings.

And she sings again in Valla. The lyrics of the song come naturally now, and the pendant feels warm against her chest.

This time, she comes back to Hoshido and collapses immediately. While gasping for breath she manages to raise her hand, and sees it distort strangely. A strangled cry escapes her lips, and much to her surprise someone answers her.

Queen Mikoto comes rushing along, immediately helping Azura sit as they watch her hand's distortion subside.

\"Azura. Or, is that what they called you?\"

\"B-Beg pardon?\"

Mikoto pauses, her beautiful face looking strange with these furrowed eyebrows. \"So you are one who does not know the power of Arete's pendant...\"

\"Y-You knew my mother?\"

\"Yes. You came from the lake just now, did you not?\"

Azura confirms this, and Queen Mikoto sighs while looking at the now still waters.

\"You must not overuse that song, Azura. It is dangerous to use this power liberally, for every power comes with a price. And yours comes with a price more terrifying than you can imagine. Remember that for now.\"

She stays for a few weeks this time, but something about this Castle Shirasagi feels wrong. She reasons her desire to sing again with having a complex motive to herself, and leaves in the middle of the night.

Her thought before dipping into the lake is that she would have liked to apologise to Queen Mikoto.



She's Aqua again. Kamui is Corrin. Takumi still watches her with distrust - the only constant.



Corrin - Kamui - Kamui - Kamui - Corrin - Kamui - Kamui.

She doesn't even know what her name is. Is it Azura? Is it Aqua?

She decides she doesn't care, and answers to both.



She stays the next time. Stays until Suzukaze and Ryoma return with Corrin. Stays until bells ring across the city.

Stays until Queen Mikoto and Corrin die.

The pendant feels heavy on her chest as she drags herself out to the lake, her tears long since shed. She wishes she could explain to Ryoma why she essentially stormed out of the throne room. But with the pendant's heaviness she remembers. She remembers all the times she switched before she was even 15 years old. Her old theory comes back up into the back of her head as she sings.

When she once more stands upon the plains fo Valla, she turns her face heavensward.

\"Is this what the pendant does? Does it make me jump to the body of another Azura, of another Aqua, as they too come to this place? Gods of Valla, I beg of you, is that what it does? Is that why my mother sometimes looked so strange and far away?\"

Of course no gods answer her. Valla is as desolate as it has ever been, and the only sound in this silence around her is her trembling voice as she sings.



Kamui survives. Kamui gets filled with a strange rage as she marches towards the plains with her Hoshidan family. Kamui nearly yells at Prince Xander of Nohr to withdraw his troops. She chooses Hoshido, she chooses her birthright.

Azura stays by her side, follows her as she carves a path through Nohrian territory.

Azura briefly leaves Kamui's side, ever so briefly, for this reality's Suzukaze (\"Please, call me Kaze.\") manages to steal the one thing that Azura always thought would be hers even if she changes realities a million times - her heart.

Said heart shatters just as Kamui's does, but Azura feels it. She feels her body reaching its limit as she sings to quell Garon's might so Kamui and the others can defeat it. She watches in silent terror, with her sight getting blurrier and blurrier as time passes, how little Midori, nimble as she is, nearly takes a blow to her head.

Thus Azura leaves the battlefield. Her chest is heaving, and her limbs feel strangely detatched.

'Your power comes with a price more terrible than you can imagine,' this one reality's Queen Mikoto had said. And Azura understands.

The price is the same fate as what had most likely befallen her mother, for Azura realised by now that her body was fighting against the strange urge to vanish into water. She sings, with her voice strangely dry, and she almost sadistically wants to with the next one fun with what's to befall her.



Corrin survives. Corrin watches in disgust how people treat him, and he too gets filled with a strange rage as they march towards the plains. Corrin, with his voice cold as ice, tells Ryoma to stop. He chooses Nohr, he chooses conquest.

Azura (though she is called Aqua this time) wishes him the best and hurries back to Hoshido. It takes a few weeks before Hoshidan soldiers grab her, silence her, and drag her away, beyond the border.

Corrin and his group find her. She joins them, feeling like she had just lost her only home across several realities. She tries in vain to not watch in terror as history unfolds.
The only constant is Takumi's distrust.

And finally she learns why. Her cold, clammy fingers dig into Kaze's arm as she watches the arrow loosed from the Fujin Yumi pierce Corrin. Mercifully, by some strange will of fate, Corrin is not dead. They ready their weapons, and Azura once more watches little Midori march off to what could be her death.

So Azura sings, even if Kaze begs her (no, begs Aqua) to not do it, and she once more vanishes when her limbs grow numb and the strange, floaty sensation sets in. She had revealed Garon's true face to Corrin in hopes of finally having a place to stay, of finally having a place where she did not have to sing. But it was all for naught, with Takumi's animated corpse appearing out of nowhere.

Queen Mikoto had not been wrong, with the price being terrifying.

Although, as she submerged in the familiar lake on the Castle Shirasagi grounds once more, she wondered: How would Queen Mikoto know?



Kamui falls to a stray arrow from a Hoshidan sniper. Azura leaves this reality on the morrow, after realising that even though she grew up away from him, any Xander's crying is terrible.



It is Kaze this time who falls, although \"torn in half\" would be more accurate. She cannot even look at this without nearly throwing up, and she leaves after spending nearly a day crying alone in her tent.

She doesn't know how Midori or the next \"Aqua\" will manage.



Midori. Sweet little Midori, falls to Saizo. Kaze is screaming as he lunges at his brother, once more in the rooms before the throne room.

Azura sings, but she feels nothing.

Kamui falls to Ryoma, and Ryoma gets slaughtered by Garon. They catch Hinoka, and--

She sings again, but still feels nothing.



She feels old as she watches Queen Mikoto once more sacrifice herself to save Corrin. Kamui? She barely cares as she tries to calm the beast, and people call out for... Aqua? Azura?

They stand upon the plains of Hoshido once more, army against army. Karrin. Comui. Whichever one it is, whichever choice they make, they all end terribly or with Azura dead or dying. She leaves broken timelines to other Aquras. She leaves dying bodies to other Azuas.

The names that inexplicably change all meld together. Zero. Niles. Ziles. Nero. She is rather certain there was one where he was called Nero, actually.

There's realities where Kaze wants her to call him Suzu. Or Kaze. The worst ones are where they never get close and she has to call him Suzukaze for the entirety of a war.

Timelines blend together. She knows Nohr and Hoshido, and way too much about the people on the opposing sides. It makes her heart ache worse and worse with every dip into Valla she takes.



Once more, on the plains. It is a Corrin this time, and she is called Azura. Corrin shakes their head (she can no longer tell them apart; is this one male or female?).
That's new.

They tell Ryoma and Xander to stop this - that's definitely new.

Azura feels her heart surge with sudden confidence as she stands beside Corrin, watches as Felicia and Jakob once more appear late to the war, and this time react with surprise and shock at the prospect of fighting Nohr and Hoshido.

Fighting them both is new, and Azura watches with strange fondness as Corrin struggles with their choice.

So she decides, it is time to teach them about Valla, about what she had learned across all timelines was causing this very war.

The curse took Arete, she realised after watching the first Kaze die. She will not allow anyone else to be taken by the curse.

Corrin starts to manage what none other before them had managed - they bring their family together. They assimilate an army of formidable strength, a strength Azura had never seen before across all these timelines.

Another thing changes this time as well - when inevitably she falls for Kaze, as she has done in countless timelines and realities, it isn't Midori that is born. She had never had a boy before Midori, or any children other than Midori. All those sweet little herbalists.

As soon as she sees that boy the blood in her veins freezes a little. Amber eyes, much like her. And most likely the same blue hair, the very blue that so reminds her of that infernal lake in Hoshido that had caused all her recent grief.

\"Shigure. Let's name him Shigure.\"



Valla is a strange place, with its distorted landscape. There is something charming about it, and Azura finally has found the time to look around without being chased away by strangely watery soldiers. They have found a way to keep the doors to Valla and back to Hoshido and Nohr open, and the formerly dead lands are starting to flourish under the sudden influx of Hoshidans, Nohrians, and many other peoples coming to live here now that it has been purged of Anankos' rancor.

Kamui has been a fairly good ruler, even if little Kana and Kamui (oh, the irony) are certainly a handful. Many people had said that Azura should have been the queen of this place, but Azura had politely but sternly declined being an actual ruler. She much preferred being the helping hand, and Corrin fits the whole 'ruler of a country' spiel much better than her anyway. She was simply named grand chancellor in honour of her relation to Regent Corrin and their family - and Azura was surprisingly okay with that.

At a lake with Kaze, little Shigure and even smaller Midori (how had they managed an army without the Deeprealms in this reality? She had no idea), she slipped off the pendant.

\"It is high time my mother's memento was returned to whence it came.\"

\"It came from the waters of Valla?\"

\"I don't know. But the waters of Valla and this pendant seem to be... very connected. But it is time I let my mother rest in peace.\"

\"Fair. But you don't have to--\"

Azura throws the pendant with surprising strength; Kaze stops mid-sentence and watches it trace an arc through the air before hitting the water, Shigure lets out a soft 'Oooh!' and little Midori whoops and hollers like 2-year-olds do when they're enjoying themselves.

\"-- throw it into the deepest lake of all of Valla.\" He looks kind of stumped, and it almost makes her laugh along with Midori. Even Shigure seems to grin at his father.

So she says, \"Better this place than any other.\"

Better this reality than any other she wants to say as she leans against him, but she refrains from doing so. It's better to let all of this rest together with her mother in the deepest, darkest lake in all of Valla.

Valla, a land now filled with voices other than her sad and desperate singing as she looks for a place she can call home.

**Notes:**

Vaguely inspired by SHIFTing from the Zero Escape series. In case you do not know how that works; the people's consciousness and memories basically leave the current body, and shift to another timeline's, while the other timeline's consciousness gets pushed into the current's body. The same principle is at work here, every time Azura enters (leaves current body) and leaves (enters other timeline's body) Valla. With a few Azura's doing that all at once in different timelines, it's basically like playing russian timeline roulette.

Thanks Rowan for being a bad influence and making me write this, it's 2:30am and I meant to dingle around with my ff14 glamours."
  })
fe = Tag.create! name: "fire Emblem: fates"
aqua = Tag.create! name: "aqua | azura"
suzukaze = Tag.create! name: "suzukaze | kaze"
female = Tag.create! name: "female my unit | avatar"
male = Tag.create! name: "male my unit | avatar"
mikoto = Tag.create! name: "mikoto (fire emblem)"
shenmei = Tag.create! name: "shenmei | arete"
midoriko = Tag.create! name: "midoriko | midori"
shigure = Tag.create! name: "shigure (fire emblem)"
alternate_universes = Tag.create! name: "alternate universes"
time_travel = Tag.create! name: "time travel"

prompt3.tags << fe
prompt3.tags << alternate_universes
prompt3.tags << aqua
prompt3.tags << suzukaze

fe_au.tags << fe
fe_au.tags << aqua
fe_au.tags << suzukaze
fe_au.tags << female
fe_au.tags << male
fe_au.tags << mikoto
fe_au.tags << shenmei
fe_au.tags << midoriko
fe_au.tags << shigure
fe_au.tags << alternate_universes
fe_au.tags << time_travel
prompt3.fills << fe_au

fill1 = Fill.create!({
  prompt_id: prompt1.id,
  user_id: klyn.id,
  title: "Insomnia 99",
  rating: "teen",
  body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  })
fill1.tags << ffxv
fill1.tags << modern_au
fill1.tags << police
fill1.tags << comedy
fill1.tags << ardyn
aranea = Tag.create! name: "aranea highwind"
noctis = Tag.create! name: "noctis lucis caelum"
prompto = Tag.create! name: "prompto argentum"
gladio = Tag.create! name: "gladiolus amicitia"
ignis = Tag.create! name: "ignis scientia"
regis = Tag.create! name: "regis lucis caelum"
violence = Tag.create! name: "violence"
fill1.tags.create! name: "improper use of the armiger"
fill1.tags.create! name: "ardyn being a dick"
fill1.tags.create! name: "regis makes a guest appearance"
fill1.tags.create! name: "(no he's not dead)"

fill2 = Fill.create!({
  prompt_id: prompt1.id,
  user_id: klyn.id,
  title: "Insomnia 99 pt.2",
  rating: "mature",
  body: "Another fill. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  })

fill2.tags << ffxv
fill2.tags << modern_au
fill2.tags << police
fill2.tags << comedy
fill2.tags << ardyn
fill2.tags << violence
fill2.tags << aranea
fill2.tags << noctis
fill2.tags << prompto
fill2.tags << gladio
fill2.tags << ignis
fill2.tags << regis
fill2.tags.create! name: "ardyn continues to be a dick"
prompt1.fills << fill1
prompt1.fills << fill2
