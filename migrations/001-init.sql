-- Up
CREATE TABLE groundhogs (
  id INTEGER PRIMARY KEY,
  slug TEXT NOT NULL UNIQUE,
  shortname TEXT,
  name TEXT,
  city TEXT,
  region TEXT,
  country TEXT,
  coordinates TEXT,
  source TEXT,
  contact TEXT,
  currentPrediction TEXT,
  isGroundhog BOOLEAN,
  type TEXT,
  active BOOLEAN,
  successor TEXT,
  description TEXT,
  image TEXT
);

CREATE TABLE predictions (
  id INTEGER PRIMARY KEY,
  slug TEXT,
  year INTEGER,
  shadow BOOLEAN,
  details TEXT,
  FOREIGN KEY(slug) REFERENCES groundhogs(slug),
  UNIQUE (slug, year)
);

/* Insert Groundhogs */
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (1, 'punxsutawney-phil', 'Phil', 'Punxsutawney Phil', 'Punxsutawney', 'Pennsylvania', 'USA', '40.9311988,-78.9622483', 'https://www.groundhog.org/history-past-predictions', '', 'https://www.stormfax.com/ghogday.htm', 1, 'Groundhog', '1','', 'Punxsutawney Phil is a superstar prognosticating groundhog from Punxsutawney, Pennsylvania. He makes his predictions from his burrow on Gobler’s Knob. According to legend, Phil has made weather prognostications since 1886, owing his improbably long life to the miraculous “groundhog nog” administered at the annual Groundhog Picnic.', 'https://groundhog-day.com/images/ghogs/punxsutawney-phil.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (2, 'octoraro-orphie', 'Orphie', 'Octoraro Orphie', 'Quarryville', 'Pennsylvania', 'USA', '39.8255413,-76.0919567', 'https://orphie.neocities.org', '', 'https://lancasteronline.com/news/local/octoraro-orphie-makes-his-groundhog-day-2026-prognostication-photos/collection_619cc484-6700-41ae-a57f-b3c8c07c4061.html', 0, 'Taxidermied groundhog', '1','', 'Octoraro Orphie, from Quarryville Pennsylvania, is a taxidermied world-renowned weather prognosticator and “One True Groundhog.” Other so-called groundhogs draw more celebrity endorsements, but Orphie is not distracted by the worldly pursuits of fame and fortune (at least partially due to his being stuffed and mounted). He is a sharp dresser, often spotted in his dapper top hat and bow tie.', 'https://groundhog-day.com/images/ghogs/octoraro-orphie.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (3, 'wiarton-willie', 'Willie', 'Wiarton Willie', 'Wiarton', 'Ontario', 'Canada', '44.7438686,-81.1386838', 'https://www.southbrucepeninsula.com/en/explore-and-play/wiarton-willie.aspx#Past-predictions', '', 'https://www.facebook.com/VirginRadioLondonCA/posts/pfbid0LWN1kgLZfpaXQwGuDgybCLN5w52PZ8YgGZPVaiZvusKMHTapfChHFrbp8UY9amdQl', 1, 'Groundhog', '1','', 'Wiarton Wille is Canada’s most famous prognosticating groundhog, from the town of Wiarton, Ontario. Willie is a white groundhog whose coming was foretold as one who would forever alter the world of weather prognostication. Every February 2nd, Willie announces his prediction in Groundhogese to The Mayor of the Land and of the Marmot, the only person who can speak Groundhogese.', 'https://groundhog-day.com/images/ghogs/wiarton-willie.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (4, 'jimmy-the-groundhog', 'Jimmy', 'Jimmy the Groundhog', 'Sun Prairie', 'Wisconsin', 'USA', '43.1826322,-89.2143204', 'https://www.cityofsunprairie.com/840/Groundhog-Day', 'visit@cityofsunprairie.com', 'https://www.facebook.com/cityofsunprairie/posts/pfbid0yCYH2qDcy6aKQN9LoAu3BharfX8C5WuKE2sxLTe92u2udbh4bouKdb4Kcfj8gMAHl', 1, 'Groundhog', '1','', 'Jimmy the Groundhog is based in Sun Prairie, Wisconsin, the proclaimed “World Headquarters of the Groundhog.” His annual emergence from the ground on February 2nd foretells the coming of spring. Jimmy has an extremely high accuracy rate on his annual predictions, making him an outstanding leader in meteorological circles. He occasionally bites mayors’ ears.', 'https://groundhog-day.com/images/ghogs/jimmy-the-groundhog.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (5, 'concord-charlie', 'Charlie', 'Concord Charlie', 'Athens', 'West Virginia', 'USA', '37.4245956,-81.0095902', 'https://www.concord.edu/?s=concord+charlie', '', 'https://www.facebook.com/reel/1437144027874392', 0, 'Presumed groundhog', '1','', 'Concord Charlie is a presumed groundhog from Athens, West Virginia. In a tradition dating back to 1978, Charlie meets with the President of Concord University and relays his predictions regarding the duration of winter. The President then joins a slew of guests at the University’s annual Groundhog Day Breakfast and shares Charlie’s predictions. Notably, Charlie has never been seen by anyone except the President and presumably other university staff; we believe him to be a groundhog based on these few eyewitness accounts.', 'https://groundhog-day.com/images/ghogs/concord-charlie.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (6, 'buckeye-chuck', 'Chuck', 'Buckeye Chuck', 'Marion', 'Ohio', 'USA', '40.6141291,-83.1321507,', 'https://en.wikipedia.org/wiki/Buckeye_Chuck#Past_predictions', '', 'https://clevelandmagazine.com/articles/buckeye-chuck-predicts-an-early-spring-in-2026/', 1, 'Groundhog', '1','', 'Buckeye Chuck is a weather-predicting groundhog in Marion, Ohio. In 1979, the Ohio legislature named Chuck the official groundhog for the Ohio state. Buckeye Chuck lives a comfortable, celebrity lifestyle — only working one day a year — but he doesn’t let the fame get to his head.', 'https://groundhog-day.com/images/ghogs/buckeye-chuck.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (7, 'general-beauregard-lee', 'Beau', 'General Beauregard Lee', 'Jackson', 'Georgia', 'USA', '33.233898,-83.9466163', 'https://twitter.com/genbeaulee', '', 'https://www.wrdw.com/2026/02/02/georgias-general-beauregard-lee-give-groundhog-day-prediction/', 1, 'Groundhog', '1','', 'General Beauregard Lee is Georgia’s Official Weather Prognosticator, considered the principal prognosticator for the southern USA. General Beau lives comfortably in his groundhog-sized mansion known as Weathering Heights, where he enjoys naps, digging tunnels, and hashbrowns.', 'https://groundhog-day.com/images/ghogs/general-beauregard-lee.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (8, 'french-creek-freddie', 'Freddie', 'French Creek Freddie', 'Upshur County', 'West Virginia', 'USA', '38.8573662,-80.3149827', 'https://wvdnr.gov/french-creek-freddie-facts-to-get-you-ready-for-groundhog-day/', '', 'https://www.facebook.com/susan.c.larrick/posts/pfbid028jUHcB5f96bHqbfcBiiHvDNRmRYRvCZQcj6yNu357eHdfycuuWBaQ9m2yrocb9qfl', 1, 'Groundhog', '1','', 'French Creek Freddie is a weather-predicting groundhog from Upshur County, West Virginia. Unlike his unseen state compatriot Concord Charlie, French Creek Freddie is a visible groundhog, who issues predictions annually from his home at the West Virginia State Wildlife Center.', 'https://groundhog-day.com/images/ghogs/french-creek-freddie.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (9, 'gertie-the-groundhog', 'Gertie', 'Gertie the Groundhog', 'Hanna City', 'Illinois', 'USA', '40.732973,-89.7383042', 'https://www.facebook.com/wildlifeprairiepark', '', 'https://www.facebook.com/john.c.ackerman/posts/pfbid02ooFeevZr2PRutFbeB13rCrkXSJ5YLQWmx5R8bHz8SJPMihj8TsPYoBuXk4DnSKyDl', 1, 'Groundhog', '1','', 'Gertie the Groundhog is a celebrated meteorologist from Wildlife Prairie State Park, Illinois. Since 1993, Gertie has been predicting the weather on February 2nd from her wildlife chalet, inspiring local musician Barry Cloyd to write the original, hit song “Wake-Up Gertie.”', 'https://groundhog-day.com/images/ghogs/gertie-the-groundhog.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (10, 'dunkirk-dave', 'Dave', 'Dunkirk Dave', 'Dunkirk', 'New York', 'USA', '42.4609398,-79.3944887', 'https://www.dunkirkdave.com', 'www.dunkirkdave.com/contact/', 'https://www.facebook.com/brenda.tarnowskiswanson/posts/pfbid09smB1BTvFgvq3hwAyC9tAS6Swgdzan8PCAuFg75phizjxQLzHNYKu5UN3EbycZzZl', 1, 'Groundhog', '1','', 'Dunkirk Dave, from Dunkirk, New York, is the second longest prognosticating groundhog in the world, second only to Punxsutawney Phil. His owner, Bob Will, has been handling and helping groundhogs and other wildlife since he was a child, making Will and Dave the perfect pairing. Dave loves breakfasting on cooked oatmeal.', 'https://groundhog-day.com/images/ghogs/dunkirk-dave.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (11, 'malverne-mel', 'Malverne Mel', 'Malverne Mel', 'Malverne', 'New York', 'USA', '40.6793192,-73.6665466', 'https://www.facebook.com/crossroadsfarmatgrossmanns', '', 'https://www.facebook.com/GroundhogNerd/posts/pfbid02NYrYdMKsX5Kt8mGfERvp8wMLc68xtHsHU9eoPgmLQTnzkj4YZrPw2qsP5qwWaAoil', 1, 'Groundhog', '1','', 'Groundhog Day with Malverne Mel is a tradition more than 2 decades old in Malverne, New York. Not happy with only predicting the weather, Mel is an art connoisseur and also hosts a poster contest. Mel is also a huge fan of the Bill Murray movie, “Groundhog Day.”', 'https://groundhog-day.com/images/ghogs/malverne-mel.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (12, 'staten-island-chuck', 'Chuck', 'Staten Island Chuck', 'New York City', 'New York', 'USA', '40.6251281,-74.1175587', 'https://en.wikipedia.org/wiki/Staten_Island_Chuck#Past_predictions', '', 'https://www.facebook.com/statenislandzoo/posts/pfbid0uDtVz2ri6BTGdTNva1G1oq92ZTbGAcVT7eGCJV2cxNPPC6oSjbc2udBK8frgerMul', 1, 'Groundhog', '1','', 'Staten Island Chuck — also known as Charles G. Hogg — is a resident groundhog at Staten Island Zoo in New York City. He is one of the most accurate groundhogs, with an 85% accuracy rate. Chuck bit the hand of Mayor Michael Bloomberg and was subsequently the victim of an alleged manslaughter by succeeding Mayor Bill De Blasio.', 'https://groundhog-day.com/images/ghogs/staten-island-chuck.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (13, 'lander-lil', 'Lil', 'Lander Lil', 'Lander', 'Wyoming', 'USA', '42.830629, -108.722943', 'https://www.facebook.com/BLMWyoming', '', 'https://cowboystatedaily.com/2026/02/02/lander-lil-does-not-see-her-shadow-ten-more-years-of-campaign-season/', 0, 'Statue of a prairie dog', '1','', 'Lander Lil, a bronze statue of a prairie dog, has been predicting the future of winter weather for Wyoming since 1984. There really was a real Lander Lil before the installation of a larger-than-life bronze statue, which stands lookout from her perch on the grounds of the local Post Office.', 'https://groundhog-day.com/images/ghogs/lander-lil.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (14, 'manitoba-merv', 'Merv', 'Manitoba Merv', 'Stonewall', 'Manitoba', 'Canada', '50.1738294,-97.1351477', 'https://x.com/OakHammockMarsh', '', 'https://www.facebook.com/reel/2054957635363651', 0, 'Groundhog golf club cover', '1','', 'Groundhog puppet Manitoba Merv has been predicting the arrival of spring at the Oak Hammock Marsh Interpretive Centre for about 25 years. Merv is a puppet — technically a golf club cover — which is a bonus, because he lives forever and doesn’t need to be awakened from hibernation for a prediction. Merv began his storied career as an actor in puppet shows, but has since evolved into a Manitoba legend with a near flawless prediction rate.', 'https://groundhog-day.com/images/ghogs/manitoba-merv.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (15, 'holtsville-hal', 'Hal', 'Holtsville Hal', 'Holtsville', 'New York', 'USA', '40.7967917,-73.0358701', 'https://www.facebook.com/brookhavenwildlifecenter', '', 'https://greaterlongisland.com/live-event-canceled-but-poetic-holtsville-hal-still-says-6-more-weeks-of-cold/', 1, 'Groundhog', '1','', 'Holtsville Hal is the true-blue, first-rate North American Groundhog for the proud residents of Holtsville, New York. Hal’s prognostications are presented by Superintendent of Highways Daniel P. Losquadro. (The hot drink of the event is “HALuccino!) Hal’s introductory jingle goes: “Will he see it or will he not? Trust Holtzville Hal, he’s who we’ve got.”', 'https://groundhog-day.com/images/ghogs/holtsville-hal.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (16, 'shubenacadie-sam', 'Sam', 'Shubenacadie Sam', 'Shubenacadie', 'Nova Scotia', 'Canada', '45.0921321,-63.397339', 'https://data.novascotia.ca/Lands-Forests-and-Wildlife/Shubenacadie-Wildlife-Park-Groundhog-Day-Predictio/4y37-h2yu', '', 'https://www.facebook.com/ShubenacadieWildlifePark/posts/pfbid026eaLqpb9SKSXNrpohoevP9XeYfqbL4J6P9AqBvaNKGLRgBKQkUYKBqo7s833f5rFl', 1, 'Groundhog', '1','', 'Shubenacadie Sam is a weather-predicting groundhog who resides at the Shubenacadie Wildlife Park in Nova Scotia. Living on the eastern edge of Canada, Sam makes the first prediction in North America every year at 8:00 am AST. Sam is active on Twitter and enjoys yoga and meditation.', 'https://groundhog-day.com/images/ghogs/shubenacadie-sam.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (17, 'woody-the-woodchuck', 'Woody', 'Woody the Woodchuck', 'Howell', 'Michigan', 'USA', '42.523758,-83.9529562', 'https://www.facebook.com/howellnaturecenter', '', 'https://www.facebook.com/howellnaturecenter/posts/pfbid02zgpDyiZQwvV1uWWf18PDK1Rmd9kG4qqPLt18esmgF1kBA4mdAYxx4CkRewEp1uYgl', 1, 'Groundhog', '1','', 'Woody the Woodchuck, Michigan’s official clairvoyant groundhog, has been prognosticating for over 2 decades. Unlike the ‘shadow’ technique used by most groundhogs, Woody’s forecast is determined by the time she spends outside on a ceremonial tree stump: 30 seconds or longer means an early spring, any less means a chilly six more weeks of winter.', 'https://groundhog-day.com/images/ghogs/woody-the-woodchuck.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (18, 'woodstock-willie', 'Willie', 'Woodstock Willie', 'Woodstock', 'Illinois', 'USA', '42.3142948,-88.4477184', 'https://www.facebook.com/WoodstockGroundhogDays/', 'bellairsrick@gmail.com', 'https://www.facebook.com/WoodstockGroundhogDays/posts/pfbid0RpmjMn51YVhbB34BJCwQ2QaVG6Fn7aa7Ju8hqdxo1cBWfmbm8upu25vBXYMADDuml', 1, 'Groundhog', '1','', 'Woodstock Willie is the official weather-predicting groundhog of Woodstock, Illinois. Woodstock is the filming location of the Bill Murray 1993 classic movie, “Groundhog Day”. Woodstock’s Groundhog Day ceremony is well attended, attracting with hundreds of spectators and featuring a Groundhog Polka Band.', 'https://groundhog-day.com/images/ghogs/woodstock-willie.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (19, 'mojave-max', 'Max', 'Mojave Max', 'Las Vegas', 'Nevada', 'USA', '36.1693608,-115.1906908', 'https://www.mojavemax.com/learn/meet-mojave-max/index.html', '', 'https://www.mojavemax.com/wp-content/uploads/2020/01/Emergence-History.pdf', 0, 'Desert tortoise', '1','', 'Mojave Max is a desert tortoise prognosticator who heralds spring’s arrival in Nevada. Groundhogs, who are famously not very accurate at making bets, avoid Las Vegas due to the heat and amount of money they would lose. Max, however, is right at home in the Nevada desert. Every year, Max enters a burrow to ‘brumate’ (hibernation for reptiles) throughout winter and emerges in the spring. Groundhog Day marks the start of “Mojave Max Watch,” a contest for elementary school students to guess the tortoise’s emergence date. Max’s emergence is “the preeminent indicator of spring-like weather in Southern Nevada and the west coast.” GROUNDHOG-DAY.com interprets Max’s predictions based on if he emerges on March 16 or later, which is 6 weeks after Groundhog Day.', 'https://groundhog-day.com/images/ghogs/mojave-max.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (20, 'schnogadahl-sammi', 'Sammi', 'Schnogadahl Sammi', 'Kresgeville', 'Pennsylvania', 'USA', '40.9014222,-75.497874', 'https://groundhoglodge.org/schedule/groundhog-lodge-number-6/', '', 'https://www.tnonline.com/20260202/sammi-6-more-weeks-of-winter-2/', 0, 'Taxidermied groundhog', '1','', 'Schnogadahl Sammi is a literally unpronounceable taxidermied groundhog mounted on a wooden plank who makes Groundhog Day predictions for Groundhog Lodge #6 near Kresgeville, Pennsylvania. The event was canceled in 2021 and 2022 due to the pandemic, but Sammi returned for a prediction in 2023. The prediction ritual starts with members of the lodge gathering around Sammi, and then giving a welcome, a prayer and a prediction in both English and Pennsylvania Dutch. When he is not the centre of attention on February 2nd, Sammi resides in the unbelievably-named community of Kunkletown.', 'https://groundhog-day.com/images/ghogs/schnogadahl-sammi.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (21, 'sir-walter-wally', 'Wally', 'Sir Walter Wally', 'Raleigh', 'North Carolina', 'USA', '35.7821867,-78.6414861', 'https://twitter.com/sirwalterw?lang=en', '', '', 1, 'Groundhog', '0','', 'Sir Walter Wally was the official prognosticating groundhog from Raleigh, North Carolina, where he lived at the Museum of Natural Sciences before retiring in 2023. While active, Wally was a media darling who was regularly featured on The Weather Channel’s list of national Groundhog Day representatives. He was also very active on Twitter where he would publish his predictions and subtweet Punxsutawney Phil.', 'https://groundhog-day.com/images/ghogs/sir-walter-wally.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (22, 'poor-richard', 'Richard', 'Poor Richard', 'York', 'Pennsylvania', 'USA', '39.9658603,-76.729263', 'https://www.facebook.com/ElksLodge213', '', 'https://www.wgal.com/article/pa-susquehanna-valley-local-groundhog-day-events/70191710', 0, 'Taxidermied groundhog', '1','', 'Poor Richard is a taxidermied groundhog who prognosticates for the Slumbering Groundhog Lodge, in York, Pennsylvania. The York Slumbering Groundhog Lodge prides itself on carrying on the tradition of recognizing the importance of the groundhog in predicting the weather for the remaining 6 weeks of winter. Very rarely has York’s “Poor Richard” been wrong.', 'https://groundhog-day.com/images/ghogs/poor-richard.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (23, 'balzac-billy', 'Billy', 'Balzac Billy', 'Balzac', 'Alberta', 'Canada', '51.1908339,-114.0008889', 'https://www.facebook.com/bluegrasscgy', '', 'https://discoverairdrie.com/articles/balzac-billy-has-made-his-groundhog-day-prediction-heres-what-it-means', 0, 'Person in a gopher suit', '1','', 'Balzac Billy is the “Prairie Prognosticator”, a man-sized gopher mascot who prognosticates weather on Groundhog Day from the town of Balzac, Alberta. Billy is not a real groundhog because groundhogs are not native to Alberta. Instead, Billy is more properly a Richardson Ground Squirrel (ie, a gopher) who lives in a man-sized burrow outside the Blue Grass Nursery & Garden Centre. Billy eats seeds, leaves, roots and flowers, as well as some insects, and of course his annual Groundhog Day Breakfast!', 'https://groundhog-day.com/images/ghogs/balzac-billy.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (24, 'uni-the-groundhog', 'Uni', 'Uni the Groundhog', 'Myerstown', 'Pennsylvania', 'USA', '40.4181266,-76.2999232', 'https://www.facebook.com/Grundsau-Lodsch-17-Om-Union-Kanal-598077903658052/', '', 'https://www.facebook.com/permalink.php?story_fbid=pfbid02eRViEc6sqNAqV9oeMNxF75oGrvENNG2rGbHXgfUFiKmyj4ppDzkaxVAfoEggukRsl&id=100068885919997', 0, 'Taxidermied groundhog', '1','', 'Every year on February 2nd, Myerstown’s favorite groundhog “Uni” is placed on a raft for a ceremonial ride down the Tulpehocken Creek.  After his ride, he makes his weather prediction for the next six weeks. Since 1981, the Union Kanaal Grundsau Lodsch No. 17 has hosted the ceremony, which is performed in both English and the Pennsylvania Dutch language.', 'https://groundhog-day.com/images/ghogs/uni-the-groundhog.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (25, 'grover-and-sue', 'Grover and Sue', 'Grover and Sue', 'Pine Grove', 'Pennsylvania', 'USA', '40.5716175,-76.3676593', 'https://www.facebook.com/SweetArrowLake', '', 'https://www.wgal.com/article/pa-susquehanna-valley-local-groundhog-day-events/70191710', 0, 'Taxidermied groundhogs', '1','', 'Grover the Groundhog and Sweet Arrow Sue are a taxidermied groundhog couple representing Groundhog Lodge no. 5, from Pine Grove, Pennsylvania. Grover met with tragedy in a roadside accident but doesn’t let that get in the way of his duties as a public figure. He is an ambassador for his species, he predicts the weather, and he promotes recycling because he is recycled. Grover Pinebush was officially married to Sweet Arrow Sue in 2011, making them only married groundhog couple in Pennsylvania.', 'https://groundhog-day.com/images/ghogs/grover-and-sue.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (26, 'ms-g', 'Ms. G', 'Ms. G', 'Lincoln', 'Massachusetts', 'USA', '42.4094032,-71.3339523', 'https://www.facebook.com/MassAudubonDrumlinFarm', '', 'https://www.facebook.com/MassAudubonDrumlinFarm/videos/1400844855098688', 1, 'Groundhog', '1','', 'Ms. G has been the official state groundhog of Massachusetts since 2014, after a successful nomination effort from Hunnewell Elementary School students. Ms. G has health issues that prevent her from living alone in the wild, but she fills her day with visiting schools and community groups in her role as an ambassador of the natural world.', 'https://groundhog-day.com/images/ghogs/ms-g.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (27, 'stormy-marmot', 'Stormy', 'Stormy Marmot', 'Aurora', 'Colorado', 'USA', '39.6890151,-104.8269175', 'https://marmotadventures.com/blog/', 'www.marmotadventures.com/php/mail_request.php?stormy', 'https://marmotadventures.com/blog/2026/02/02/groundhog-day-overcast-but-optimistic/', 0, 'Plush yellow-bellied marmot', '1','', 'Stormy Marmot is a plush yellow-bellied marmot from Aurora, Colorado. He is one of the few famous groundhogs west of the Mississippi. When he is not predicting the upcoming forecast, Stormy loves travelling the world (voyaging from Texas to Alaska to Hong Kong) and updating his fans on his various social media accounts.', 'https://groundhog-day.com/images/ghogs/stormy-marmot.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (28, 'chuckles-the-groundhog', 'Chuckles', 'Chuckles the Groundhog', 'Manchester', 'Connecticut', 'USA', '41.7555391,-72.5221167', 'https://www.facebook.com/LutzMuseum', '', 'https://www.facebook.com/LutzMuseum/posts/pfbid0KxajvU53fy4YLhq132vWDPWt5oCfP49FuaUGXKiuTgC9wboDPncUr26Rh1WjTA1nl', 1, 'Groundhog', '1','', 'Chuckles (XI) presides over the annual Groundhog Day ceremony in Connecticut. Before making his prediction, the 8-month-old groundhog was sworn in as the official state groundhog by the former town mayor, then whispered his prediction into the ear of current mayor. Chuckles comes from a long line of furry prognosticators and resides at the Lutz Children’s Museum, the traditional residence of the Chuckles’.', 'https://groundhog-day.com/images/ghogs/chuckles-the-groundhog.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (29, 'stonewall-jackson', 'Stonewall', 'Stonewall Jackson', 'Wantage', 'New Jersey', 'USA', '41.2109112,-74.6968543', 'https://www.facebook.com/spacefarms', '', 'https://www.facebook.com/spacefarms/posts/pfbid02vdaPRArsEqQ7f6SzXhH2CZYjjN8GfyqSVegMZhzEJ8vKKkRSq38DtMv7kPyoY1fcl', 1, 'Groundhog', '1','', 'Stonewall Jackson (VI) is a weather-predicting groundhog from Wantage, New Jersey, where he lives on Space Farms. Stonewall is still “in training” but he is from a proud prognosticating dynasty so he should have a leg up on other would-be weather-guessers.', 'https://groundhog-day.com/images/ghogs/stonewall-jackson.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (30, 'flatiron-freddy', 'Freddy', 'Flatiron Freddy', 'Boulder', 'Colorado', 'USA', '40.0247794,-105.2271559', 'https://twitter.com/boulderosmp', '', 'https://www.facebook.com/reel/1972908963609619', 0, 'Taxidermied yellow-bellied marmot', '1','', 'Flatiron Freddy is a top hat-wearing, yellow-bellied marmot who became a Groundhog Day weather prognosticator about a decade ago. Freddy is stuffed — not with the secret wisdom of unforetold weather events, but with actual stuffing, having died some years ago. Freddy generally chooses to arrive in style: sometimes flying in via zipline, rolling up in a monster truck, or sliding in on his snowboard.', 'https://groundhog-day.com/images/ghogs/flatiron-freddy.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (31, 'two-rivers-tunnel', 'Tunnel', 'Two Rivers Tunnel', 'Cape Breton', 'Nova Scotia', 'Canada', '45.9364617,-60.3005507', 'https://www.facebook.com/TwoRiversWildlifePark/', '', 'https://www.facebook.com/TwoRiversWildlifePark/posts/pfbid038FjKUEqe4bx9tA2oMC5mv1faeQxweXhWJZv9Aji2PSCCsoz7SEmL4CUeQHwJTNBpl', 1, 'Groundhog', '1','', 'Two Rivers Tunnel is the official prognosticator for Cape Breton, located in Two Rivers Wildlife Park. Tunnel the groundhog lives in a charming green house and speaks in a distinct Groundhogese dialect — most likely native to Cape Breton, where he has been making predictions for over 20 years.', 'https://groundhog-day.com/images/ghogs/two-rivers-tunnel.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (32, 'bee-cave-bob', 'Bob', 'Bee Cave Bob', 'Bee Cave', 'Texas', 'USA', '30.304515, -97.938430', 'https://twitter.com/beecavebob', '', 'https://cbsaustin.com/news/local/bee-cave-bob-does-not-see-his-shadow-predicting-early-spring', 0, 'Armadillo', '1','', 'Bee Cave Bob has helped Texans predict the early arrival of spring or the prolongment of winter since 2010. Bob is part of a Groundhog Day secessionist movement: with founder T. Booth rechristening it “Armadillo Day,” and stating “we don’t need no mangy groundhog in Pennsylvania predicting the weather for us.” In addition to weather forecasts, Bob also predicts the upcoming year’s partisan lean.', 'https://groundhog-day.com/images/ghogs/bee-cave-bob.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (33, 'chilly-charlie', 'Charlie', 'Chilly Charlie', 'Woodstock', 'Ontario', 'Canada', '43.124424,-80.7544241', 'https://www.facebook.com/southgatectr', '', 'https://www.facebook.com/permalink.php?story_fbid=pfbid02AHgKoaVVySzzqywfU3cufWdCYtErdUyVc7rXaMRJH7AAQZR9XM7LfB4nHrTmdGJXl&id=61551544226894', 0, 'Person in a groundhog suit', '1','', 'Chilly Charlie is a groundhog mascot who makes the annual Groundhog Day prediction for Woodstock, Ontario. Woodstock’s traditional Groundhog Day celebration/pancake breakfast started in 2003, and has in recent years been modified to a drive-through format.', 'https://groundhog-day.com/images/ghogs/chilly-charlie.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (34, 'fred-la-marmotte', 'Fred', 'Fred la Marmotte', 'Val-d’Espoir', 'Quebec', 'Canada', '48.5143473,-64.3996831', 'https://www.fredlamarmotteofficielleduquebec.ca', '', 'https://montrealgazette.com/news/weather/montreals-groundhog-day-weather-fred-la-marmotte-predicts-and-early-spring', 1, 'Groundhog', '1','', 'Fred la marmotte is a prognosticating Quebecois groundhog from Val-d’Espoir in the Gaspésie, Quebec. While a previous Fred unexpectedly resigned in 2023, in 2024 we were introduced to “the new Fred,” who (it is claimed) is “better than any other groundhog.” When he’s not making weather predictions, he likes to dig around and explore in his summer and winter enclosures. Fred is unique in being the only weather-predicting groundhog whose habitat is located on a World Heritage Site, the “[Géoparc mondial UNESCO de Percé](https://www.tourisme-gaspesie.com/fr/culture-et-histoire-vivante/geoparc-mondial-unesco-de-perce/).”', 'https://groundhog-day.com/images/ghogs/fred-la-marmotte.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (35, 'middlemiss-mike', 'Mike', 'Middlemiss Mike', 'Melbourne', 'Ontario', 'Canada', '42.8156259,-81.5525152', 'https://www.facebook.com/groups/1007977346248663', 'asplitvillageatacrossroad@gmail.com', 'https://www.facebook.com/permalink.php?story_fbid=pfbid0zpgM1XoMDqSDbEjU2Yd5CCtZGSarcFd4HavKdfN4yCj4jaQuKjmidcY8tSCW2YLjl&id=61556016196661', 0, 'Plush prairie dog', '1','', 'Middlemiss Mike is a plush prairie dog prognosticator from Melbourne, Ontario. Jack Galbraith (pictured) started the event in 2007, remarking that weather predictions in faraway Punxatawney aren’t typically accurate in Ontario. Mike’s family grew over the years: in 2008 he met Melbourne Minnie, and in the following years they were blessed with children and friends: Little Wolfe, Maple, Leaf, Alby, and Bobby Jo. JoAnn Galbraith (Jack’s wife) carries on the now-famous tradition with the local village to help pass the winter blues.', 'https://groundhog-day.com/images/ghogs/middlemiss-mike.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (36, 'snohomish-slew', 'Slew', 'Snohomish Slew', 'Snohomish', 'Washington', 'USA', '47.812527,-122.3818957', 'https://www.facebook.com/Thefrogturtlerescuelady/', 'thefroglady@justfrogsfoundation.org', 'https://www.facebook.com/Thefrogturtlerescuelady/posts/pfbid02H7PJq4KToY4kemB3QLeYLNFfkPwXLLVPXB8UPFoLFTaADJYaPg8kczyZLKqcyqX7l', 0, 'Bullfrog', '0','', 'Snohomish Slew, a frognosticating bullfrog, once hosted the annual Groundfrog Day weather forecast in downtown Snohomish, prompting much rejoicing. From Thayer Cueter, Slew’s handler: “The pinnacle celebration moment [was] when Slew whispered his frogcast to his favourite scribe in Groundfrogese. [The] gathered crowd was ribbeted(!) by every transcribed word from Slew as he accurately predicted our winter weather fate for six more weeks.”', 'https://groundhog-day.com/images/ghogs/snohomish-slew.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (37, 'beardsley-bart', 'Bart', 'Beardsley Bart', 'Bridgeport', 'Connecticut', 'USA', '41.2097196,-73.1843214', 'https://www.facebook.com/ConnecticutsBeardsleyZoo', 'info@beardsleyzoo.org', 'https://www.facebook.com/reel/1238438944918680', 0, 'Prairie dog', '1','', 'Beardsley Bart is the principal prognosticating prairie dog at Connecticut’s Beardsley Zoo. His official title is Senior Spring Arrival Specialist. Every year, Beardsley Bart says that spring is coming eventually, and he has always been 100 percent correct.', 'https://groundhog-day.com/images/ghogs/beardsley-bart.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (38, 'potomac-phil', 'Phil', 'Potomac Phil', 'Washington', 'District of Columbia', 'USA', '38.9097387,-77.043891', 'https://x.com/PotomacPhil', 'x.com/PotomacPhil', 'https://x.com/PotomacPhil/status/2018319128377880758', 0, 'Taxidermied groundhog', '1','', 'Potomac Phil is Washington, DC’s most famous marmot, celebrated for his dual predictions of both the weather and the political climate. Though he is now taxidermied, his eternal pose — clutching a corn cob amid a scattering of additional cobs — has sparked widespread speculation about his affinity for corn. His lively corn-related tweets only fuel this perception. Phil’s handlers have remarked that they’re on a quest for a “magic elixir” to reanimate him back to life. Until that day comes, their decisions rely on carefully interpreting his ‘non-verbals:’ eye contact, facial expressions, posture, and the intensity of his ever-watchful gaze.', 'https://groundhog-day.com/images/ghogs/potomac-phil.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (39, 'sand-mountain-sam', 'Sam', 'Sand Mountain Sam', 'Albertville', 'Alabama', 'USA', '34.1666754,-86.1192772', 'https://www.facebook.com/105wqsb/', '', 'https://whnt.com/news/newsletter-email-headlines/sand-mountain-sam-predicts-an-early-spring/?fbclid=IwY2xjawPtrz5leHRuA2FlbQIxMABicmlkETE0Wk9ya1lYOXZHYVZZMktVc3J0YwZhcHBfaWQQMjIyMDM5MTc4ODIwMDg5MgABHsDG7h1YBGG4BJO-keb4mxqOfRLwEU5wSMCN4KvvGdM4o95tjcM-4ZCXmj7B_aem_cRCgwjaCrEUmL6niCY7Tdw', 0, 'Opossum', '1','', 'Sand Mountain Sam is a legendary prognosticating opossum from Albertville, Alabama, who has been making predictions for over a decade. In 2020, the state game warden nearly cancelled the tradition (usually, having a possum as a pet is against the law), but in 2022 Sam returned, emerging from a whiskey barrel to predict an early spring.', 'https://groundhog-day.com/images/ghogs/sand-mountain-sam.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (40, 'bowman-bill', 'Bill', 'Bowman Bill', 'Stephens City', 'Virginia', 'USA', '39.1014751,-78.1945146', 'https://www.handleyregional.org/GroundhogDay', '', 'https://www.facebook.com/handleyregional/posts/pfbid0Gebb3UCfMMdWrKnKpBuNPsbTzCwvYd5vrfJe1X7CzxxptHYpq4sfVnsbwBTfCnual', 0, 'Groundhog puppet', '1','', 'Bowman Bill is the resident puppet prognosticator at Bowman Library, in Stephens City, Virginia. Bill’s Groundhog Day ceremony includes awards, crafts, stories and ice cream: if Bill sees his shadow, the ice cream is topped with chocolate sauce. Not one to hog the limelight, Bill shares his Groundhog Day with two live groundhogs, Tiva and Luna, who come to the library to observe Bill’s technique first hand.', 'https://groundhog-day.com/images/ghogs/bowman-bill.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (41, 'buffalo-bert', 'Bert', 'Buffalo Bert', 'Buffalo', 'New York', 'USA', '42.7245868,-78.6732692', 'https://www.buffalogroundhogday.com', 'buffalogroundhogday@gmail.com', 'https://www.facebook.com/buffalogroundhogday/posts/pfbid032FgF36roWeqeSjnAZy9X6mrwUE32HaMVsxuVLwqVQrJkDiC5WcLtdoCTjCZueJU1l', 1, 'Groundhog', '1','', 'Buffalo Bert is the official prognosticating groundhog for the city of Buffalo, New York, residing at the Hawk Creek Wildlife Refuge. Bert is the world’s most accurate weather prognosticator with a 100% accurate prediction rate. He was rescued as an orphan and now embraces serving the public. “Bert is a survivor, and was rescued for a reason,” says Tanya Lowe, Director of Wildlife Education, “Now he’s a Buffalo ambassador.” Like the fine citizens of Buffalo, Bert fears no weather and has never met a party he didn’t like.', 'https://groundhog-day.com/images/ghogs/buffalo-bert.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (42, 'dover-doug', 'Doug', 'Dover Doug', 'Dover Township', 'Pennsylvania', 'USA', '39.9979137,-76.8571679', 'https://www.linkedin.com/in/dover-doug/', '', 'https://www.facebook.com/VoteMargetas/posts/pfbid02MesUQt59cYaNUk5RWeSkdV9qWZWiXXEW25UVYaWNn9ncnV6X5ivv4nRYQSNKes2ol', 0, 'Person in a groundhog suit', '1','', 'Dover Doug is a groundhog mascot who makes an annual Groundhog Day prediction in Pennsylvania’s Dover Township. Unlike traditional groundhogs, Doug doesn’t use his shadow, but rather an ‘interpretive dance’ Groundhogese variation (featuring hand movements, wiggles and head shakes) to deliver his prognostication to the attendant Burrow Master and Shadow Keeper. And with great results: a prior Burrow Master said Doug “has been making predictions for about 30 years and has always been 100 percent accurate.”', 'https://groundhog-day.com/images/ghogs/dover-doug.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (43, 'fenwick-flossie', 'Flossie', 'Fenwick Flossie', 'Pelham', 'Ontario', 'Canada', '43.0208392,-79.3629854', 'https://www.facebook.com/fabulousfenwicklions/', '', 'https://www.facebook.com/reel/905744578861125', 0, 'Person in a groundhog suit', '1','', 'Fenwick Flossie is an adult-sized groundhog mascot organized by the local Lion’s Club in Fenwick, Ontario. Flossie is a non-gender mascot, given life by an octogenarian Lion’s club member who has suited up for the role each year for nearly three decades. The club prefers to not release the person’s identity to protect the mystery of who is channelling the woodchuck spirit.', 'https://groundhog-day.com/images/ghogs/fenwick-flossie.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (44, 'lawrenceville-lucy', 'Lucy', 'Lawrenceville Lucy', 'Lawrenceville', 'Pennsylvania', 'USA', '41.9735597,-77.201705', 'https://www.facebook.com/LawrencevilleLucy', '', 'https://www.facebook.com/LawrencevilleLucy/posts/pfbid02SdjPvwM39hoymf7RMe9P4D2Cavgr6496ko9nWw68EaQ8sp8vdB3JknScBNHKbn8vl', 1, 'Groundhog', '1','', 'Lawrenceville Lucy is a wild groundhog living in a burrow overlooking Cowanesque Lake near Lawrenceville, Pennsylvania. Every year on February 2nd, she gives a very spirited prediction and updates her Facebook page with the news. Uncommonly in wild groundhogs, Lucy is partial to hot chocolate with marshmallows and chocolate sprinkles, but doesn’t let it interfere with her work of making accurate, unbiased predictions. ', 'https://groundhog-day.com/images/ghogs/lawrenceville-lucy.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (45, 'mount-joy-minnie', 'Minnie', 'Mount Joy Minnie', 'Mount Joy', 'Pennsylvania', 'USA', '40.1091208,-76.5043106', 'https://www.facebook.com/mountjoychamber', '', 'https://www.facebook.com/reel/915245024298933/', 0, 'Plush groundhog', '1','', 'Mount Joy Minnie is a plush groundhog who makes an annual weather prediction for Mount Joy, Pennsylvania. She wakes up bright and early each February 2 to host a hot chocolate, coffee, and doughnut breakfast at the town clock, where her handlers read her official proclamation and judge a fun hat contest. Minnie also loves visiting events and businesses throughout the community. You can watch her adventures on YouTube at https://www.youtube.com/@MountJoyChamber/shorts.', 'https://groundhog-day.com/images/ghogs/mount-joy-minnie.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (46, 'patty-pagoda', 'Patty', 'Patty Pagoda', 'Reading', 'Pennsylvania', 'USA', '40.33607,-75.9078327', 'https://www.facebook.com/thereadingpagoda', '', 'https://www.facebook.com/thereadingpagoda/posts/pfbid023v15aK5HbtqhrUfyNG6vVGB7giaUf9HoWCr4RGzuuxjsfzvKj4fwE7aSV17LbR7zl', 0, 'Person in a groundhog suit', '1','', 'Miss Patty Pagoda, a groundhog mascot with a glamourous hair bow, is the official prognosticator for Reading, Pennsylvania. Patty lives in her burrow on Mount Penn next to the picturesque Reading Pagoda and is passionate about predicting the weather and preventing litter. Patty has been prognosticating at the Pagoda since 2006, braving the seasonal cold and fog to deliver critical far-sighted forecasts.', 'https://groundhog-day.com/images/ghogs/patty-pagoda.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (47, 'polk-county-paula', 'Paula', 'Polk County Paula', 'Des Moines', 'Iowa', 'USA', '41.5830468,-93.6206605', 'https://www.facebook.com/HighLifeLounge', 'info@thehighlifelounge.com', 'https://www.facebook.com/reel/25714029904927441', 0, 'Person in a groundhog suit', '1','', 'Polk County Paula is Des Moines’ resident groundhog who regales fans with her annual prediction at the High Life Lounge’s Annual Groundhog Day Celebration. Every year on February 2nd groundhog enthusiasts line up before 5am to be first in line for FREE Miller High Life breakfast beer given out from 6-8 am. Paula’s annual prediction happens at sunrise, closely followed by regional meteorologists. Paula makes a grand entrance from her beer-case burrow, where she hibernates throughout the colder winter months!', 'https://groundhog-day.com/images/ghogs/polk-county-paula.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (48, 'scramble-the-duck', 'Scramble', 'Scramble the Duck', 'Eastford', 'Connecticut', 'USA', '41.901251,-72.0815198', 'https://scrambletheduck.org', '', 'https://scrambletheduck.org/news/2026/02/02/scramble-predicts-more-winter/', 0, 'Pekin duck', '1','', 'Scramble the Duck is a prognosticating Pekin duck from Eastford, Connecticut who makes an official prediction on “Duck Day” every February 2nd. Billed as “an accurate alternative to the groundhog,” Scramble has an impressive perfect record of weather prognostications. According to his website, “Scramble can predict the weather because he has the most superior education,” in addition to the innate fact that ducks “live above ground, [so] they know more about the weather.”', 'https://groundhog-day.com/images/ghogs/scramble-the-duck.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (49, 'snerd', 'Snerd', 'Snerd', 'Garner', 'North Carolina', 'USA', '35.6800912,-78.6279155', 'https://www.facebook.com/GarnerParksRecreationAndCulturalResources', '', 'https://www.facebook.com/reel/4598585890368717/', 1, 'Groundhog', '1','', 'Snerd is a groundhog prognosticator who gives an annual prediction from White Deer Park, in Garner, North Carolina. North Carolina’s roster of true groundhog prognosticators has dwindled to just Snerd — Garner’s official prognosticator since 2015 — but he is in good company with Pisgah Piper, a white squirrel, and Sylvia the armadillo. According to Snerd’s translator from wildlife rehabilitation organization CLAWS, Snerd spends weeks conferring with Mother Nature, the Farmer’s Almanac, and the Weather Channel to get precise information before making his yearly prediction.', 'https://groundhog-day.com/images/ghogs/snerd.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (50, 'tinicum-tim', 'Tim', 'Tinicum Tim', 'Philadelphia', 'Pennsylvania', 'USA', '39.8921524,-75.2572137', 'https://www.facebook.com/johnheinznwr', 'wingyi_kung@fws.gov', 'https://www.facebook.com/reel/925178566564235/', 0, 'Groundhog puppet', '1','', 'Tinicum Tim is a groundhog puppet who (usually) makes an annual weather prediction for the John Heinz National Wildlife Refuge in Philadelphia, Pennsylvania. Tim is the star of the shadow ceremony, but he couldn’t do it without the support of his wife, Tinicum Tina, and their children, the Tinicum twins. Other activities at the wildlife refuge during the Groundhog Day Festival include songs, crafts, and light snacks and refreshments.', 'https://groundhog-day.com/images/ghogs/tinicum-tim.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (51, 'wildwood-willie', 'Willie', 'Wildwood Willie', 'Toledo', 'Ohio', 'USA', '41.6818106,-83.6675126', 'https://www.facebook.com/MetroparksToledo', 'metroparkstoledo.com/contact', 'https://www.facebook.com/MetroparksToledo/posts/pfbid02CCJrat3CR2GJERzoSKEu7J5EJGxnXFmUvkTqYr8b61rjLNmZkGCCqU2Sy8LdDroul', 0, 'Taxidermied groundhog', '1','', 'Wildwood Willie is a taxidermied groundhog who hosts a “Groundhogs Day” event every year at Ohio’s Wildwood Preserve Metropark. In addition to impressing attendees with his weather-predicting powers and his cute outfits, Willie’s prediction is preceded by gleeful groundhog stories, songs, crafts, games, and a nature walk through a typical groundhog habitat. Celebrate the lore and legend of Groundhogs Day with Wildwood Willie!', 'https://groundhog-day.com/images/ghogs/wildwood-willie.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (52, 'chesapeake-chuck', 'Chuck', 'Chesapeake Chuck', 'Newport News', 'Virginia', 'USA', '37.0699814,-76.4818192', 'https://www.facebook.com/VirginiaLivingMuseum', '', 'https://www.facebook.com/VirginiaLivingMuseum/posts/pfbid0GikG9wEzntad8L77XBtJgfXrS3EB9PifSGeEcUV3vyYesD9AECMfGiVhgcVLfGHdl', 1, 'Groundhog', '1','', 'Chesapeake Chuck is Virginia Living Museum’s furry prognosticator of prognosticators, hailing from Newport News, VA. Not just limited to weather predictions, Chuck is also able to foresee the winner of the Super Bowl. In order to stay in tip-top shape, Chuck dines on “restaurant quality” carrots and sweet potatoes.', 'https://groundhog-day.com/images/ghogs/chesapeake-chuck.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (53, 'benny-the-bass', 'Benny', 'Benny the Bass', 'Buckeye Lake', 'Ohio', 'USA', '39.9335365,-82.501816', 'https://www.facebook.com/BuckeyeLakeWinterfest', 'buckeyelakeregioncc@gmail.com', 'https://www.facebook.com/BuckeyeLakeWinterfest/posts/pfbid02aoNgrCiHyK28L9j6HSrtLioKQUgYk49whJsyz7NuxYNbNiop6NtaDjPxPfVx8mrhl', 0, 'Largemouth bass', '1','', 'Benny the Bass is a foreseeing fish whose annual weather prediction kicks off Winterfest in Buckeye Lake, Ohio. Unlike the traditional ‘shadow’ method preferred by landgoing prognosticators, Benny’s prediction is based on his breakfast. “I pour a bunch of minnows into this big tank with a live bass,” says Mike Fornataro, Chair of Winterfest, “Then people chant, Take the bait, spring can’t wait.’ The bass has three minutes to eat a minnow. If he does, it’s an early spring. If he doesn’t, it’s six more weeks of winter.”', 'https://groundhog-day.com/images/ghogs/benny-the-bass.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (54, 'harleysville-hank', 'Hank', 'Harleysville Hank', 'Harleysville', 'Pennsylvania', 'USA', '40.290503,-75.3823447', 'https://www.facebook.com/harleysvillehank/', '', 'https://www.facebook.com/harleysvillehank/posts/pfbid02nWmi9UCT3ApmBzRcTc1hd3TaeBukKgLxAm8rGkkP8SbCsqoNjs2qz6dky3HDgZYal', 0, 'Plush groundhog', '1','', 'Harleysville Hank is a plush groundhog who makes an annual prediction at the Mennonite Heritage Center in Harleysville, Pennsylvania. While it is hard to believe there could be anyone who doesn’t know about Harleysville Hank, his Facebook page says he enjoys tunnelling, and speaks Pennsylvania Dutch. Under awards, Hank has listed “Best Groundhog. Ever.” Hank’s Groundhog Day festivities include free coffee, hot chocolate, and kettle-cooked scrapple. In 2023, Hank became engaged to Harleysville Hannah.', 'https://groundhog-day.com/images/ghogs/harleysville-hank.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (55, 'yahdee-the-groundhog', 'Yahdee', 'Yahdee the Groundhog', 'Orefield', 'Pennsylvania', 'USA', '40.6366749,-75.6180799', 'https://groundhoglodge.org/schedule/groundhog-lodge-number-16/', '', 'https://www.mcall.com/2026/02/02/lehigh-valley-groundhog-day-2026-yahdee-wehrs-dam-photos/', 0, 'Taxidermied groundhog', '1','', 'Yahdee the groundhog is a taxidermied groundhog and official prognosticator for the Groundhog Lodge No. 16 in Orefield, Pennsylvania. As a taxidermied groundhog, Yahdee can be a bit stiff in the cold February mornings, which is why he prefers rafting down the Jordan river or sleighing up to the ceremony with his nephew, Lee. Yahdee may only be 16 but his very distinguished top hat makes him look more grown up. Yahdee’s Groundhog Day predictions are a sight to behold, attracting attendees from as far away as Kutztown and Schnecksville.', 'https://groundhog-day.com/images/ghogs/yahdee-the-groundhog.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (56, 'boise-bill', 'Bill', 'Boise Bill', 'Boise', 'Idaho', 'USA', '43.6078333,-116.2049143', 'https://www.facebook.com/zooboise', 'jagosta@cityofboise.org', 'https://www.facebook.com/zooboise/posts/pfbid02mzzjCbDZn9jBgZESpB9NxowgVcJcupCfNCHPjC1zEoNZdFKPEm5yhsRst9wevJ4zl', 0, 'Plush prairie dog', '0','', 'Boise Bill is a plush prairie dog from Boise, Idaho. For many years, Bill was a staple in predicting the weather in Boise, however, he now on an indefinite sabbatical. Here is his statement: “Honestly, it’s a lot of stress having the whole world depend on you to predict the weather and I needed to take a break. I’ve really been enjoying my time out of the spotlight and have been focusing on Zoo Boise’s Conservation Fund. I have a beautiful corner office in my burrow and spend most of my day helping zoo staff come up with innovative ways to raise money to help protects animals all over the world.”', 'https://groundhog-day.com/images/ghogs/boise-bill.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (57, 'big-al', 'Al', 'Big Al', 'Beaumont', 'Texas', 'USA', '29.9295431,-94.2743348', 'https://www.facebook.com/gatorcountryrescue/', '', 'https://www.12newsnow.com/article/news/local/will-gator-countrys-big-al-agree-with-groundhog-punxsutawney-phil/502-a3e87306-f587-4330-8c03-daf66d3a4772', 0, 'Alligator', '1','', 'Big Al is a 92-year old, 1,000 pound, 13.4-foot alligator prognosticator from Beaumont, Texas. On February 2, Al is offered a chicken breast to chow down on. According to his owner, Gary Saurage, ”If this alligator eats, that means we are done with winter. If he doesn’t, don’t bring your swimsuits out yet.” While groundhogs have a spotty record of predictions, “alligators tell the truth. They’ve been around for millions and millions of years. That’s why we truly believe alligators know when to eat.” Perhaps unfairly, considering Al’s record-setting heft, Saurage insists that there is no need to check with an ‘overgrown hedgehog.’', 'https://groundhog-day.com/images/ghogs/big-al.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (58, 'smith-lake-jake', 'Jake', 'Smith Lake Jake', 'Smith Lake', 'Alabama', 'USA', '34.7159524,-86.5418817', 'https://www.facebook.com/smithlakejake.zgroundhog', '', 'https://thebamabuzz.com/alabamas-trio-of-groundhog-day-prognosticators-speak-did-they-predict-an-early-spring/?fbclid=IwY2xjawIO-iFleHRuA2FlbQIxMQABHQ12wE02eWNTnje3p8wbnEK2P_oChRDzHyYS7YgIqH3rVOl791FXnimqCA_aem_ljxWv5nIvPYU2jf4k4H5Vg', 1, 'Groundhog', '0','', 'Smith Lake Jake, weather prophet extraordinaire, was once Alabama’s true weather forecasting groundhog. Unlike other groundhogs, Smith Lake Jake’s method relied on whether the hairs on his back were bristled or relaxed. Much more civilized than other groundhogs, Jake is a house groundhog who likes cereal, spaghetti, Keebler Pecan Sandies, and — of course — Groundhog Day!  Jake appeared onscreen as “Colt Lake Jake” in the 2025 movie “[Bad Man](https://www.imdb.com/title/tt30057173/)” starring Seann William Scott, but now prefers the quiet life. Jake maintains an impressive hat collection.', 'https://groundhog-day.com/images/ghogs/smith-lake-jake.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (59, 'snowy-the-prairie-dog', 'Snowy', 'Snowy the Prairie Dog', 'Pend Oreille County', 'Washington', 'USA', '48.5224835,-117.8912722', 'http://www.climatehawk.org/groundhog.html', '', 'http://www.climatehawk.org/groundhog.html', 0, 'Prairie dog', '0','', 'Snowy the Prairie Dog made an annual weather prediction from Pend Oreille Country, Washington. Snowy and Flurries were a tag-team of prognosticating prairie dogs with their very own website and an impressive accuracy rating. Bob Lutz, traffic broadcaster for 920 News Now, maintained their list of historical predictions as well as an “Accuracy Score” for each year: a level of accountability that few other prognosticators can meet.', 'https://groundhog-day.com/images/ghogs/snowy-the-prairie-dog.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (60, 'van-island-violet', 'Violet', 'Van Island Violet', 'Nanaimo', 'British Columbia', 'Canada', '49.159641,-124.0503748', 'https://www.facebook.com/MarmotRecovery/', '', 'https://www.facebook.com/reel/2279870519485520', 0, 'Vancouver Island marmot', '1','', 'Van Island Violet is a prognosticating marmot from Vancouver Island whose predictions are meticulously interpreted by the Marmot Recovery Foundation in Nanaimo, British Columbia. There are four species of marmots in Canada, but only the Vancouver Island Marmot (Marmota vancouverensis) is considered at risk. Adam Taylor, executive director of the nonprofit, believes that “a Vancouver Island marmot would be a better weather prognosticator for Vancouver Island than some Eastern marmot that has never been west of the Rockies.”', 'https://groundhog-day.com/images/ghogs/van-island-violet.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (61, 'charles-winchester', 'Chuck', 'Charles “Chuck” Winchester', 'Woodburn', 'Indiana', 'USA', '41.1303246,-84.8633726', 'https://www.facebook.com/profile.php?id=100064403303425', 'beth@indianawild.org', 'https://www.facebook.com/MCFeeds/videos/881129721566222', 1, 'Groundhog', '1','', 'Charles Winchester (a.k.a. Chuck) is a the resident animal ambassador for Indiana Wild, an animal conservatory in Woodburn, Indiana. Similar to a rock star, Chuck travels around the state doing highly anticipated prognostications, and is regularly covered by local media. Chuck typically prognosticates from inside of a magical tree stump which feeds his creative energies, and sometimes moonlights as a pumpkin.', 'https://groundhog-day.com/images/ghogs/charles-winchester.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (62, 'chuck-wood', 'Chuck', 'Chuck Wood', 'Quincy', 'California', 'USA', '39.9362979,-120.9523743', 'https://www.quincychamber.com/groundhog-fever-festival', '', 'https://plumassun.org/2026/02/06/groundhog-fever-festival-returns-to-quincy-tomorrow/', 0, 'Animatronic groundhog', '1','', 'Chuck Wood is an animatronic groundhog seer who makes a yearly Winter Prediction at the Groundhog Fever Festival in Quincy California. In addition to his predictive powers, Chuck is a pillar of the community, helping out in kitchens, construction sites, chemistry classes, and always filing his taxes on time. Chuck’s other passion, eating chili, inspired the chili cook-off: a fitting activity for a chilly February fest.', 'https://groundhog-day.com/images/ghogs/chuck-wood.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (63, 'concord-casimir', 'Casimir', 'Concord Casimir', 'Concord', 'Ohio', 'USA', '41.6904499,-81.2526303', 'https://www.facebook.com/CasimirCleveland', 'John.niedzialek@gmail.com', 'https://clevelandmagazine.com/articles/concord-casimir-s-annual-winter-weather-prediction-the-cold-continues/?fbclid=IwY2xjawPtlfpleHRuA2FlbQIxMABicmlkETFMMXdRMDc0bDN1Vk1LV21jc3J0YwZhcHBfaWQQMjIyMDM5MTc4ODIwMDg5MgABHqJtFcsRXheJ1A7tRSTTs68Vp1b94YnfpwiTv9W2cDne-gRt_YGaft3j6C52_aem_phKd_6yT7oggp-aRlPqe5g', 0, 'Cat', '1','', 'Concord Casimir is an orange cat who makes an annual prediction at Ellison Creek Knob in Concord, Ohio. Casimir — aka, The Polish Prince of Felines — was found abandoned as a kitten on the footsteps of Cleveland’s St. Casimir Polish Church in 2012. Master of Ceremonies John Niedzialek interprets Casimir’s forecast based on the way he eats his yearly pierogis. If he eats them sloppily, Cleveland is in for a long, messy spring; if Casimir eats them normally, then it’s winter as usual; and if he swallows the pierogis in one gulp, the region can look forward to a warm coming summer. Since Casimir’s predictions are a little unconventional, we try our best to fit them into the “spring/winter” dichotomy we prefer on GROUNDHOG-DAY.com.', 'https://groundhog-day.com/images/ghogs/concord-casimir.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (64, 'oil-springs-ollie', 'Ollie', 'Oil Springs Ollie', 'Oil Springs', 'Ontario', 'Canada', '42.7669782,-82.1832562', 'https://www.facebook.com/profile.php?id=100068618865920', '', '', 1, 'Groundhog', '0','heavens-wildlife-harvey', 'Oil Springs Ollie was a famous prognosticating groundhog from Oil Springs, Ontario. Ollie came from humble roots, arriving at the Heaven’s Wildlife Rescue as a baby and turning his inspirational story into his career as an educator. Ollie made his first public prediction in 2014, which launched his career as an animal educator and advocate. Ollie was remembered for being laid-back and easygoing, and worked with an understudy, Harvey, in his later years. Ollie retired in 2021.', 'https://groundhog-day.com/images/ghogs/oil-springs-ollie.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (65, 'athene-the-burrowing-owl', 'Athene', 'Athene the Burrowing Owl', 'Cape Coral', 'Florida', 'USA', '26.574715,-81.9836809', 'https://www.facebook.com/profile.php?id=100064565954545', '', 'https://www.gulfcoastnewsnow.com/article/cape-corals-ground-owl-day-winter/70223532', 0, 'Person in an owl suit', '1','', 'Athene is the burrowing owl mascot and official prognosticator of Ground Owl Day every year for Cape Coral, Florida. Ground Owl Day is hosted by the Cape Coral Friends of Wildlife (CCFW) who help to protect local wildlife. Similar to most prognosticating groundhogs, if Athene sees her shadow, winter lingers; if not, spring is on its way. Athene is a bit of a social media phenom as she loves getting her photo taken with guests, whereas most burrowing owls prefer that guests stay 10 feet away.', 'https://groundhog-day.com/images/ghogs/athene-the-burrowing-owl.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (66, 'cluxatawney-henrietta', 'Henrietta', 'Cluxatawney Henrietta', 'Katonah', 'New York', 'USA', '41.2634599,-73.7307821', 'https://www.facebook.com/muscootfarm/', '', 'https://patch.com/new-york/yorktown-somers/muscoot-farms-cluxatawney-henrietta-makes-eggs-asperating-groundhog-day', 0, 'Ameraucana chicken', '1','', 'Cluxatawney Henrietta is an Ameraucana chicken who makes a Groundhog Day prediction from Muscoot Farm in Katonah, New York. Farm curator Jonathon Benjamin says, “We don’t have a groundhog on the farm, so we use the next best thing – Henrietta, our weather predicting chicken.” Unlike the conventional ‘shadow’ method used by most Groundhog Day forecasters, Henrietta’s prediction is based on the “scientifically sound and proven methodology” of whether she lays an egg on the morning of February 2nd.', 'https://groundhog-day.com/images/ghogs/cluxatawney-henrietta.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (67, 'featherstone-the-flamingo', 'Featherstone', 'Featherstone the Flamingo', 'Leominster', 'Massachusetts', 'USA', '42.5257192,-71.7624977', 'https://www.facebook.com/leominstercommunitydevelopment', '', 'https://www.sentinelandenterprise.com/2026/02/03/featherstone-declares-an-early-spring-in-leominster/', 0, 'Plastic lawn ornament', '1','', 'Featherstone the Flamingo is a pink plastic lawn ornament who makes predictions for the municipality of Leominster, Massachusetts. Featherstone is a beloved tradition kept alive by the dapper but groundhog-phobic mayor, Dean Mazzarella. “That slimy groundhog will be out there Sunday morning,” the longtime mayor has said. “And here we are with a beautiful pink flamingo.” On the theme of groundhogs, he swears that “there is no street named after a rodent, I’ve looked this up. Rodents are yucky, they carry disease, there’s nothing fun about them.” To conclude, he declares: “Forget the rodent. We don’t allow that here.”\\nUnlike virtually every other groundhog, Featherstone predicts an early spring when he sees his shadow.', 'https://groundhog-day.com/images/ghogs/featherstone-the-flamingo.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (68, 'lucy-the-lobster', 'Lucy', 'Lucy the Lobster', 'Barrington', 'Nova Scotia', 'Canada', '43.5128603,-65.611397', 'https://twitter.com/lucylobsterns', 'satwood@barringtonmunicipality.com', 'https://www.facebook.com/941Breeze/posts/pfbid0L9ipy944NDk8KMDefNwhn2bxWuPmyMjyebqvYo1UdEUVA8S6QFKzJhx3W8tZDJtUl', 0, 'Atlantic lobster', '1','', 'Lucy the Lobster makes Groundhog Day predictions on February 2nd to kick off the Lobster Crawl festival in Barrington, Nova Scotia. The Municipality of Barrington says Lucy is the only prognosticating crustacean to make a prediction in Canada. Bill Murray was reported as being bemused by the idea of a lobster forecaster.', 'https://groundhog-day.com/images/ghogs/lucy-the-lobster.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (69, 'mount-gretna-grady', 'Grady', 'Mount Gretna Grady', 'Mount Gretna', 'Pennsylvania', 'USA', '40.2467673,-76.4677586', 'https://www.facebook.com/MtGretnaFireCompany/', '', 'https://www.facebook.com/MtGretnaFireCompany/posts/pfbid02kK14Me7Ybhw9FJPmsfKEwvRD4yD41ByjDCTHVKheUSbeyj8LK6wYdJuq81pBXEXMl', 0, 'Plush groundhog', '1','', 'Mount Gretna Grady is a plush groundhog who makes an annual Groundhog Day prediction in Mount Gretna, Pennsylvania. Grady — similar to Snoopy in his biplane doghouse — sports a scarf, aviator cap and goggles. When Grady emerges from his winter nap, his ceremony includes stretching and dancing before he looks for his shadow to predict the upcoming weather. Grady is passionate about fire safety, helping raise money for the Mount Gretna Volunteer Fire Company every year.', 'https://groundhog-day.com/images/ghogs/mount-gretna-grady.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (70, 'stumptown-fil', 'Filbert', 'Stumptown Fil', 'Portland', 'Oregon', 'USA', '45.5100569,-122.7158264', 'https://www.facebook.com/oregonzoo', '', 'https://www.facebook.com/reel/1942322366366701', 0, 'Beaver', '1','', 'Stumptown Fil — aka, Filbert — is a North American beaver who is the principal prognosticator and unofficial branch manager for the Oregon Zoo in Portland. Filbert was born at the zoo in 2011 and has quickly gained popularity since. “Groundhogs like Punxsutawney Phil are fine for their part of the country,” said Christina Parr, a keeper in the zoo’s North America section. “Here in the Northwest, though, we are beaver believers.”', 'https://groundhog-day.com/images/ghogs/stumptown-fil.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (71, 'yonah-the-groundhog', 'Yonah', 'Yonah the Groundhog', 'Cleveland', 'Georgia', 'USA', '34.6229744,-83.8676887', 'https://www.facebook.com/nogawild/', 'info@wildlifewonders.org', 'https://www.facebook.com/reel/1381413729835155/', 1, 'Groundhog', '1','', 'Yonah the Groundhog, the “world’s most famous meteorologist,” makes an annual weather prediction from his home in North Georgia Wildlife Park in Cleveland, Georgia. During his months-long training for his once-a-year prediction, Yonah spends most of his time napping, dreaming of shadows and his favourite snacks: corn and bananas. Not one to (ground)hog the spotlight, Yonah is happy to share the stage with the zoo’s honey badger, Barnabus, who predicts the result of the year’s Superbowl.', 'https://groundhog-day.com/images/ghogs/yonah-the-groundhog.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (72, 'hope-the-groundhog', 'Hope', 'Hope the Groundhog', 'Hope', 'Indiana', 'USA', '39.303483,-85.7731068', 'https://www.facebook.com/profile.php?id=100064771026348', '', 'https://www.facebook.com/LocalNewsDigital/posts/pfbid0weLGGfSsyQXpSMQUnDtFCrg8wfEPnB2uiTzf5pu44NykjVXpMf1oCssb8VHiVQUTl', 1, 'Groundhog', '1','', 'Hope the Groundhog is the official prognosticator for the town of Hope, Indiana. Every year on February 2nd, local notables gather around a bandstand in the Town Square as Hope makes her annual prediction of either an early thaw or six more weeks of “Brrr!”, set to a soundtrack of polka music. Hope, the superstar groundhog, also makes herself available to her adoring fans to snag selfies with after her prediction. Hope has been making predictions since 2021, when she took over for the now-retired Grubby the Groundhog.', 'https://groundhog-day.com/images/ghogs/hope-the-groundhog.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (73, 'gordy-the-groundhog', 'Gordy', 'Gordy the Groundhog', 'Milwaukee', 'Wisconsin', 'USA', '43.0315284,-88.0424457', 'https://www.facebook.com/MilwaukeeCountyZoo', '', 'https://www.jsonline.com/story/life/wisconsin-family/2023/02/02/milwaukee-county-zoo-gordy-the-groundhog-predicts-six-weeks-of-winter/69833757007/', 1, 'Groundhog', '0','', 'Gordy the Groundhog is the resident prognosticator at the Milwaukee County Zoo in Wisconsin. He was born in Indiana but moved to Milwaukee for his new job, where he makes friends quickly on account of his goofy and friendly personality. Gordy is a connoisseur of broccoli and taking naps.', 'https://groundhog-day.com/images/ghogs/gordy-the-groundhog.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (74, 'sylvia-the-apex-armadillo', 'Sylvia', 'Sylvia the Apex Armadillo', 'Apex', 'North Carolina', 'USA', '35.4574054,-78.6421806', 'https://www.facebook.com/AnimalEdventuresSanctuary', '', 'https://www.facebook.com/reel/829933250097606', 0, 'Armadillo', '1','', 'Sylvia the Apex armadillo is the resident Armadillo Day meteorologist for the City of Apex, North Carolina. For her prognostication, Mayor Jacques Gilbert dramatically raises Sylvia towards the sky while playing “The Circle of Life” as Sylvia peers into the future. Shortly after, Mayor Gilbert announces Sylvia’s whispered prediction to the crowd, as only he understands Armadillo-ese. When she isn’t making highly-anticipated weather forecasts, Sylvia spends her time at the Animal Ed.ventures Sanctuary, where she snacks on bugs and roughhouses with her tortoise roommate. In 2026, Pluto the Good Bunny subbed in for Sylvia and predicted 6 more weeks of winter.', 'https://groundhog-day.com/images/ghogs/sylvia-the-apex-armadillo.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (75, 'birmingham-jill', 'Jill', 'Birmingham Jill', 'Birmingham', 'Alabama', 'USA', '33.4870467,-86.7794046', 'https://www.facebook.com/BirminghamZoo', '', 'https://www.facebook.com/reel/3307480349417165', 0, 'Opossum', '1','', 'Birmingham Jill is the resident opossum prognosticator for the Birmingham Zoo in central Alabama. The zoo does have a live-in groundhog — Birmingham Bill — but Jill is nice enough to take over for him on February 2nd each year so he doesn’t have to wake up early from hibernation. When asked about Jill’s record, Bill Lang from the zoo says “She has yet to be wrong and has a better record than Punxsutawney Phil!” This is why the motto around Birmingham Zoo is: ‘Opossums are awesome!’', 'https://groundhog-day.com/images/ghogs/birmingham-jill.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (76, 'mt-parker', 'Parker', 'MT Parker', 'Lancaster', 'Pennsylvania', 'USA', '40.0588008,-76.3072977', 'https://www.facebook.com/ManheimTownshipRecreationDepartment', '', 'https://www.facebook.com/reel/1943227519885585', 0, 'Plush groundhog', '1','', 'MT Parker is a plush groundhog prognosticator who makes a yearly Groundhog Day prediction from Stauffer Mansion in Lancaster, Pennsylvania. Parker is a small but determined orator, emerging from his cozy tree-trunk house into the February cold and proclaiming his predictions from the balcony to throngs of dedicated fans. Parker is also notably a foodie, making sure there is always enough s’mores, coffee, and hot chocolate to go around. Parker has been making predictions for Lancaster since 2021.', 'https://groundhog-day.com/images/ghogs/mt-parker.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (77, 'heavens-wildlife-harvey', 'Harvey', 'Heaven’s Wildlife Harvey', 'Oil Springs', 'Ontario', 'Canada', '42.7669782,-82.1832562', 'https://www.facebook.com/profile.php?id=100068618865920', '', 'https://www.theobserver.ca/news/local-news/earlier-spring-on-the-way-predicts-heavens-wildlife-harvey', 1, 'Groundhog', '0','', 'Heaven’s Wildlife Harvey was a somewhat rotund groundhog who was the official forecaster for the Heaven’s Wildlife Rescue Centre near Oil Springs, Ontario. Harvey succeeded Oil Springs Ollie, who began making predictions in 2014. “Harvey did great in his new role,” said Peggy Jenkins, founder of Heaven’s Wildlife Rescue. “Ollie taught him well.” Harvey was a little more rambunctious than Ollie: while Ollie was laid back and easy-going, Harvey is “kind of a little brat.”', 'https://groundhog-day.com/images/ghogs/heavens-wildlife-harvey.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (78, 'lady-edwina-of-essex', 'Lady Edwina', 'Lady Edwina of Essex', 'West Orange', 'New Jersey', 'USA', '40.7674513,-74.2839038', 'https://www.facebook.com/TurtleBackZoo/', '', 'https://www.facebook.com/joseph.n.divincenzo/posts/pfbid0JWi7N45EXTu5injez25UYaF51g1GcMRW13sdc3PsKowev8giXBT9phSNLjeajUwhl', 1, 'Groundhog', '1','', 'Lady Edwina of Essex is a gentlewoman groundhogess who makes an annual Groundhog Day forecast from the Turtle Back Zoo in New Jersey. Lady Edwina is a relatively junior prognosticator but she continues a proud prognosticating dynasty — taking over from Essex Ed, who retired from forecasting in 2021. Lady Edwina consults “models and maps”, not just shadows, to make 2 yearly predictions: one for the upcoming weather, and another for the results of the Super Bowl.', 'https://groundhog-day.com/images/ghogs/lady-edwina-of-essex.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (79, 'okanagan-okie', 'Okie', 'Okanagan Okie', 'Vernon', 'British Columbia', 'Canada', '50.2400127,-119.2915259', 'https://www.facebook.com/AllanBrooksNatureCentre/', 'info@abnc.ca', 'https://vernonmatters.ca/2026/02/02/okanagan-okie-predicts-early-spring-2/', 0, 'Person in yellow-bellied marmot suit', '1','', 'Meet Okanagan Okie, the newest addition to the Allan Brooks Nature Centre family! Okie is a charming Yellow-Bellied Marmot hailing from Vernon, BC, and proud cousin to the marmots that call the Centre home. Known for his flair for theatre and larger-than-life personality, Okie was unanimously elected to take on the prestigious role of spokes-marmot for ABNC. Okie has trained diligently in the ancient art of weather prognostication for the Centre’s Groundhog Day celebrations. However, Okie still has one challenge—he’s not exactly a morning marmot! He needs a little encouragement from the community to rise and shine on time for his special day.', 'https://groundhog-day.com/images/ghogs/okanagan-okie.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (80, 'poppy-the-groundhog', 'Poppy', 'Poppy the Groundhog', 'Millersville', 'Pennsylvania', 'USA', '40.1213254,-76.6644525', 'https://www.facebook.com/AcornAcresWR', 'info@acornacreswr.com', 'https://lancasteronline.com/poppy-and-her-new-brother-elliott-make-their-groundhog-day-predictions-at-hempfield-apothetique-photos/collection_091e4d9a-a318-11ed-8006-f3d5ec43e9ac.html', 1, 'Groundhog', '0','elliott-the-groundhog', 'Poppy the Groundhog was internationally known and Emmy nominated. Poppy is an educational ambassador with Acorn Acres Wildlife Rehabilitation in Millersville, PA. She starred in the 2020 Super Bowl commercial with Jeep and Bill Murray. Since her debut she has become quite the educator and does numerous educational appearance every month. Annually she holds her Groundhog Day Scavenger Hunt in downtown Lancaster, PA that runs for a solid week! She has her own line of merch available at Ville & Rue.', 'https://groundhog-day.com/images/ghogs/poppy-the-groundhog.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (81, 'queen-city-charlie', 'Charlie', 'Queen City Charlie', 'Cumberland', 'Maryland', 'USA', '39.6528658,-78.7646866', 'https://www.facebook.com/cityofcumberlandmd', 'melinda.kelleher@cumberlandmd.gov', 'https://www.facebook.com/cityofcumberlandmd/posts/pfbid02VZSiotCoqc3e6FZRbhn2WitkXdj8ahuMtuDQtwzA1A12abEd8naXe1CwENo4g5Asl', 0, 'Person in a groundhog suit', '1','', 'Queen City Charlie is a prognosticating person in a groundhog suit who makes an annual prediction for the city of Cumberland, Maryland. Charlie (pictured, right) is a political animal whose predictive press releases are made at City Hall Plaza by the mayor, who Charlie is frequently pictured next to. Charlie is a person-sized replacement for Mountain Maryland Murray, the city’s former furry prognosticator who retired in 2021.', 'https://groundhog-day.com/images/ghogs/queen-city-charlie.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (82, 'portage-la-prairie-larry', 'Larry', 'Portage la Prairie Larry', 'Portage la Prairie', 'Manitoba', 'Canada', '49.9659588,-98.2922681', 'https://www.facebook.com/randy.joseph.lilley', 'rjlilley204@gmail.com', 'https://portageonline.com/articles/portages-larry-and-manitoba-merv-say-brace-for-more-snow', 0, 'Plush groundhog', '1','', 'Portage la Prairie Larry is a plush groundhog who makes an annual weather prediction for Portage la Prairie, Manitoba. While some groundhogs show up to the same place every year, Larry doesn’t tell too many people where he’ll be on February 2nd. Larry also doesn’t waste time — with how cold it often is in Portage la Prairie, he pops up, takes a look, and then dives back underground. Despite the challenge of locating Larry, his handler Randy Lilley says it’s worth it because “Groundhog Day is the best day of the year.”', 'https://groundhog-day.com/images/ghogs/portage-la-prairie-larry.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (83, 'unadilla-billie', 'Billie', 'Unadilla Billie', 'Unadilla', 'Nebraska', 'USA', '40.6834005,-96.2751068', 'https://www.facebook.com/profile.php?id=100064741024244', '', 'https://www.facebook.com/awardnewsguy/posts/pfbid02KNHmgqpka7ozfqWzZjdHfGmmHnxAHX2MBrvVGHVMtM4RxKwSrtjXRrJ2jxYaN9f4l', 0, 'Taxidermied groundhog', '1','', 'Unadilla Billie is a taxidermied lady groundhog who makes an annual Groundhog Day prediction for the town of Unadilla, Nebraska. Billie is a novice groundhog, the successor to longtime prognosticator Unadilla Bill, who predicted the arrival of spring  from 1988 to the pandemic year of 2021. Billie is relishing her new role, writing poetic predictions and taking selfies with fans. Billie is a master of camouflage, able to blend in with her surroundings and remain perfectly still in just about any urban setting.', 'https://groundhog-day.com/images/ghogs/unadilla-billie.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (84, 'allen-mcbutterpants', 'Allen', 'Allen McButterpants', 'Hampton Bays', 'New York', 'USA', '40.8703818,-72.5459557', 'https://www.facebook.com/WildlifeRescueHospitalHamptons', '', 'https://www.facebook.com/mjsemack/posts/pfbid03868hhHBAq1PAdPeaWN7eY9ZivzhhvGPp8mDdf58i8vPnkwU2ZjyYDdKuaGuAWWhUl', 1, 'Groundhog', '0','', 'Allen McButterpants was the groundhog mascot and ambassador of the Evelyn Alexander Wildlife Rescue Center in Hampton Bays, New York. Allen had mobility issues which meant he couldn’t be released back into the wild, so he spent his time on training and exercise which kept him in tip-top shape for his annual prognostications. Allen was a bit of a health nut who followed a clean vegetarian diet of leafy greens, carrots, beets, and tomatoes, and kept in shape with digging-centric workouts. Allen was also particularly keen on yoga and meditation, which contributed to his calm and easy-going personality.', 'https://groundhog-day.com/images/ghogs/allen-mcbutterpants.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (85, 'bay-beach-bernard', 'Bernard', 'Bay Beach Bernard', 'Green Bay', 'Wisconsin', 'USA', '44.5275131,-87.9763597', 'https://www.facebook.com/BayBeachWildlifeSanctuary', '', 'https://youtu.be/3-MQhHdW5Fc?t=15', 1, 'Groundhog', '1','', 'Bay Beach Bernard is the official prognosticator and groundhog ambassador for the Bay Beach Wildlife Sanctuary in northeast Wisconsin. Tragically hit by a car at a young age, Bernard takes it easy in between performing his duties as public figure. He is often seen wrapped in luxurious fabrics, he is an accomplished painter, and he maintains a healthy diet of corn-on-the-cob and bananas. Unique amongst groundhogs, Bernard makes his yearly predictions from an Ice Desk. Maybe it keeps the swelling down on his injured leg, or maybe he just likes having a very cool desk.', 'https://groundhog-day.com/images/ghogs/bay-beach-bernard.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (86, 'cedar-the-groundhog', 'Cedar', 'Cedar the Groundhog', 'West Dundee', 'Illinois', 'USA', '42.1157016,-88.3362437', 'https://www.facebook.com/RandallOaksZoo', '', 'https://www.facebook.com/RandallOaksZoo/posts/pfbid023anGCeExDFXQ9Ff2pLwMaT3C5SzAmaTb6RXWkUimo7bVPpn3ok2AUqSZHpkMFjXNl', 1, 'Groundhog', '1','', 'Cedar the Groundhog (aka, Squish) is a young whistlepig who gives official prognostications for the Randall Oaks Zoo in West Dundee, Illinois. Cedar was orphaned at a very young age and entered the care of the zoo. Typically Gen-Z, Cedar is very friendly and loves getting attention (his predictions are streamed on Facebook), which is why he invites lots of people to his parties. For any partygoers unsure how to shop for a groundhog, Cedar unsubtly posted on Facebook that he loves banana chips.', 'https://groundhog-day.com/images/ghogs/cedar-the-groundhog.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (87, 'cornelia-the-groundhog', 'Cornelia', 'Cornelia the Groundhog', 'Worcester', 'Massachusetts', 'USA', '42.2642941,-71.7666023', 'https://www.facebook.com/EcoTarium', '', 'https://www.masslive.com/worcester/2026/02/heres-what-worcester-groundhog-cornelia-predicted-on-groundhog-day-2026.html', 1, 'Groundhog', '1','', 'Cornelia is the officially-designated prognosticating groundhog for the EcoTarium in Worcester, Massachusetts. While other groundhogs dig burrows, Cornelia appreciates a scenic view and has built herself a penthouse-style box atop a rock formation. She is a cosy girl who likes to decorate her pad with blankets, paper, and cardboard — which is important because she enters torpor (less intense than hibernation) and can doze off for quite a while. In between interior decorating and prognosticating, Cornelia is a bit of foodie who loves to chow down on broccoli, walnuts, and bananas.', 'https://groundhog-day.com/images/ghogs/cornelia-the-groundhog.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (88, 'pisgah-penny', 'Penny', 'Pisgah Penny', 'Brevard', 'North Carolina', 'USA', '35.243478,-82.7769959', 'https://www.facebook.com/whitesquirrelinstitute', 'whitesquirrelinstitute.org', 'https://www.facebook.com/whitesquirrelinstitute/posts/pfbid02hPREHeeEVQ3oqguYA5NnFU77FynXyJy4b26K8e66c8uZttQJTegzgn9UwVZ8uRBnl', 0, 'White tree squirrel', '0','pisgah-piper', 'Pisgah Penny was a white Tree Squirrel who made an annual prediction for “White Squirrel Day” in Brevard, North Carolina. White Squirrel Day is similar in many respects to Groundhog Day, the primary difference being the substitution of a groundhog for a squirrel. Penny’s predictions were based on what side of her display cage she moved to, one side signifying early spring and the other six more weeks winter. Brevard Mayor Maureen Copelof said “Pisgah Penny established herself as a beloved and valued member of this community who openly asserted her love for Brevard,” while “Punxsutawney Phil has established himself as, let’s be honest, an ill tempered, unreliable predictor.”', 'https://groundhog-day.com/images/ghogs/pisgah-penny.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (89, 'walnut-the-hedgehog', 'Walnut', 'Walnut the Hedgehog', 'Dayton', 'Ohio', 'USA', '39.7886347,-84.2019907', 'https://www.facebook.com/BoonshoftMuseum/', '', 'https://www.facebook.com/LMKAdvocacy/posts/pfbid02wacpMKFH8thaCFctrt7BpzNeAGzj9MzjqpmR91Si91yqe5PPv2vfXBgaYbu81CcZl', 0, 'Hedgehog', '1','', 'Walnut is a four-toed hedgehog who makes annual prognostications for the Boonshoft Discovery Museum in Dayton, Ohio. According to her official biographer, Walnut was part of a debate team which travelled to Pennsylvania where she met Phil, a famous prognosticating groundhog. Walnut and Phil immediately clicked and shared laughter, pears, and long conversations about prognosticating. That’s how she first came to learn the arcane rituals of weather prediction, which she now performs every year for ‘National Hedgehog Day’ (a Roman tradition that precedes the modern Groundhog Day).', 'https://groundhog-day.com/images/ghogs/walnut-the-hedgehog.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (90, 'elliott-the-groundhog', 'Elliott', 'Elliott the Groundhog', 'Millersville', 'Pennsylvania', 'USA', '40.1213254,-76.6644525', 'https://www.facebook.com/AcornAcresWR', 'info@acornacreswr.com', 'https://lancasteronline.com/features/entertainment/groundhog-day-2026-heres-what-5-lancaster-county-groundhogs-punxsutawney-phil-predict/article_d2889edb-7e71-47ed-83f1-7b2b6e7b7fd0.html?fbclid=IwY2xjawPtq5RleHRuA2FlbQIxMQBzcnRjBmFwcF9pZBAyMjIwMzkxNzg4MjAwODkyAAEeBk8czuG6-LbuvbIQ7Q40dn_BOGtkhQ09vU9ervAggslR-uVtIf7ZyOcaJWQ_aem_7EQLd3BWXBoid4Z83d0jag', 1, 'Groundhog', '1','', 'Elliott the Groundhog is an educational ambassador with Acorn Acres Wildlife Rehabilitation in Millersville, Pennsylvania. After shadowing his big sister Poppy, Elliott took over her prognosticating duties for the first time in 2024. Departing from the more traditional ‘shadow’ technique, Elliot uses the “treat method” to make his prediction. He gets two identical treat dishes: one says “spring” and the other “winter.” Whichever bowl Elliot eats from is his prediction. Elliott is a bit of a sartorialist and has been known to wear a miniature tuxedo for special occasions.', 'https://groundhog-day.com/images/ghogs/elliott-the-groundhog.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (91, 'st-thomas-sally', 'Sally', 'St. Thomas Sally', 'St. Thomas', 'Ontario', 'Canada', '42.7805579,-81.1941361', 'https://www.facebook.com/cityofstthomasontario', '', 'https://www.facebook.com/reel/1458875032475295/', 0, 'Groundhog mural', '1','', 'St. Thomas Sally is a large, colourful groundhog mural in downtown St. Thomas, Ontario. The mural was painted by local artist  [Arlin Graff](https://www.instagram.com/arlin_graff/) in May 2023 and led to the City of St. Thomas beginning its Groundhog Day tradition. Mayor Joe Preston has described Sally as “probably the best predictor of all the groundhogs because she’s higher than most and way more colourful than most” — although the relationship between a groundhog’s colour and their prediction accuracy has not been scientifically established. Sally is a trailblazer in more ways than one: she is a rare female groundhog, and also the only groundhog mural.', 'https://groundhog-day.com/images/ghogs/st-thomas-sally.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (92, 'pisgah-piper', 'Piper', 'Pisgah Piper', 'Brevard', 'North Carolina', 'USA', '35.243478,-82.7769959', 'https://www.facebook.com/whitesquirrelinstitute', 'whitesquirrelinstitute.org', 'https://www.facebook.com/whitesquirrelinstitute/posts/pfbid0DkJG3sCYywsk7BHzrdRv5kqm7iErtGgBwNrmxmzdv73X8iL1x2FL3bYC2Amcfusol', 0, 'White tree squirrel', '1','', 'Pisgah Piper is the official ambassador and White Squirrel Day prognosticator for Brevard, North Carolina. Piper succeeds Pisgah Penny, who retired from making predictions in 2024. Piper is sight-impaired due to an accidental tumble out of a tree, but she works as twice as hard as most groundhogs: predicting the winner of the Super Bowl as well as the oncoming spring! “Who needs a grumpy groundhog when you can have a beautiful white squirrel that not only predict spring’s arrival but the winner of the Super Bowl?” asks White Squirrel Day Master of Ceremonies Don Debiase.', 'https://groundhog-day.com/images/ghogs/pisgah-piper.jpeg');
INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, coordinates, source, contact, currentPrediction, isGroundhog, type, active, successor, description, image) VALUES (93, 'snack-town-steve', 'Steve', 'Snack Town Steve', 'Hanover', 'Pennsylvania', 'USA', '39.7910902,-76.985847', 'https://www.facebook.com/QFSocial', 'jody@quinnflags.com', 'https://www.facebook.com/QFSocial/posts/pfbid0tKMkrYq7YXEVDbZTB2La7Mk5wZf6BZjfaJr6NURi8A1BmyNrRuBDqr8g7ppyMFsRl', 0, 'Gray squirrel', '1','', 'Snack Town Steve is a gray squirrel prognosticator who resides near the Quinn Flags Art Department in Hanover, Pennsylvania. Steve is a very friendly squirrel and frequent lunchtime guest, feasting on donated almonds at his very own squirrel-sized picnic table. Staff noticed that Steve does not appear on days that forecast heavy rain or snow, which clued them in to Steve’s gift for weather forecasting. Steve is proud to be the first prognosticator from Hanover, PA: the Snack Food Capital of the World!', 'https://groundhog-day.com/images/ghogs/snack-town-steve.jpeg');

/* Insert Predictions */

/* Predictions for allen-mcbutterpants */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('allen-mcbutterpants', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('allen-mcbutterpants', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('allen-mcbutterpants', 2025, 0, '');

/* Predictions for athene-the-burrowing-owl */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('athene-the-burrowing-owl', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('athene-the-burrowing-owl', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('athene-the-burrowing-owl', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('athene-the-burrowing-owl', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('athene-the-burrowing-owl', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('athene-the-burrowing-owl', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('athene-the-burrowing-owl', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('athene-the-burrowing-owl', 2026, 1, '');

/* Predictions for balzac-billy */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2004, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2005, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2006, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2007, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2008, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2012, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2013, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('balzac-billy', 2026, 1, '');

/* Predictions for bay-beach-bernard */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bay-beach-bernard', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bay-beach-bernard', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bay-beach-bernard', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bay-beach-bernard', 2026, 0, '');

/* Predictions for beardsley-bart */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2011, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2013, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2015, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('beardsley-bart', 2026, 0, '');

/* Predictions for bee-cave-bob */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bee-cave-bob', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bee-cave-bob', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bee-cave-bob', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bee-cave-bob', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bee-cave-bob', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bee-cave-bob', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bee-cave-bob', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bee-cave-bob', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bee-cave-bob', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bee-cave-bob', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bee-cave-bob', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bee-cave-bob', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bee-cave-bob', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bee-cave-bob', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bee-cave-bob', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bee-cave-bob', 2026, 0, '');

/* Predictions for benny-the-bass */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('benny-the-bass', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('benny-the-bass', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('benny-the-bass', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('benny-the-bass', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('benny-the-bass', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('benny-the-bass', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('benny-the-bass', 2021, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('benny-the-bass', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('benny-the-bass', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('benny-the-bass', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('benny-the-bass', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('benny-the-bass', 2026, 0, '');

/* Predictions for big-al */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('big-al', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('big-al', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('big-al', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('big-al', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('big-al', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('big-al', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('big-al', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('big-al', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('big-al', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('big-al', 2026, 0, '');

/* Predictions for birmingham-jill */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('birmingham-jill', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('birmingham-jill', 2020, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('birmingham-jill', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('birmingham-jill', 2022, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('birmingham-jill', 2023, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('birmingham-jill', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('birmingham-jill', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('birmingham-jill', 2026, 1, '');

/* Predictions for boise-bill */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2007, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2008, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2010, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2012, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2014, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2019, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2020, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2021, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2022, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('boise-bill', 2023, null, '');

/* Predictions for bowman-bill */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bowman-bill', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bowman-bill', 2012, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bowman-bill', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bowman-bill', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bowman-bill', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bowman-bill', 2016, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bowman-bill', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bowman-bill', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bowman-bill', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bowman-bill', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bowman-bill', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bowman-bill', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bowman-bill', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bowman-bill', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bowman-bill', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('bowman-bill', 2026, 1, '');

/* Predictions for buckeye-chuck */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1980, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1981, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1982, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1983, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1984, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1985, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1986, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1987, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1988, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1989, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1990, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1991, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1992, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1993, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1994, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1995, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1996, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1997, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1998, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 1999, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2000, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2001, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2002, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2003, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2004, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2005, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2006, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2007, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2008, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2013, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buckeye-chuck', 2026, 0, '');

/* Predictions for buffalo-bert */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buffalo-bert', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buffalo-bert', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buffalo-bert', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buffalo-bert', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buffalo-bert', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buffalo-bert', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buffalo-bert', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buffalo-bert', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buffalo-bert', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buffalo-bert', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buffalo-bert', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buffalo-bert', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buffalo-bert', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('buffalo-bert', 2026, 1, '');

/* Predictions for cedar-the-groundhog */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('cedar-the-groundhog', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('cedar-the-groundhog', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('cedar-the-groundhog', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('cedar-the-groundhog', 2026, 0, '');

/* Predictions for charles-winchester */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('charles-winchester', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('charles-winchester', 2016, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('charles-winchester', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('charles-winchester', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('charles-winchester', 2019, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('charles-winchester', 2020, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('charles-winchester', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('charles-winchester', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('charles-winchester', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('charles-winchester', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('charles-winchester', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('charles-winchester', 2026, 0, '');

/* Predictions for chesapeake-chuck */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chesapeake-chuck', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chesapeake-chuck', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chesapeake-chuck', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chesapeake-chuck', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chesapeake-chuck', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chesapeake-chuck', 2019, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chesapeake-chuck', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chesapeake-chuck', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chesapeake-chuck', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chesapeake-chuck', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chesapeake-chuck', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chesapeake-chuck', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chesapeake-chuck', 2026, 0, '');

/* Predictions for chilly-charlie */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2011, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2013, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chilly-charlie', 2026, 1, '');

/* Predictions for chuck-wood */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuck-wood', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuck-wood', 2015, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuck-wood', 2016, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuck-wood', 2017, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuck-wood', 2018, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuck-wood', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuck-wood', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuck-wood', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuck-wood', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuck-wood', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuck-wood', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuck-wood', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuck-wood', 2026, 1, '');

/* Predictions for chuckles-the-groundhog */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2008, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2010, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2021, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('chuckles-the-groundhog', 2026, 1, '');

/* Predictions for cluxatawney-henrietta */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('cluxatawney-henrietta', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('cluxatawney-henrietta', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('cluxatawney-henrietta', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('cluxatawney-henrietta', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('cluxatawney-henrietta', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('cluxatawney-henrietta', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('cluxatawney-henrietta', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('cluxatawney-henrietta', 2026, 0, '');

/* Predictions for concord-casimir */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-casimir', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-casimir', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-casimir', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-casimir', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-casimir', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-casimir', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-casimir', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-casimir', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-casimir', 2026, 1, '');

/* Predictions for concord-charlie */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1979, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1980, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1981, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1982, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1983, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1984, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1985, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1986, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1987, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1988, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1989, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1990, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1991, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1992, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1993, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1994, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1995, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1996, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1997, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1998, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 1999, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2000, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2001, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2002, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2003, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2004, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2005, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2006, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2007, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2008, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('concord-charlie', 2026, 0, '');

/* Predictions for cornelia-the-groundhog */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('cornelia-the-groundhog', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('cornelia-the-groundhog', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('cornelia-the-groundhog', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('cornelia-the-groundhog', 2026, 1, '');

/* Predictions for dover-doug */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dover-doug', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dover-doug', 2012, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dover-doug', 2013, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dover-doug', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dover-doug', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dover-doug', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dover-doug', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dover-doug', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dover-doug', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dover-doug', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dover-doug', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dover-doug', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dover-doug', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dover-doug', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dover-doug', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dover-doug', 2026, 1, '');

/* Predictions for dunkirk-dave */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1983, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1984, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1985, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1986, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1987, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1988, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1989, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1990, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1991, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1992, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1993, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1994, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1995, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1996, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1997, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1998, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 1999, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2000, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2001, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2002, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2003, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2004, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2005, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2006, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2007, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2008, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2009, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2013, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('dunkirk-dave', 2026, 0, '');

/* Predictions for elliott-the-groundhog */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('elliott-the-groundhog', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('elliott-the-groundhog', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('elliott-the-groundhog', 2026, 0, '');

/* Predictions for featherstone-the-flamingo */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('featherstone-the-flamingo', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('featherstone-the-flamingo', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('featherstone-the-flamingo', 2018, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('featherstone-the-flamingo', 2019, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('featherstone-the-flamingo', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('featherstone-the-flamingo', 2021, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('featherstone-the-flamingo', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('featherstone-the-flamingo', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('featherstone-the-flamingo', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('featherstone-the-flamingo', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('featherstone-the-flamingo', 2026, 0, '');

/* Predictions for fenwick-flossie */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2010, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2011, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2013, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2015, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2019, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fenwick-flossie', 2026, 1, '');

/* Predictions for flatiron-freddy */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2010, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('flatiron-freddy', 2026, 0, '');

/* Predictions for fred-la-marmotte */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2010, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2012, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2023, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('fred-la-marmotte', 2026, 0, '');

/* Predictions for french-creek-freddie */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1980, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1981, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1982, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1983, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1984, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1985, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1986, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1987, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1988, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1989, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1990, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1991, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1992, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1993, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1994, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1995, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1996, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1997, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1998, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 1999, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2000, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2001, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2002, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2003, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2004, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2005, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2006, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2007, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2008, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2009, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2013, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('french-creek-freddie', 2026, 0, '');

/* Predictions for general-beauregard-lee */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1982, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1983, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1984, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1985, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1986, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1987, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1988, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1989, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1990, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1991, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1992, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1993, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1994, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1995, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1996, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1997, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1998, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 1999, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2000, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2001, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2002, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2003, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2004, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2005, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2006, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2007, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2008, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2009, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('general-beauregard-lee', 2026, 1, '');

/* Predictions for gertie-the-groundhog */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 1993, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 1994, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 1995, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 1996, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 1997, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 1998, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 1999, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2000, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2001, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2002, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2003, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2004, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2005, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2006, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2007, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2008, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2009, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2013, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gertie-the-groundhog', 2026, 1, '');

/* Predictions for gordy-the-groundhog */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gordy-the-groundhog', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gordy-the-groundhog', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gordy-the-groundhog', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gordy-the-groundhog', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gordy-the-groundhog', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('gordy-the-groundhog', 2024, null, '');

/* Predictions for grover-and-sue */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2007, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2008, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2010, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2012, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('grover-and-sue', 2026, 1, '');

/* Predictions for harleysville-hank */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('harleysville-hank', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('harleysville-hank', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('harleysville-hank', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('harleysville-hank', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('harleysville-hank', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('harleysville-hank', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('harleysville-hank', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('harleysville-hank', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('harleysville-hank', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('harleysville-hank', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('harleysville-hank', 2026, 0, '');

/* Predictions for heavens-wildlife-harvey */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('heavens-wildlife-harvey', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('heavens-wildlife-harvey', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('heavens-wildlife-harvey', 2024, 0, '');

/* Predictions for holtsville-hal */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 1999, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2000, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2001, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2002, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2003, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2004, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2005, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2006, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2007, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2008, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2010, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('holtsville-hal', 2026, 1, '');

/* Predictions for hope-the-groundhog */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('hope-the-groundhog', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('hope-the-groundhog', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('hope-the-groundhog', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('hope-the-groundhog', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('hope-the-groundhog', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('hope-the-groundhog', 2026, 0, '');

/* Predictions for jimmy-the-groundhog */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1969, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1970, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1971, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1972, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1973, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1974, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1975, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1976, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1977, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1978, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1979, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1980, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1981, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1982, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1983, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1984, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1985, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1986, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1987, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1988, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1989, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1990, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1991, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1992, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1993, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1994, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1995, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1996, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1997, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1998, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 1999, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2000, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2001, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2002, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2003, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2004, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2005, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2006, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2007, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2008, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2013, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('jimmy-the-groundhog', 2026, 0, '');

/* Predictions for lady-edwina-of-essex */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lady-edwina-of-essex', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lady-edwina-of-essex', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lady-edwina-of-essex', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lady-edwina-of-essex', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lady-edwina-of-essex', 2026, 1, '');

/* Predictions for lander-lil */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 1985, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 1986, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 1987, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 1988, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 1989, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 1990, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 1991, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 1992, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 1993, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 1994, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 1995, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 1996, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 1997, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 1998, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 1999, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2000, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2001, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2002, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2003, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2004, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2005, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2006, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2007, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2008, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lander-lil', 2026, 0, '');

/* Predictions for lawrenceville-lucy */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lawrenceville-lucy', 2013, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lawrenceville-lucy', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lawrenceville-lucy', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lawrenceville-lucy', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lawrenceville-lucy', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lawrenceville-lucy', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lawrenceville-lucy', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lawrenceville-lucy', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lawrenceville-lucy', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lawrenceville-lucy', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lawrenceville-lucy', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lawrenceville-lucy', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lawrenceville-lucy', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lawrenceville-lucy', 2026, 1, '');

/* Predictions for lucy-the-lobster */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lucy-the-lobster', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lucy-the-lobster', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lucy-the-lobster', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lucy-the-lobster', 2021, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lucy-the-lobster', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lucy-the-lobster', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lucy-the-lobster', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lucy-the-lobster', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('lucy-the-lobster', 2026, 0, '');

/* Predictions for malverne-mel */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 1996, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 1997, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 1998, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 1999, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2000, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2001, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2002, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2003, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2004, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2005, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2006, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2007, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2008, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2009, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2010, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2012, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('malverne-mel', 2026, 1, '');

/* Predictions for manitoba-merv */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 1996, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 1997, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 1998, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 1999, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2000, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2001, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2002, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2003, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2004, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2005, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2006, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2007, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2008, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('manitoba-merv', 2026, 1, '');

/* Predictions for middlemiss-mike */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2007, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2008, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2009, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2013, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2014, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2019, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2020, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('middlemiss-mike', 2026, 1, '');

/* Predictions for mojave-max */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2000, 0, '2000-03-15, 12:32 PM, Wednesday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2001, 1, '2001-03-19, 8:30 AM, Monday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2002, 1, '2002-03-22, ,11:46 AM, Friday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2003, 0, '2003-03-07, 10:25 AM, Friday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2004, 0, '2004-02-19, 11:14 AM, Thursday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2005, 0, '2005-02-14, 11:55 AM, Monday, Earliest emergence');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2006, 1, '2006-04-03, 11:32 AM, Monday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2007, 1, '2007-03-26, 11:34 AM, Monday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2008, 1, '2008-04-14, 11:27 AM, Monday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2009, 1, '2009-04-07, 2:37 PM, Tuesday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2010, 1, '2010-03-30, 9:23 AM, Tuesday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2011, 1, '2011-03-29, 2:03 PM, Tuesday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2012, 1, '2012-04-17, 12:41 PM, Tuesday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2013, 0, '2013-03-14, 1:45 PM, Thursday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2014, 1, '2014-04-07, 4:10 PM, Monday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2015, 1, '2015-04-15, 2:17 PM, Wednesday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2016, 0, '2016-03-08, 1:20 PM, Tuesday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2017, 1, '2017-04-05, 12:40 PM, Wednesday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2018, 1, '2018-03-23, 11:11 AM, Friday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2019, 1, '2019-03-30, 1:28 PM, Saturday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2020, 1, '2020-04-01, 11:39 AM, Wednesday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2021, 1, '2021-04-15, 11:34 AM, Thursday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2022, 1, '2022-03-26, 12:21 PM, Saturday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2023, 1, '2023-04-24, 3:40 PM, Monday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2024, 1, '2024-04-23, 3:09 pm, Tuesday');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2025, 1, '2025-05-08, 2:09 pm, Thursday, Latest emergence');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mojave-max', 2026, null, '');

/* Predictions for mount-gretna-grady */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-gretna-grady', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-gretna-grady', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-gretna-grady', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-gretna-grady', 2021, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-gretna-grady', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-gretna-grady', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-gretna-grady', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-gretna-grady', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-gretna-grady', 2026, 0, '');

/* Predictions for mount-joy-minnie */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2008, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2009, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2010, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mount-joy-minnie', 2026, 0, '');

/* Predictions for ms-g */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2008, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2009, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2010, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('ms-g', 2026, 1, '');

/* Predictions for mt-parker */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mt-parker', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mt-parker', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mt-parker', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mt-parker', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mt-parker', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('mt-parker', 2026, 1, '');

/* Predictions for octoraro-orphie */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1926, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1927, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1928, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1929, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1930, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1931, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1932, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1933, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1934, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1935, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1936, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1937, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1938, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1939, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1940, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1941, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1942, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1943, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1944, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1945, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1946, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1947, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1948, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1949, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1950, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1951, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1952, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1953, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1954, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1955, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1956, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1957, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1958, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1959, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1960, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1961, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1962, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1963, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1964, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1965, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1966, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1967, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1968, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1969, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1970, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1971, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1972, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1973, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1974, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1975, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1976, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1977, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1978, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1979, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1980, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1981, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1982, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1983, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1984, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1985, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1986, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1987, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1988, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1989, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1990, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1991, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1992, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1993, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1994, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1995, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1996, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1997, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1998, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 1999, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2000, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2001, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2002, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2003, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2004, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2005, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2006, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2007, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2008, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2021, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('octoraro-orphie', 2026, 0, '');

/* Predictions for oil-springs-ollie */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('oil-springs-ollie', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('oil-springs-ollie', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('oil-springs-ollie', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('oil-springs-ollie', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('oil-springs-ollie', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('oil-springs-ollie', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('oil-springs-ollie', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('oil-springs-ollie', 2021, 0, '');

/* Predictions for okanagan-okie */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('okanagan-okie', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('okanagan-okie', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('okanagan-okie', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('okanagan-okie', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('okanagan-okie', 2026, 0, '');

/* Predictions for patty-pagoda */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('patty-pagoda', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('patty-pagoda', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('patty-pagoda', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('patty-pagoda', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('patty-pagoda', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('patty-pagoda', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('patty-pagoda', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('patty-pagoda', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('patty-pagoda', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('patty-pagoda', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('patty-pagoda', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('patty-pagoda', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('patty-pagoda', 2026, 1, '');

/* Predictions for pisgah-penny */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('pisgah-penny', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('pisgah-penny', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('pisgah-penny', 2024, 1, '');

/* Predictions for pisgah-piper */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('pisgah-piper', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('pisgah-piper', 2026, 1, '');

/* Predictions for polk-county-paula */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('polk-county-paula', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('polk-county-paula', 2012, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('polk-county-paula', 2013, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('polk-county-paula', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('polk-county-paula', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('polk-county-paula', 2016, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('polk-county-paula', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('polk-county-paula', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('polk-county-paula', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('polk-county-paula', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('polk-county-paula', 2021, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('polk-county-paula', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('polk-county-paula', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('polk-county-paula', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('polk-county-paula', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('polk-county-paula', 2026, 0, '');

/* Predictions for poor-richard */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2001, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2002, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2003, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2004, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2005, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2006, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2007, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2008, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poor-richard', 2026, 1, '');

/* Predictions for poppy-the-groundhog */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poppy-the-groundhog', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poppy-the-groundhog', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poppy-the-groundhog', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('poppy-the-groundhog', 2023, 1, '');

/* Predictions for portage-la-prairie-larry */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('portage-la-prairie-larry', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('portage-la-prairie-larry', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('portage-la-prairie-larry', 2024, 0, 'Ice fog made it hard to see anything clearly.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('portage-la-prairie-larry', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('portage-la-prairie-larry', 2026, 1, '');

/* Predictions for potomac-phil */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('potomac-phil', 2012, 1, 'Six More Weeks of Winter; 6 More Months of Political Gridlock');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('potomac-phil', 2013, 0, 'Early Spring; 6 More Months of Political Gridlock');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('potomac-phil', 2014, 1, 'Six More Weeks of Winter; 6 More Months of Political Gridlock');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('potomac-phil', 2015, 1, 'Six More Weeks of Winter; 6 More Months of Political Gridlock');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('potomac-phil', 2016, 0, 'Early Spring; 6 More Months of Political Gridlock');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('potomac-phil', 2017, 1, 'Six More Weeks of Winter; 6 More Months of Political Gridlock');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('potomac-phil', 2018, 1, 'Six More Weeks of Winter; 6 More Months of Political Gridlock');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('potomac-phil', 2019, 1, 'Six More Weeks of Winter; 6 More Months of Political Gridlock');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('potomac-phil', 2020, 1, 'Six More Weeks of Winter; 6 More Months of Political Gridlock');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('potomac-phil', 2021, 0, 'No shadow! Early spring! 6 more months of political gridlock!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('potomac-phil', 2022, 1, 'Sorry folks, 6 more weeks of winter and 6 more months of political gridlock!!!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('potomac-phil', 2023, 0, 'No shadow—it’s going to be an early spring! But me also see 6 more months of political gridlock');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('potomac-phil', 2024, 0, 'Early Spring; 6 More Months of Political Gridlock');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('potomac-phil', 2025, 1, 'Shadows everywhere! 6 more weeks of Winter and 6 more months of political gridlock!!!!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('potomac-phil', 2026, 1, 'I see a shadow! Six more weeks of winter and six more months of political gridlock');

/* Predictions for punxsutawney-phil */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1886, null, 'Groundhog Day first recognized in Punxsutawney by Weathers Wags.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1887, 1, 'First Official trek to Gobbler’s Knob. Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1888, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1889, null, 'No Record.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1890, 0, 'No Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1891, null, 'No Record.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1892, null, 'No Record.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1893, null, 'No Record.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1894, null, 'No Record.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1895, null, 'No Record.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1896, null, 'No Record.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1897, null, 'No Record.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1898, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1899, null, 'No Record. Groundhog Club founded.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1900, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1901, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1902, 0, 'Probably No Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1903, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1904, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1905, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1906, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1907, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1908, 1, 'Saw Shadow; First front page coverage');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1909, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1910, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1911, 1, 'Saw Shadow; “55 couples at Groundhog Day Dance.”');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1912, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1913, 1, 'Saw Shadow at 8:80 am. First newspaper photo of Groundhog by John Frampton. A new dance “The Groundhog Roll” was demonstrated by Joe Winslow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1914, 1, 'Saw Shadow at 9:34 AM, Groundhog demonstrated “The Groundhog Flop”');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1915, 1, 'Saw Shadow at 11:45 AM');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1916, 1, 'Saw Shadow at 9:07; First films of the event. ');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1917, 1, 'Saw Shadow at 9:07.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1918, 1, 'Saw Shadow; Temperature 18 below zero.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1919, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1920, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1921, 1, 'Saw Shadow at 7:17 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1922, 1, 'Saw Shadow 7:11 AM; Groundhog Holiday Dance.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1923, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1924, 1, 'Saw Shadow 7:13 AM; First appearance of logo with groundhog with umbrella and newspaper.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1925, 1, 'Saw Shadow 8:13 AM; CJ Margiotti gave groundhog tradition to the Pittsburgh Travel Club.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1926, 1, 'Saw Shadow at 9:17 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1927, 1, 'Saw Shadow at 8:35 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1928, 1, 'Saw Shadow at 10 AM; Program with Punx’y Rotary Club was on KDKA Radio.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1929, 1, 'Predicted six more weeks of winter before sunrise.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1930, 1, 'Saw Shadow at 7:11 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1931, 1, 'Saw Shadow at 12:27 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1932, 1, 'Saw Shadow at 9:11 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1933, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1934, 0, 'No Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1935, 1, 'Saw Shadow at 9:11 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1936, 1, 'Saw Shadow at 10:27 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1937, 1, 'Saw Shadow at 9:09 AM; Unfortunate meeting with a skunk.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1938, 1, 'Saw Shadow at 9 AM; Blackest shadow in history.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1939, 1, 'Saw Shadow at 9:10 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1940, 1, 'Saw Shadow at 9 AM; Pictured with first Groundhog Day Queen, Miss Margaret Hunam.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1941, 1, 'Saw Shadow at 4:25 PM; Six Groundhog Girls.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1942, 1, 'Partial Shadow at 7:40 AM; “War clouds have blacked out parts of the shadow.” (“The Spirit,” Feb. 2, 1942).');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1943, 0, 'Groundhog didn’t make an appearance; relied on Quarryville’s prediction - NO Shadow');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1944, 1, 'Saw Shadow at 9:10 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1945, 1, 'Saw Shadow at 9 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1946, 1, 'Saw Shadow at 7:52 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1947, 1, 'Saw Shadow at 7:37 AM; First newspaper photo of Groundhog Club members at Gobbler’s Knob.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1948, 1, 'Saw Shadow at 8:46 AM; Dr. Frank Lorenzo was interviewed on KDKA Radio’s “Brunch With Bill” program.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1949, 1, 'Saw Shadow at 7:32 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1950, 0, 'No Shadow; Colleen Townsend, actress, was in town to promote the film, “When Willie Comes Marching Home.”');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1951, 1, 'Saw Shadow at 8:41 AM; Pictured with cheerleaders from PHS and SSCD. Betty Byers, Joan Wadding, Dorothy Armstrong and Kathleen Spinelli.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1952, 1, 'Saw Shadow at 7:52 AM; First appearance of Frau Gourndhog, Groundhog procession and shadow. Casting was on Dave Garroway’s TV Show on NBC on Monday, February 4.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1953, 1, 'Saw Shadow at 7:38 AM; First year with Sam Light as Groundhog Club president; First Man-of-the-Year Award goes to Ben Levy.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1954, 1, 'Saw Shadow at 8:03 AM; The groundhog was turned completely white from worry.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1955, 1, 'Saw Shadow at 8:51 AM; 4-inch snowfall on Groundhog Day; Coverage on three TV stations.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1956, 1, 'Saw Shadow 8:33 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1957, 1, 'Saw Shadow 7:47 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1958, 1, 'Saw Shadow at 8:27 AM; Prepared for blast-off in his “Chucknik” spacecraft; First Woman-of-the-Year Award was given to Mrs. Louis (Olive) Woodring.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1959, 1, 'Saw Shadow at 8:23 AM; Announces that he has returned from a successful trip to the moon.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1960, 1, 'Saw Shadow at 7:33 AM, forecasts extremely bad weather; appearance on the “Today” show.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1961, 1, 'Saw Shadow at 7:41 AM; 25 below zero.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1962, 1, 'Saw Shadow at 7:29 AM; Just returned from second trip to the moon.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1963, 1, 'Saw Shadow at 7:41 AM; Unusually dark shadow');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1964, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1965, 1, 'Saw Shadow shortly before 8 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1966, 1, 'Saw Shadow at 7:21 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1967, 1, 'Saw Shadow 7:25 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1968, 1, 'Saw Shadow 7:29 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1969, 1, 'Saw Shadow 7:29 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1970, 0, 'No Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1971, 1, 'Saw Shadow at 7:29 AM; 14 below zero.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1972, 1, 'Saw Shadow 7:30 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1973, 1, 'Saw Shadow 7:29 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1974, 1, 'Saw Shadow 8:28 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1975, 0, 'No Shadow; Declared at 7:31 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1976, 1, 'Saw Shadow at 7:29 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1977, 1, 'Saw Shadow at 7:27; In midst of energy crisis.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1978, 1, 'Saw Shadow at 7:28 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1979, 1, 'Saw Shadow at 7:28 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1980, 1, 'Saw Shadow at 7:29 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1981, 1, 'Saw Shadow at 7:27 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1982, 1, 'Saw Shadow 7:26 AM; After coldest January in more than a century.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1983, 0, 'No Shadow; Peered over at 7:29 AM, but saw no shadow; predicted an early spring after a mild winter.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1984, 1, 'Saw Shadow shortly after 7 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1985, 1, 'Saw Shadow at 7:28 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1986, 0, 'No Shadow! Visited President Reagan at the White House in March.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1987, 1, 'Saw Shadow 7:29 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1988, 0, 'No Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1989, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1990, 0, 'No Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1991, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1992, 1, 'Saw Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1993, 1, 'Saw Shadow. “Groundhog Day” The movie with Bill Murray was released in time for PHIL’S Predition.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1994, 1, 'Saw Shadow 7:28 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1995, 0, 'No Shadow; Guested on the Oprah Winfrey TV Show and made new fans.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1996, 1, 'Saw Shadow 7:21; So cold he dug deep to make his prediction.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1997, 0, 'No Shadow 7:25AM. Made his 110th prediction. Largest crowd the Knob has seen 35,000 people');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1998, 1, 'Saw Shadow 7:20AM; Six more weeks of “El Nino” Winter.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 1999, 0, 'Over 15,000 people celebrated as Phil saw no shadow at 7:23 AM and predicted and early spring');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2000, 1, 'It was the dawn of a new “Phillenium” and 12-degrees at Gobbler’s Knob when Phil saw his shadow at 7:28 AM.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2001, 1, 'Phil’s prediction of 6 more weeks of winter weather was displayed on the Astrovision in New York’s Time Square.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2002, 1, 'Phil saw his shadow at the largest event in 116 year history with estimated 30,000 people celebrating 02/02/02');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2003, 1, 'Phil saw his shadow at 7:25 AM as Pennsylvania’s newly elected Governor Ed Rendell looked on from Gobbler’s Knob.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2004, 1, 'Phil saw his shadow at 7:27 in 8 degree weather. Event was webcast live on www.groundhog.org');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2005, 1, 'The sky was clear as Phil saw his shadow before an enthusiastic crowd of 10-18,000. The time was 7:31 a.m. It was Phil’s 119th prediction.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2006, 1, 'Phil saw his shadow while wearing his Steeler “Terrible Towel” at 7:25 a.m. The temperature was a balmy 38 degrees.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2007, 0, 'No Shadow- Early Spring It was a cloudy morning with light snow flurries when Phil emerged from his burrow at about 7:26 a.m. and did not see his shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2008, 1, 'At 7:28 a.m., 29°, Phil Saw his Shadow.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2009, 1, 'At 7:26 a.m. Phil saw his shadow and Inner Circle President Bill Cooper completed his final interpretation and retired at Gobbler’s Knob.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2010, 1, 'The temperature was 12°. Saw Shadow- Six More Weeks of Winter');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2011, 0, 'No Shadow- Early Spring With rain over head, Phil made his prediction.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2012, 1, 'Six More Weeks of Winter The skies slightly overcast and a temperate of 30°. Phil saw his shadow!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2013, 0, 'No Shadow- Early Spring A Balmy 7° Phil made his prediction at 7:25 a.m.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2014, 1, 'Six More Weeks of Winter With fog in site, Phil made his prediction at 7:26 a.m.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2015, 1, 'Six More Weeks of Winter Was the prediction of Phil. The morning was filled with freezing rain. Phil emerged from his burrow at 7:26 a.m.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2016, 0, 'No Shadow- Early Spring It was 28° at Gobbler’s Knob. Phil made his perdition of an Early Spring at 7:25 a.m.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2017, 1, '7:25 a.m. Saw His Shadow, Six More Weeks of Winter! There were a few snow flurries during the prognostication.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2018, 1, 'At 7:25 a.m. with 18,000 Phil Phans present, Phil saw his shadow! Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2019, 0, 'NO Shadow at 7:28 AM; 14º fog & mist with -1º Wind Chill.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2020, 0, 'NO Shadow at 7:26 AM; 30º with light snow falling.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2021, 1, 'Shadow at 7:25 AM; 19º with light snow. Coronavirus fear prohibits crowds on Gobbler’s Knob.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2022, 1, 'Shadow at 7:27 AM; 27º with clear skies. A loyal crowd of thousands returned to Gobbler’s Knob.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2023, 1, 'Shadow at 7:24 AM; 13º with clear skies. PA Governor Josh Shapiro attends. Thousands of Eagles Super Bowl LVII fans help celebrate Phil’s big day at the Knob.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2024, 0, 'NO Shadow at 7:26 AM; 36º with overcast skies. Miranda Moore, 2023 Miss Pennsylvania was the special guest of the Inner Circle at the Knob.');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2025, 1, 'Shadow at 7:25 AM; 18º with clear skies. Thousands of Eagles Super Bowl LIX fans help celebrate Phil’s forecast. PETA suggests Phil be retired and replaced with “a delicious vegan weather reveal cake.”');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('punxsutawney-phil', 2026, 1, 'Shadow at 7:27 AM; 7º with overcast skies. Victoria Vespico, Miss Pennsylvania 2025, was the guest of honor of the Inner Circle at the Knob. PETA recommends Phil be retired and replaced with “a giant 3D Hologram projection.”');

/* Predictions for queen-city-charlie */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('queen-city-charlie', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('queen-city-charlie', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('queen-city-charlie', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('queen-city-charlie', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('queen-city-charlie', 2026, 1, '');

/* Predictions for sand-mountain-sam */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sand-mountain-sam', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sand-mountain-sam', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sand-mountain-sam', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sand-mountain-sam', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sand-mountain-sam', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sand-mountain-sam', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sand-mountain-sam', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sand-mountain-sam', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sand-mountain-sam', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sand-mountain-sam', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sand-mountain-sam', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sand-mountain-sam', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sand-mountain-sam', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sand-mountain-sam', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sand-mountain-sam', 2026, 0, '');

/* Predictions for schnogadahl-sammi */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 1997, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 1998, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 1999, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2000, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2001, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2002, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2003, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2004, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2005, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2006, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2007, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2008, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2010, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2021, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2022, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('schnogadahl-sammi', 2026, 1, '');

/* Predictions for scramble-the-duck */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('scramble-the-duck', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('scramble-the-duck', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('scramble-the-duck', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('scramble-the-duck', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('scramble-the-duck', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('scramble-the-duck', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('scramble-the-duck', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('scramble-the-duck', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('scramble-the-duck', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('scramble-the-duck', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('scramble-the-duck', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('scramble-the-duck', 2026, 1, '');

/* Predictions for shubenacadie-sam */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 1999, 1, 'Shadow (Long Winter)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2000, 1, 'Shadow (Long Winter)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2001, 0, 'No Shadow (Early Spring)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2002, 0, 'No Shadow (Early Spring)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2003, 0, 'No Shadow (Early Spring)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2004, 0, 'No Shadow (Early Spring)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2005, 1, 'Shadow (Long Winter)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2006, 0, 'No Shadow (Early Spring)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2007, 0, 'No Shadow (Early Spring)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2008, 0, 'No Shadow (Early Spring)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2009, 1, 'Shadow (Long Winter)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2010, 1, 'Shadow (Long Winter)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2011, 0, 'No Shadow (Early Spring)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2012, 0, 'No Shadow (Early Spring)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2013, 1, 'Shadow (Long Winter)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2014, 0, 'No Shadow (Early Spring)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2015, 1, 'Shadow (Long Winter)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2016, 0, 'No Shadow (Early Spring)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2017, 0, 'No Shadow (Early Spring)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2018, 0, 'No Shadow (Early Spring)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2019, 1, 'Shadow (Long Winter)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2020, 1, 'Shadow (Long Winter)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2021, 0, 'No Shadow (Early Spring)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2022, 1, 'Shadow (Long Winter)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2023, 1, 'Shadow (Long Winter)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2024, 0, 'No Shadow (Early Spring)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2025, 1, 'Shadow (Long Winter)');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('shubenacadie-sam', 2026, 0, 'No Shadow (Early Spring)');

/* Predictions for sir-walter-wally */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2000, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2001, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2002, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2003, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2004, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2005, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2006, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2007, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2008, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2010, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2012, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sir-walter-wally', 2022, 1, '');

/* Predictions for smith-lake-jake */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('smith-lake-jake', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('smith-lake-jake', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('smith-lake-jake', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('smith-lake-jake', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('smith-lake-jake', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('smith-lake-jake', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('smith-lake-jake', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('smith-lake-jake', 2023, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('smith-lake-jake', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('smith-lake-jake', 2025, 0, '');

/* Predictions for snack-town-steve */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snack-town-steve', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snack-town-steve', 2026, 1, '');

/* Predictions for snerd */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snerd', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snerd', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snerd', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snerd', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snerd', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snerd', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snerd', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snerd', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snerd', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snerd', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snerd', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snerd', 2026, 1, '');

/* Predictions for snohomish-slew */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2006, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2007, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2008, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2009, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2010, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2012, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2013, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snohomish-slew', 2023, 1, '');

/* Predictions for snowy-the-prairie-dog */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snowy-the-prairie-dog', 2015, 0, 'Snowy DID NOT see her shadow and winter was a no-show during the 2nd half of the season. Accuracy Score: Excellent');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snowy-the-prairie-dog', 2016, 0, 'Snowy DID NOT see her shadow and the 2nd half of winter was mild. Accuracy Score: Excellent');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snowy-the-prairie-dog', 2017, 1, 'Snowy DID see her shadow and winter did indeed continue. Accuracy Score: Excellent');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snowy-the-prairie-dog', 2018, 0, 'Snowy DID NOT see her shadow, but winter weather intensified & persisted into spring. Accuracy Score: Poor');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snowy-the-prairie-dog', 2019, 0, 'Snowy DID NOT see her shadow, but instead of an early spring, we got snow and Arctic air! Accuracy Score: Very Poor!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snowy-the-prairie-dog', 2020, 1, 'Snowy SAW her shadow. A wintry pattern continued, but there were also some nice spring-like days! Her Score: Fair');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snowy-the-prairie-dog', 2021, 0, 'Snowy DID NOT see her shadow and an early spring arrived after some brief cold weather. Accuracy Score: Excellent!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snowy-the-prairie-dog', 2022, 1, 'Snowy DID see her shadow and a mixed bag of wintry weather continued. Accuracy Score: Fair');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('snowy-the-prairie-dog', 2023, 0, 'Snowy DID NOT see her shadow in contradiction to Punxsutawney Phil’s result... Accuracy Score: Stay tuned!');

/* Predictions for st-thomas-sally */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('st-thomas-sally', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('st-thomas-sally', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('st-thomas-sally', 2026, 1, '');

/* Predictions for staten-island-chuck */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1982, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1983, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1984, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1985, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1986, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1987, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1988, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1989, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1990, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1991, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1992, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1993, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1994, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1995, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1996, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1997, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1998, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 1999, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2000, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2001, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2002, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2003, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2004, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2005, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2006, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2007, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2008, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2009, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2013, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('staten-island-chuck', 2026, 1, '');

/* Predictions for stonewall-jackson */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2008, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2016, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stonewall-jackson', 2026, 0, '');

/* Predictions for stormy-marmot */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2006, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2007, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2008, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2009, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2010, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stormy-marmot', 2026, 0, '');

/* Predictions for stumptown-fil */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stumptown-fil', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stumptown-fil', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stumptown-fil', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stumptown-fil', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stumptown-fil', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stumptown-fil', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('stumptown-fil', 2026, 1, '');

/* Predictions for sylvia-the-apex-armadillo */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sylvia-the-apex-armadillo', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sylvia-the-apex-armadillo', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sylvia-the-apex-armadillo', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sylvia-the-apex-armadillo', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sylvia-the-apex-armadillo', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('sylvia-the-apex-armadillo', 2026, 1, '');

/* Predictions for tinicum-tim */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('tinicum-tim', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('tinicum-tim', 2012, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('tinicum-tim', 2013, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('tinicum-tim', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('tinicum-tim', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('tinicum-tim', 2016, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('tinicum-tim', 2017, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('tinicum-tim', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('tinicum-tim', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('tinicum-tim', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('tinicum-tim', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('tinicum-tim', 2022, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('tinicum-tim', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('tinicum-tim', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('tinicum-tim', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('tinicum-tim', 2026, 1, '');

/* Predictions for two-rivers-tunnel */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2013, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('two-rivers-tunnel', 2026, 0, '');

/* Predictions for unadilla-billie */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('unadilla-billie', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('unadilla-billie', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('unadilla-billie', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('unadilla-billie', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('unadilla-billie', 2026, 0, '');

/* Predictions for uni-the-groundhog */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2004, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2005, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2006, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2007, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2008, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2012, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2021, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('uni-the-groundhog', 2026, 1, '');

/* Predictions for van-island-violet */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('van-island-violet', 2017, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('van-island-violet', 2018, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('van-island-violet', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('van-island-violet', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('van-island-violet', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('van-island-violet', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('van-island-violet', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('van-island-violet', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('van-island-violet', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('van-island-violet', 2026, 1, '');

/* Predictions for walnut-the-hedgehog */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('walnut-the-hedgehog', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('walnut-the-hedgehog', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('walnut-the-hedgehog', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('walnut-the-hedgehog', 2026, 0, '');

/* Predictions for wiarton-willie */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1955, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1956, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1957, null, 'No record');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1958, null, 'No record');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1959, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1960, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1961, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1962, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1963, null, 'No record');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1964, null, 'No record');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1965, null, 'No record');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1966, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1967, null, 'No record');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1968, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1969, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1970, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1971, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1972, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1973, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1974, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1975, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1976, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1977, null, 'No record');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1978, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1979, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1980, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1981, null, 'No record');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1982, null, 'No record');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1983, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1984, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1985, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1986, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1987, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1988, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1989, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1990, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1991, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1992, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1993, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1994, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1995, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1996, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1997, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1998, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 1999, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2000, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2001, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2002, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2003, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2004, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2005, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2006, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2007, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2008, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2009, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2010, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2011, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2012, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2013, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2014, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2015, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2016, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2017, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2018, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2019, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2020, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2021, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2022, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2023, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2024, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2025, 0, 'No Shadow, Early Spring!');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wiarton-willie', 2026, 0, 'No Shadow, Early Spring!');

/* Predictions for wildwood-willie */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wildwood-willie', 2011, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wildwood-willie', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wildwood-willie', 2013, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wildwood-willie', 2014, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wildwood-willie', 2015, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wildwood-willie', 2016, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wildwood-willie', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wildwood-willie', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wildwood-willie', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wildwood-willie', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wildwood-willie', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wildwood-willie', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wildwood-willie', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wildwood-willie', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wildwood-willie', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('wildwood-willie', 2026, 0, '');

/* Predictions for woodstock-willie */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 1999, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2000, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2001, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2002, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2003, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2004, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2005, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2006, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2007, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2008, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2010, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2013, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2016, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2021, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2023, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woodstock-willie', 2026, 0, '');

/* Predictions for woody-the-woodchuck */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 1999, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2000, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2001, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2002, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2003, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2004, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2005, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2006, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2007, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2008, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2009, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2010, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2011, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2013, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2014, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2015, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2016, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2017, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2018, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2019, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2024, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('woody-the-woodchuck', 2026, 1, '');

/* Predictions for yahdee-the-groundhog */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yahdee-the-groundhog', 2012, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yahdee-the-groundhog', 2013, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yahdee-the-groundhog', 2014, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yahdee-the-groundhog', 2015, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yahdee-the-groundhog', 2016, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yahdee-the-groundhog', 2017, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yahdee-the-groundhog', 2018, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yahdee-the-groundhog', 2019, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yahdee-the-groundhog', 2020, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yahdee-the-groundhog', 2021, null, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yahdee-the-groundhog', 2022, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yahdee-the-groundhog', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yahdee-the-groundhog', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yahdee-the-groundhog', 2025, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yahdee-the-groundhog', 2026, 1, '');

/* Predictions for yonah-the-groundhog */
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yonah-the-groundhog', 2020, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yonah-the-groundhog', 2021, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yonah-the-groundhog', 2022, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yonah-the-groundhog', 2023, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yonah-the-groundhog', 2024, 0, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yonah-the-groundhog', 2025, 1, '');
INSERT INTO predictions (slug, year, shadow, details) VALUES ('yonah-the-groundhog', 2026, 0, '');

-- Down
DROP TABLE IF EXISTS predictions;
DROP TABLE IF EXISTS groundhogs;
